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

static void
write_classname_iid_define(FILE *file, const char *className)
{
    const char *iidName;
    if (className[0] == 'n' && className[1] == 's') {
        /* backcompat naming styles */
        fputs("NS_", file);
        iidName = className + 2;
    } else {
        iidName = className;
    }
    while (*iidName)
        fputc(toupper(*iidName++), file);
    fputs("_IID", file);
}

static void
write_classname_const_define(FILE *file, const char *className)
{
    const char *iidName;
    if (className[0] == 'n' && className[1] == 's') {
        /* backcompat naming styles */
        fputs("NS_", file);
        iidName = className + 2;
    } else {
        iidName = className;
    }
    while (*iidName)
        fputc(toupper(*iidName++), file);
}

static gboolean
interface(TreeState *state)
{
    IDL_tree iface = state->tree, iter, orig;
    char *className = IDL_IDENT(IDL_INTERFACE(iface).ident).str;
    gboolean ok = TRUE;
    const char *iid;
    struct nsID id;
    char iid_parsed[UUID_LENGTH];
    GSList *doc_comments = IDL_IDENT(IDL_INTERFACE(iface).ident).comments;

    if (!verify_interface_declaration(iface))
        return FALSE;

#define FAIL    do {ok = FALSE; goto out;} while(0)

    iid = IDL_tree_property_get(IDL_INTERFACE(iface).ident, "uuid");
    if (iid) {
        /* Redundant, but a better error than 'cannot parse.' */
        if (strlen(iid) != 36) {
            IDL_tree_error(state->tree, "IID %s is the wrong length\n", iid);
            FAIL;
        }

        /*
         * Parse uuid and then output resulting nsID to string, to validate
         * uuid and normalize resulting .h files.
         */
        if (!xpidl_parse_iid(&id, iid)) {
            IDL_tree_error(state->tree, "cannot parse IID %s\n", iid);
            FAIL;
        }
        if (!xpidl_sprint_iid(&id, iid_parsed)) {
            IDL_tree_error(state->tree, "error formatting IID %s\n", iid);
            FAIL;
        }

        /* NS_ISUPPORTS_IID: TGUID = '{00000000-0000-0000-c000-000000000046}'; */
        /*fputs("#define ", state->file);*/
        write_indent(state->file);
        write_classname_iid_define(state->file, className);
        fprintf(state->file, ": TGUID = \'{%s}\';", iid_parsed);
        fputc('\n', state->file);
    } else {
        IDL_tree_error(state->tree, "interface %s lacks a uuid attribute\n", 
            className);
        FAIL;
    }

    orig = state->tree; /* It would be nice to remove this state-twiddling. */

    state->tree = IDL_INTERFACE(iface).body;

    if (state->tree && !xpidl_process_node(state))
        FAIL;

    fputc('\n', state->file);
    
#undef FAIL

out:
    return ok;
}

static gboolean
do_const_dcl(TreeState *state)
{
    IDL_tree parent = IDL_get_parent_node(state->tree, IDLN_INTERFACE, NULL);
    /*IDL_tree parent = state->tree->up;*/
    char *className = IDL_IDENT(IDL_INTERFACE(parent).ident).str;
    gboolean ok = FALSE;
    struct _IDL_CONST_DCL *dcl = &IDL_CONST_DCL(state->tree);
    const char *name = IDL_IDENT(dcl->ident).str;
    gboolean is_signed;
    GSList *doc_comments = IDL_IDENT(dcl->ident).comments;
    IDL_tree real_type;
    const char *const_format;

    if (!verify_const_declaration(state->tree))
        goto FAIL;

    if (doc_comments != NULL && comment_level >= 2) {
        write_indent(state->file);
        printlist(state->file, doc_comments);
    }

    /* Could be a typedef; try to map it to the real type. */
    real_type = find_underlying_type(dcl->const_type);
    real_type = real_type ? real_type : dcl->const_type;
    is_signed = IDL_TYPE_INTEGER(real_type).f_signed;

    const_format = is_signed ? "%" IDL_LL "d" : "%" IDL_LL "u";
    write_indent(state->file);
    write_classname_const_define(state->file, className);
    fprintf(state->file, "_%s = ", name);
    fprintf(state->file, const_format, IDL_INTEGER(dcl->const_exp).value);
    fprintf(state->file, ";\n");

    ok = TRUE;
FAIL:;
    return ok;
}

static gboolean
codefrag(TreeState *state)
{
    const char *desc = IDL_CODEFRAG(state->tree).desc;
    GSList *lines = IDL_CODEFRAG(state->tree).lines;
    guint fragment_length;
    
    if (strcmp(desc, "PASCAL") && /* libIDL bug? */ strcmp(desc, "PASCAL\r")) {
        XPIDL_WARNING((state->tree, IDL_WARNING1,
                       "ignoring '%%{%s' escape. "
                       "(Use '%%{PASCAL' to escape verbatim PASCAL code.)", desc));

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
xpidl_const_dispatch(void)
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
        table[IDLN_CONST_DCL] = do_const_dcl;
        table[IDLN_NATIVE] = check_native;
        initialized = TRUE;
    }

    result.dispatch_table = table;
    return &result;
}
