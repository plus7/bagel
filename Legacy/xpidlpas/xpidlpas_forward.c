/* -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: NPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Netscape Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/NPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is mozilla.org code.
 *
 * The Initial Developer of the Original Code is 
 * Netscape Communications Corporation.
 * Portions created by the Initial Developer are Copyright (C) 1998
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Itou Takanori <necottie@nesitive.net>
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or 
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the NPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the NPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

/*
 * Generate XPCOM headers from XPIDL.
 */

#include "xpidlpas.h"
#include <ctype.h>

#define AS_DECL 0
#define AS_CALL 1
#define AS_IMPL 2

static gboolean write_method_signature(IDL_tree method_tree, FILE *outfile,
                                       int mode, const char *className);
static gboolean write_attr_accessor(IDL_tree attr_tree, FILE * outfile,
                                    gboolean getter, 
                                    int mode, const char *className);

static gboolean
interface(TreeState *state)
{
    IDL_tree iface = state->tree, iter, orig;
    char *className = IDL_IDENT(IDL_INTERFACE(iface).ident).str;

    if (!verify_interface_declaration(iface))
        return FALSE;

    /* The interface declaration itself. */
    write_indent(state->file);
    fprintf(state->file,
            "%s = interface;\n",
            className);
    
    return TRUE;
}

static gboolean
codefrag(TreeState *state)
{
    const char *desc = IDL_CODEFRAG(state->tree).desc;
    GSList *lines = IDL_CODEFRAG(state->tree).lines;
    guint fragment_length;
    
    if (strcmp(desc, "PASCAL") && /* libIDL bug? */ strcmp(desc, "PASCAL\r") &&
        strcmp(desc, "PASCAL_FORWARD") && strcmp(desc, "PASCAL_FORWARD\r")) {
        XPIDL_WARNING((state->tree, IDL_WARNING1,
                       "ignoring '%%{%s' escape. "
                       "(Use '%%{PASCAL' or '%%{PASCAL_FORWARD' to escape verbatim PASCAL code.)", desc));

        return TRUE;
    }

    /*
     * Emit #file directive to point debuggers back to the original .idl file
     * for the duration of the code fragment.  We look at internal IDL node
     * properties _file, _line to do this; hopefully they won't change.
     *
     * _line seems to refer to the line immediately after the closing %}, so
     * we backtrack to get the proper line for the beginning of the block.
     */
    /*
     * Looks like getting this right means maintaining an accurate line
     * count of everything generated, so we can set the file back to the
     * correct line in the generated file afterwards.  Skipping for now...
     */

    fragment_length = g_slist_length(lines);
/*      fprintf(state->file, "#line %d \"%s\"\n", */
/*              state->tree->_line - fragment_length - 1, */
/*              state->tree->_file); */

    g_slist_foreach(lines, write_codefrag_line, (gpointer)state);

    return TRUE;
}

backend *
xpidl_forward_dispatch(void)
{
    static backend result;
    static nodeHandler table[IDLN_LAST];
    static gboolean initialized = FALSE;
    
    result.emit_prolog = pascal_prolog;
    result.emit_epilog = pascal_epilog;

    if (!initialized) {
        table[IDLN_LIST] = pascal_list;
        table[IDLN_INTERFACE] = interface;
        table[IDLN_CODEFRAG] = codefrag;
        table[IDLN_NATIVE] = check_native;
        initialized = TRUE;
    }

    result.dispatch_table = table;
    return &result;
}
