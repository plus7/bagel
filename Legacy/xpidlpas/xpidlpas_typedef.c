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
write_type(IDL_tree type_tree, gboolean is_out, gboolean is_array, FILE *outfile)
{
    if (!type_tree) {
        /*fputs("hoge", outfile);*/
        return TRUE;
    }

    switch (IDL_NODE_TYPE(type_tree)) {
      case IDLN_TYPE_INTEGER: {
        gboolean sign = IDL_TYPE_INTEGER(type_tree).f_signed;
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
          fputs("PAnsiCharArray", outfile);
        else
          fputs("AnsiChar", outfile);
        break;
      case IDLN_TYPE_WIDE_CHAR:
        if(is_array)
          fputs("PWideCharArray", outfile);
        else
          fputs("WideChar", outfile); /* wchar_t? */
        break;
      case IDLN_TYPE_WIDE_STRING:
        if(is_array)
          fputs("PPWideCharArray", outfile);
        else
          fputs("PWideChar", outfile);
        break;
      case IDLN_TYPE_STRING:
        if(is_array)
          fputs("PPAnsiCharArray", outfile);
        else
          fputs("PAnsiChar", outfile);
        break;
      case IDLN_TYPE_BOOLEAN:
        fputs("PRBool", outfile);
        if(is_array)
          fputs("Array", outfile);
        break;
      case IDLN_TYPE_OCTET:
        fputs("PRUint8", outfile);
        if(is_array)
          fputs("Array", outfile);
        break;
      case IDLN_TYPE_FLOAT:
        switch (IDL_TYPE_FLOAT(type_tree).f_type) {
          case IDL_FLOAT_TYPE_FLOAT:
            fputs("Single", outfile);
            break;
          case IDL_FLOAT_TYPE_DOUBLE:
            fputs("Double", outfile);
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
        if (UP_IS_NATIVE(type_tree)) {
            if (IDL_tree_property_get(type_tree, "domstring") ||
                IDL_tree_property_get(type_tree, "astring")) {
                fputs("nsAString", outfile);
            } else if (IDL_tree_property_get(type_tree, "utf8string")) {
                fputs("nsACString", outfile);
            } else if (IDL_tree_property_get(type_tree, "cstring")) {
                fputs("nsACString", outfile);
            } else if (IDL_tree_property_get(type_tree, "nsqiresult")) {
                /* Do nothing */
            } else if (IDL_tree_property_get(type_tree, "nsid")) {
                if (IDL_tree_property_get(type_tree, "ptr"))
                    fputs("PGUID", outfile);
                else
                    fputs("TGUID", outfile);
            } else {
                const char* type=IDL_NATIVE(IDL_NODE_UP(type_tree)).user_type;
                if(strcmp(type, "voidPtr"))
                    fputs("Pointer", outfile);
                else
                    fputs(type, outfile);
            }
            /*
            if ( !(IDL_tree_property_get(type_tree, "domstring")) &&
                 !(IDL_tree_property_get(type_tree, "astring")) &&
                 !(IDL_tree_property_get(type_tree, "utf8string")) &
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
            fprintf(outfile, "%s", IDL_IDENT(type_tree).str);
        }
        /*if (UP_IS_AGGREGATE(type_tree))
            fputs(" aggregate", outfile);*/
        if(is_array)
          fputs("Array", outfile);
        break;
      default:
        fprintf(outfile, "unknown_type_%d", IDL_NODE_TYPE(type_tree));
        break;
    }
    return TRUE;
}

static gboolean
do_typedef(TreeState *state)
{
    IDL_tree type = IDL_TYPE_DCL(state->tree).type_spec;
    IDL_tree dcls = IDL_TYPE_DCL(state->tree).dcls;
    IDL_tree complex;
    GSList *doc_comments;

    if (IDL_NODE_TYPE(type) == IDLN_TYPE_SEQUENCE) {
        XPIDL_WARNING((state->tree, IDL_WARNING1,
                       "sequences not supported, ignored"));
    } else {
        if (IDL_NODE_TYPE(complex = IDL_LIST(dcls).data) == IDLN_TYPE_ARRAY) {
            IDL_tree dim = IDL_TYPE_ARRAY(complex).size_list;
            doc_comments = IDL_IDENT(IDL_TYPE_ARRAY(complex).ident).comments;

            if (doc_comments != NULL && comment_level >= 2)
                printlist(state->file, doc_comments);

            write_indent(state->file);
            fprintf(state->file, "%s = array ",
                    IDL_IDENT(IDL_TYPE_ARRAY(complex).ident).str);
            fputc('[', state->file);
            do {
                fputs("0..", state->file);
                if (IDL_LIST(dim).data) {
                    fprintf(state->file, "%ld",
                            (long)IDL_INTEGER(IDL_LIST(dim).data).value);
                }
                fputc(']', state->file);
                if ((dim = IDL_LIST(dim).next) != NULL) {
                    fputs(", ", state->file);
                } else {
                    break;
                }
            } while (1);
            fputs("] of ", state->file);
            if (!write_type(type, FALSE, FALSE, state->file))
                return FALSE;
        } else {
            doc_comments = IDL_IDENT(IDL_LIST(dcls).data).comments;

            if (doc_comments != NULL)
                printlist(state->file, doc_comments);

            write_indent(state->file);
            fputs(IDL_IDENT(IDL_LIST(dcls).data).str, state->file);
            fputs(" = ", state->file);
            if (!write_type(type, FALSE, FALSE, state->file))
                return FALSE;
        }
        fputs(";\n", state->file);
    }
    return TRUE;
}

static gboolean
codefrag(TreeState *state)
{
    const char *desc = IDL_CODEFRAG(state->tree).desc;
    GSList *lines = IDL_CODEFRAG(state->tree).lines;
    guint fragment_length;
    
    if (strcmp(desc, "PASCAL") && /* libIDL bug? */ strcmp(desc, "PASCAL\r") &&
        strcmp(desc, "PASCAL_TYPEDEF") && strcmp(desc, "PASCAL_TYPEDEF\r")) {
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
xpidl_typedef_dispatch(void)
{
    static backend result;
    static nodeHandler table[IDLN_LAST];
    static gboolean initialized = FALSE;
    
    result.emit_prolog = pascal_prolog;
    result.emit_epilog = pascal_epilog;

    if (!initialized) {
        table[IDLN_LIST] = pascal_list;
        table[IDLN_CODEFRAG] = codefrag;
        table[IDLN_TYPE_DCL] = do_typedef;
        table[IDLN_NATIVE] = check_native;
        initialized = TRUE;
    }

    result.dispatch_table = table;
    return &result;
}
