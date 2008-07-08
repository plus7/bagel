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

static gboolean
is_interfacename(const gchar* name);

gboolean
interface_interface(TreeState *state)
{
    IDL_tree iface = state->tree, iter, orig;
    char *className = IDL_IDENT(IDL_INTERFACE(iface).ident).str;
    char *classNameUpper = NULL;
    char *classNameImpl = NULL;
    char *cp;
    gboolean ok = TRUE;
    gboolean keepvtable;
    const char *iid;
    const char *name_space;
    struct nsID id;
    char iid_parsed[UUID_LENGTH];
    GSList *doc_comments = IDL_IDENT(IDL_INTERFACE(iface).ident).comments;

    if (!verify_interface_declaration(iface))
        return FALSE;

#define FAIL    do {ok = FALSE; goto out;} while(0)

    if (comment_level >= 2)
        fprintf(state->file,   "\n(* starting interface:    %s *)\n",
                className);

    name_space = IDL_tree_property_get(IDL_INTERFACE(iface).ident, "namespace");
    if (name_space && comment_level >= 2) {
        fprintf(state->file, "(* namespace:             %s *)\n",
                name_space);
        fprintf(state->file, "(* fully qualified name:  %s.%s *)\n",
                name_space,className);
    }

    iid = IDL_tree_property_get(IDL_INTERFACE(iface).ident, "uuid");

    if (doc_comments != NULL && comment_level >= 2)
        printlist(state->file, doc_comments);

    /*
     * NS_NO_VTABLE is defined in nsISupportsUtils.h, and defined on windows
     * to __declspec(novtable) on windows.  This optimization is safe
     * whenever the constructor calls no virtual methods.  Writing in IDL
     * almost guarantees this, except for the case when a %{C++ block occurs in
     * the interface.  We detect that case, and emit a macro call that disables
     * the optimization.
     */
    keepvtable = FALSE;
    for (iter = IDL_INTERFACE(state->tree).body;
         iter != NULL;
         iter = IDL_LIST(iter).next)
    {
        IDL_tree data = IDL_LIST(iter).data;
        if (IDL_NODE_TYPE(data) == IDLN_CODEFRAG)
            keepvtable = TRUE;
    }
    
    /* The interface declaration itself. */
    write_indent(state->file);
    fprintf(state->file,
            "%s = interface",
            className);
    
    if ((iter = IDL_INTERFACE(iface).inheritance_spec)) {
        if (IDL_LIST(iter).next != NULL) {
            IDL_tree_error(iter,
                           "multiple inheritance is not supported by xpidl");
            FAIL;
        }
        fprintf(state->file, "(%s)", IDL_IDENT(IDL_LIST(iter).data).str);
    }
    fputc('\n', state->file);

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

        /* ['{00000000-0000-0000-c000-000000000046}'] */
        write_indent(state->file);
        fprintf(state->file, "[\'{%s}\']", iid_parsed);
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

    write_indent(state->file);
    fputs("end;\n", state->file);
    fputc('\n', state->file);

#undef FAIL

out:
    if (classNameUpper)
        free(classNameUpper);
    if (classNameImpl)
        free(classNameImpl);
    return ok;
}

gboolean
interface_write_type(IDL_tree type_tree, gboolean is_out, gboolean is_array, gboolean is_const, gboolean is_qiresult, const char* param_name, FILE *outfile)
{
    if (!type_tree) {
        /*fputs("hoge", outfile);*/
        return TRUE;
    }

    if (param_name) {
        if (!is_out &&
            (IDL_NODE_TYPE(type_tree) == IDLN_TYPE_STRING ||
             IDL_NODE_TYPE(type_tree) == IDLN_TYPE_WIDE_STRING ||
             IDL_tree_property_get(type_tree, "nsid") ||
             IDL_tree_property_get(type_tree, "domstring")  ||
             IDL_tree_property_get(type_tree, "utf8string") ||
             IDL_tree_property_get(type_tree, "cstring")    ||
             IDL_tree_property_get(type_tree, "astring")    ||
             is_array)) {
            fputs("const ", outfile);
        } else
        if (IDL_tree_property_get(type_tree, "ref") && !is_out && !DIPPER_TYPE(type_tree)) {
            fputs("var ", outfile);
        }
        /*else if (is_out &&
                 IDL_tree_property_get(IDL_PARAM_DCL(param_tree).simple_declarator, 
                                       "shared")) {
            fputs("const ", outfile);
        }*/

        /* out and inout params get a bonus '*' (unless this is type that has a 
         * 'dipper' class that is passed in to receive 'out' data) 
         */
        if (is_out &&
            !DIPPER_TYPE(type_tree)) {
            fputs("out ", outfile);
        }

        if( is_reserved(param_name) )
            fputc('_', outfile);
        fputs(param_name, outfile);
        if( is_array ) {
            fputs("_array", outfile);
            return TRUE;
        }
    }
    
    switch (IDL_NODE_TYPE(type_tree)) {
      case IDLN_TYPE_INTEGER: {
        gboolean sign = IDL_TYPE_INTEGER(type_tree).f_signed;
        fputs(": ", outfile);
        switch (IDL_TYPE_INTEGER(type_tree).f_type) {
          case IDL_INTEGER_TYPE_SHORT:
            fputs(sign ? "PRInt16" : "PRUint16", outfile);
            break;
          case IDL_INTEGER_TYPE_LONG:
            fputs(sign ? "PRInt32" : "PRUint32", outfile);
            break;
          case IDL_INTEGER_TYPE_LONGLONG:
            fputs(sign ? "PRInt64" : "PRUint64", outfile);
            break;
          default:
            g_error("Unknown integer type %d\n",
                    IDL_TYPE_INTEGER(type_tree).f_type);
            return FALSE;
        }
        if(is_array)
          fputs("Array", outfile);
        break;
      }
      case IDLN_TYPE_CHAR:
        if(is_array)
          fputs(": PAnsiCharArray", outfile);
        else
          fputs(": AnsiChar", outfile);
        break;
      case IDLN_TYPE_WIDE_CHAR:
        if(is_array)
          fputs(": PWideCharArray", outfile);
        else
          fputs(": WideChar", outfile); /* wchar_t? */
        break;
      case IDLN_TYPE_WIDE_STRING:
        if(is_array)
          fputs(": PPWideCharArray", outfile);
        else
          fputs(": PWideChar", outfile);
        break;
      case IDLN_TYPE_STRING:
        if(is_array)
          fputs(": PPAnsiCharArray", outfile);
        else
          fputs(": PAnsiChar", outfile);
        break;
      case IDLN_TYPE_BOOLEAN:
        fputs(": PRBool", outfile);
        if(is_array)
          fputs("Array", outfile);
        break;
      case IDLN_TYPE_OCTET:
        fputs(": PRUint8", outfile);
        if(is_array)
          fputs("Array", outfile);
        break;
      case IDLN_TYPE_FLOAT:
        switch (IDL_TYPE_FLOAT(type_tree).f_type) {
          case IDL_FLOAT_TYPE_FLOAT:
            fputs(": Single", outfile);
            break;
          case IDL_FLOAT_TYPE_DOUBLE:
            fputs(": Double", outfile);
            break;
          /* XXX 'long double' just ignored, or what? */
          default:
            fprintf(outfile, "unknown_type_%d", IDL_NODE_TYPE(type_tree));
            break;
        }
        if(is_array)
          fputs("Array", outfile);
        break;
      case IDLN_IDENT:
        if (is_array) {
            // do nothing
        } else if (UP_IS_NATIVE(type_tree)) {
            if (IDL_tree_property_get(type_tree, "domstring") ||
                IDL_tree_property_get(type_tree, "astring")) {
                fputs(": nsAString", outfile);
            } else if (IDL_tree_property_get(type_tree, "utf8string")) {
                fputs(": nsACString", outfile);
            } else if (IDL_tree_property_get(type_tree, "cstring")) {
                fputs(": nsACString", outfile);
            } else if (is_qiresult) {
                if (!is_out)
                    fputs(": nsISupports", outfile);
            } else if (IDL_tree_property_get(type_tree, "nsid")) {
                if (IDL_tree_property_get(type_tree, "ptr"))
                    fputs(": PGUID", outfile);
                else
                    fputs(": TGUID", outfile);
            } else {
                const char* type=IDL_NATIVE(IDL_NODE_UP(type_tree)).user_type;
                fputs(": ", outfile);
                if (IDL_tree_property_get(type_tree, "ptr")) {
                    if (strcmp(type, "void")==0) {
                        fputs("Pointer", outfile);
                    } else {
                        if( !is_interfacename(type) )
                            fputc('P', outfile);
                        fputs(type, outfile);
                    }
                } else {
                    fputs(type, outfile);
                }
            }
            /*
            if ( !(IDL_tree_property_get(type_tree, "domstring")) &&
                 !(IDL_tree_property_get(type_tree, "astring")) &&
                 !(IDL_tree_property_get(type_tree, "utf8string")) &&
                 !(IDL_tree_property_get(type_tree, "cstring")) &&
                 !(IDL_tree_property_get(type_tree, "nsqiresult")) )
            {
              if (IDL_tree_property_get(type_tree, "ptr")) {
                  fputs(" P", outfile);
              } else if (IDL_tree_property_get(type_tree, "ref")) {
                  fputs(" var", outfile);
              }
            }
            */
        } else {
            fprintf(outfile, ": %s", IDL_IDENT(type_tree).str);
        }
        /*if (UP_IS_AGGREGATE(type_tree))
            fputs(" aggregate", outfile);*/
        break;
      default:
        fprintf(outfile, "unknown_type_%d", IDL_NODE_TYPE(type_tree));
        break;
    }
    return TRUE;
}

gboolean
is_reserved(const char *name)
{
    static const char *reserved[] = {
        "and", "array", "as", "asm", "at", "begin", "case", "class", "const",
        "constructor", "contains", "destructor", "dispinterface", "div", "do",
        "downto", "else", "end", "except", "exports", "file", "finalization",
        "finally", "for", "function", "goto", "if", "implementation",
        "implements", "in", "inherited", "initialization", "interface", "is",
        "label", "library", "mod", "nil", "not", "of", "object", "on", "or",
        "out", "package", "packed", "procedure", "program", "property", "raise"
        "record", "repeat", "requires", "result", "self", "set", "shl", "shr",
        "then", "threadvar", "to", "try", "type", "unit", "uses", "until",
        "var", "while", "with", "xor",
        NULL
    };
    int i=0;
    
    while(reserved[i] != NULL) {
        if(strcmpi(name, reserved[i])==0)
            return TRUE;
        i++;
    }
    return FALSE;
}

static gboolean
is_interfacename(const gchar* name)
{
    const gchar* ptr = name;
    
    while(islower(*ptr)) ptr++;
    
    if (ptr == name) return FALSE;
    if (*ptr == 'I' && *(ptr+1) != '\0') return TRUE;
    if (*ptr == 'P' && *(ptr+1) == 'I' && *(ptr+2) != '\0') return TRUE;
    
    return FALSE;
}

gboolean
do_enum(TreeState *state)
{
    IDL_tree_error(state->tree, "enums not supported, "
                   "see http://bugzilla.mozilla.org/show_bug.cgi?id=8781");
    return FALSE;
}

/*
 * param generation:
 * in string foo        -->     nsString *foo
 * out string foo       -->     nsString **foo;
 * inout string foo     -->     nsString **foo;
 */

/* If notype is true, just write the param name. */
gboolean
write_param(IDL_tree param_tree, FILE *outfile)
{
    IDL_tree param_type_spec = IDL_PARAM_DCL(param_tree).param_type_spec;
    gboolean is_in = IDL_PARAM_DCL(param_tree).attr == IDL_PARAM_IN;
    gboolean is_array, is_const;
    gboolean is_qiresult;
    const char* param_name = IDL_IDENT(IDL_PARAM_DCL(param_tree).simple_declarator).str;

    /* arrays get a bonus * too */
    /* XXX Should this be a leading '*' or a trailing "[]" ?*/
    is_array = (gboolean)IDL_tree_property_get(IDL_PARAM_DCL(param_tree).simple_declarator, "array");
    is_const = (gboolean)IDL_tree_property_get(IDL_PARAM_DCL(param_tree).simple_declarator, "const");
    is_qiresult = (gboolean)IDL_tree_property_get(IDL_PARAM_DCL(param_tree).simple_declarator, "iid_is");
    if (!interface_write_type(param_type_spec, !is_in, is_array, is_const, is_qiresult, param_name, outfile))
        return FALSE;

    return TRUE;
}

write_method_signature_func_type write_method_signature_func;
/*
 * A method is an `operation', therefore a method decl is an `op dcl'.
 * I blame Elliot.
 */
gboolean
op_dcl(TreeState *state)
{
    GSList *doc_comments = IDL_IDENT(IDL_OP_DCL(state->tree).ident).comments;
    struct _IDL_OP_DCL *op;
    char *name;

    /*
     * Verify that e.g. non-scriptable methods in [scriptable] interfaces
     * are declared so.  Do this in a separate verification pass?
     */
    if (!verify_method_declaration(state->tree))
        return FALSE;

    op = &IDL_OP_DCL(state->tree);
    name = IDL_IDENT(op->ident).str;

    if (strcmpi(name, "QueryInterface")==0 ||
        strcmpi(name, "AddRef")==0 ||
        strcmpi(name, "Release")==0)
        return TRUE;
        
    if (doc_comments != NULL && comment_level >= 2) {
        write_indent(state->file);
        printlist(state->file, doc_comments);
    }
    xpidl_write_comment(state, 2);

    write_indent(state->file);
    write_indent(state->file);
    if (!write_method_signature_func(state->tree, state->file, NULL))
        return FALSE;
    fputs(";\n", state->file);

    return TRUE;
}

