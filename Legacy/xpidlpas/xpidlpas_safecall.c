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

static gboolean write_method_signature(IDL_tree method_tree, FILE *outfile,
                                       const char *className);
static gboolean write_attr_accessor(IDL_tree attr_tree, FILE * outfile,
                                    gboolean getter, 
                                    const char *className);

/*
 * An attribute declaration looks like:
 *
 * [ IDL_ATTR_DCL]
 *   - param_type_spec [IDL_TYPE_* or NULL for void]
 *   - simple_declarations [IDL_LIST]
 *     - data [IDL_IDENT]
 *     - next [IDL_LIST or NULL if no more idents]
 *       - data [IDL_IDENT]
 */

#define ATTR_IDENT(tree) (IDL_IDENT(IDL_LIST(IDL_ATTR_DCL(tree).simple_declarations).data))
#define ATTR_TYPE_DECL(tree) (IDL_ATTR_DCL(tree).param_type_spec)
#define ATTR_TYPE(tree) (IDL_NODE_TYPE(ATTR_TYPE_DECL(tree)))

static gboolean
write_attr_accessor(IDL_tree attr_tree, FILE * outfile,
                    gboolean getter, const char *className)
{
    char *attrname = ATTR_IDENT(attr_tree).str;

    if (getter && !DIPPER_TYPE(ATTR_TYPE_DECL(attr_tree)))
        fputs("function ", outfile);
    else
        fputs("procedure ", outfile);

    fprintf(outfile, "%cet%c%s(",
            getter ? 'G' : 'S',
            toupper(*attrname), attrname + 1);
    /* Setters for string, wstring, nsid, domstring, utf8string, 
     * cstring and astring get const. 
     */
    if (!getter &&
        (IDL_NODE_TYPE(ATTR_TYPE_DECL(attr_tree)) == IDLN_TYPE_STRING ||
         IDL_NODE_TYPE(ATTR_TYPE_DECL(attr_tree)) == IDLN_TYPE_WIDE_STRING ||
         IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "nsid") ||
         IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "domstring")  ||
         IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "utf8string") ||
         IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "cstring")    ||
         IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "astring")))
    {
        fputs("const ", outfile);
    }
    if (!getter || DIPPER_TYPE(ATTR_TYPE_DECL(attr_tree))) {
        fprintf(outfile, "a%c%s", toupper(attrname[0]), attrname + 1);
        if (!interface_write_type(ATTR_TYPE_DECL(attr_tree), getter, FALSE, FALSE, FALSE, NULL, outfile))
            return FALSE;
    }
    fputc(')', outfile);
    if (getter && !DIPPER_TYPE(ATTR_TYPE_DECL(attr_tree))) {
        if (!interface_write_type(ATTR_TYPE_DECL(attr_tree), getter, FALSE, FALSE, FALSE, NULL, outfile))
            return FALSE;
    }
    return TRUE;
}

static gboolean
write_attr_property(IDL_tree attr_tree, FILE * outfile, const char *className)
{
    char *attrname = ATTR_IDENT(attr_tree).str;
    gboolean readonly = IDL_ATTR_DCL(attr_tree).f_readonly;

    if(IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "domstring")  ||
       IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "utf8string") ||
       IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "cstring")    ||
       IDL_tree_property_get(ATTR_TYPE_DECL(attr_tree), "astring")) {
        return TRUE;
    }
    
    write_indent(outfile);
    write_indent(outfile);
    
    fputs("property ", outfile);
    if ( is_reserved(attrname) )
        fputc('_', outfile);
    fprintf(outfile, "%c%s", toupper(attrname[0]), attrname + 1);
    
    if (!interface_write_type(ATTR_TYPE_DECL(attr_tree), FALSE, FALSE, FALSE, FALSE, NULL, outfile))
        return FALSE;
        
    fprintf(outfile, " read Get%c%s", toupper(attrname[0]), attrname + 1);
    if (!readonly)
        fprintf(outfile, " write Set%c%s", toupper(attrname[0]), attrname + 1);
    fputs(";\n", outfile);

    return TRUE;
}

static gboolean
attr_dcl(TreeState *state)
{
    GSList *doc_comments;

    if (!verify_attribute_declaration(state->tree))
        return FALSE;

    doc_comments =
        IDL_IDENT(IDL_LIST(IDL_ATTR_DCL
                           (state->tree).simple_declarations).data).comments;

    if (doc_comments != NULL && comment_level >= 2) {
        write_indent(state->file);
        printlist(state->file, doc_comments);
    }

    /*
     * XXX lists of attributes with the same type, e.g.
     * attribute string foo, bar sil;
     * are legal IDL... but we don't do anything with 'em.
     */
    if (IDL_LIST(IDL_ATTR_DCL(state->tree).simple_declarations).next != NULL) {
        XPIDL_WARNING((state->tree, IDL_WARNING1,
                       "multiple attributes in a single declaration aren't "
                       "currently supported by xpidl"));
    }

    xpidl_write_comment(state, 2);

    write_indent(state->file);
    write_indent(state->file);
    if (!write_attr_accessor(state->tree, state->file, TRUE, NULL))
        return FALSE;
    fputs("; safecall;\n", state->file);

    if (!IDL_ATTR_DCL(state->tree).f_readonly) {
        write_indent(state->file);
        write_indent(state->file);
        if (!write_attr_accessor(state->tree, state->file, FALSE, NULL))
            return FALSE;
        fputs("; safecall;\n", state->file);
    }
    
    write_attr_property(state->tree, state->file, NULL);
    

    return TRUE;
}

/*
 * Shared between the interface class declaration and the NS_DECL_IFOO macro
 * provided to aid declaration of implementation classes.  
 * mode...
 */
static gboolean
write_method_signature(IDL_tree method_tree, FILE *outfile, const char *className)
{
    struct _IDL_OP_DCL *op = &IDL_OP_DCL(method_tree);
    gboolean no_generated_args = TRUE;
    gboolean op_notxpcom =
        (IDL_tree_property_get(op->ident, "notxpcom") != NULL);
    gboolean op_string_result =
        op->op_type_spec && (
        IDL_tree_property_get(op->op_type_spec, "domstring") ||
        IDL_tree_property_get(op->op_type_spec, "utf8string") ||
        IDL_tree_property_get(op->op_type_spec, "astring") ||
        IDL_tree_property_get(op->op_type_spec, "acstring"));
    const char *name;
    IDL_tree iter;

    if (!op->op_type_spec || op_string_result)
        fputs("procedure ", outfile);
    else
        fputs("function ", outfile);

    name = IDL_IDENT(op->ident).str;
    if( is_reserved(name) )
        fputc('_', outfile);
    fprintf(outfile, "%c%s(", toupper(*name), name + 1);

    for (iter = op->parameter_dcls; iter; iter = IDL_LIST(iter).next) {
        if (!write_param(IDL_LIST(iter).data, outfile))
            return FALSE;
        if ((IDL_LIST(iter).next || op->f_varargs || op_string_result))
            fputs("; ", outfile);
        no_generated_args = FALSE;
    }

    /* make IDL return value into trailing out argument */
    if (op->op_type_spec && !op_notxpcom && op->f_varargs || op_string_result) {
        IDL_tree fake_param = IDL_param_dcl_new(IDL_PARAM_OUT,
                                                op->op_type_spec,
                                                IDL_ident_new("_retval"));
        if (!fake_param)
            return FALSE;
        if (!write_param(fake_param, outfile))
            return FALSE;
        no_generated_args = FALSE;
    }

    fputc(')', outfile);

    /* varargs go last */
    if (op->f_varargs) {
        fputs(": PVarArgs", outfile);
        no_generated_args = FALSE;
    } else
    if (op->op_type_spec && !op_string_result) {
        if (!interface_write_type(op->op_type_spec, FALSE, FALSE, FALSE, FALSE, NULL, outfile))
            return FALSE;
    }
    if (op_notxpcom)
        fputs("; stdcall", outfile);
    else
        fputs("; safecall", outfile);

    return TRUE;
}

static gboolean
codefrag(TreeState *state)
{
    const char *desc = IDL_CODEFRAG(state->tree).desc;
    GSList *lines = IDL_CODEFRAG(state->tree).lines;
    guint fragment_length;
    
    if (strcmp(desc, "PASCAL") && /* libIDL bug? */ strcmp(desc, "PASCAL\r") &&
        strcmp(desc, "PASCAL_INTERFACE") && strcmp(desc, "PASCAL_INTERFACE\r") &&
        strcmp(desc, "PASCAL_INTERFACE_SAFECALL") && strcmp(desc, "PASCAL_INTERFACE_SAFECALL\r")) {
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
xpidl_safecall_dispatch(void)
{
    static backend result;
    static nodeHandler table[IDLN_LAST];
    static gboolean initialized = FALSE;
    
    result.emit_prolog = pascal_prolog;
    result.emit_epilog = pascal_epilog;

    write_method_signature_func = write_method_signature;

    if (!initialized) {
        table[IDLN_LIST] = pascal_list;
        table[IDLN_ATTR_DCL] = attr_dcl;
        table[IDLN_OP_DCL] = op_dcl;
        table[IDLN_TYPE_ENUM] = do_enum;
        table[IDLN_INTERFACE] = interface_interface;
        table[IDLN_CODEFRAG] = codefrag;
        table[IDLN_NATIVE] = check_native;
        initialized = TRUE;
    }

    result.dispatch_table = table;
    return &result;
}
