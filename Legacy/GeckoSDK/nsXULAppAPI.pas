(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is mozilla.org.
 *
 * The Initial Developer of the Original Code is
 * Netscape Communications Corpotation.
 * Portions created by the Initial Developer are Copyright (C) 1998
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   NOSE Takafumi <ahya365@gmail.com>
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** *)
unit nsXULAppAPI;

interface

uses
  nsXPCOM, nsGeckoStrings, nsConsts, nsTypes, SysUtils;
  
  function XRE_Startup: Longword;
  function XRE_Shutdown: Longword;
const
(* *
 * Indicates whether or not the profile migrator service may be
 * invoked at startup when creating a profile.
 *)
  NS_XRE_ENABLE_PROFILE_MIGRATOR = (1 shl 1);

(* *
 * Indicates whether or not the extension manager service should be
 * initialized at startup.
 *)
  NS_XRE_ENABLE_EXTENSION_MANAGER = (1 shl 2);

(* *
 * Indicates whether or not to use Breakpad crash reporting.
 *)
  NS_XRE_ENABLE_CRASH_REPORTER = (1 shl 3);

(* *
 * The contract id for the nsIXULAppInfo service.
 *)
  XULAPPINFO_SERVICE_CONTRACTID = '@mozilla.org/xre/app-info;1';

(* *
 * A directory service key which provides the platform-correct "application
 * data" directory as follows, where $name and $vendor are as defined above and
 * $vendor is optional:
 *
 * Windows:
 *   HOME = Documents and Settings\$USER\Application Data
 *   UAppData = $HOME[\$vendor]\$name
 *
 * Unix:
 *   HOME = ~
 *   UAppData = $HOME/.[$vendor/]$name
 *
 * Mac:
 *   HOME = ~
 *   UAppData = $HOME/Library/Application Support/$name
 *
 * Note that the "profile" member above will change the value of UAppData as
 * follows:
 *
 * Windows:
 *   UAppData = $HOME\$profile
 *
 * Unix:
 *   UAppData = $HOME/.$profile
 *
 * Mac:
 *   UAppData = $HOME/Library/Application Support/$profile
 *)
  XRE_USER_APP_DATA_DIR = 'UAppData';

(* *
 * A directory service key which provides a list of all enabled extension
 * directories. The list includes compatible platform-specific extension
 * subdirectories.
 *
 * @note The directory list will have no members when the application is
 *       launched in safe mode.
 *)
  XRE_EXTENSIONS_DIR_LIST = 'XREExtDL';

(* *
 * A directory service key which provides the executable file used to
 * launch the current process.  This is the same value returned by the
 * XRE_GetBinaryPath function defined below.
 *)
  XRE_EXECUTABLE_FILE = 'XREExeF';

(* *
 * A directory service key which specifies the profile
 * directory. Unlike the NS_APP_USER_PROFILE_50_DIR key, this key may
 * be available when the profile hasn't been 'started', or after is
 * has been shut down. If the application is running without a
 * profile, such as when showing the profile manager UI, this key will
 * not be available. This key is provided by the XUL apprunner or by
 * the aAppDirProvider object passed to XRE_InitEmbedding.
 *)
  NS_APP_PROFILE_DIR_STARTUP = 'ProfDS';

(* *
 * A directory service key which specifies the profile
 * directory. Unlike the NS_APP_USER_PROFILE_LOCAL_50_DIR key, this key may
 * be available when the profile hasn't been 'started', or after is
 * has been shut down. If the application is running without a
 * profile, such as when showing the profile manager UI, this key will
 * not be available. This key is provided by the XUL apprunner or by
 * the aAppDirProvider object passed to XRE_InitEmbedding.
 *)
  NS_APP_PROFILE_LOCAL_DIR_STARTUP = 'ProfLDS';
type
  nsStaticModuleInfo = Pointer;
(*
        XRE_InitEmbedding, (nsILocalFile *aLibXULDirectory,
                            nsILocalFile *aAppDirectory,
                            nsIDirectoryServiceProvider *aAppDirProvider,
                            nsStaticModuleInfo const *aStaticComponents,
                            PRUint32 aStaticComponentCount)
*)
  XRE_InitEmbeddingFunc = function(
                            aLibXULDirectory:nsILocalFile;
                            aAppDirectory:nsILocalFile;
                            aAppDirProvider:nsIDirectoryServiceProvider;
                            aStaticComponents:nsStaticModuleInfo;
                            aStaticComponentCount:PRUint32
                          ):Integer; cdecl;
  XRE_TermEmbeddingFunc = procedure(); cdecl;
(**
 * Application-specific data needed to start the apprunner.
 *
 * @status FROZEN - This API is stable. Additional fields may be added to the
 *                  end of the structure in the future. Runtime detection
 *                  of the version of nsXREAppData can be determined by
 *                  examining the 'size' field.
 *
 * @note When this structure is allocated and manipulated by XRE_CreateAppData,
 *       string fields will be allocated with NS_Alloc, and interface pointers
 *       are strong references.
 *)
  TXREAppData = record
  (**
   * This should be set to sizeof(nsXREAppData). This structure may be
   * extended in future releases, and this ensures that binary compatibility
   * is maintained.
   *)
    size: PRUint32;
  (**
   * The directory of the application to be run. May be null if the
   * xulrunner and the app are installed into the same directory.
   *)
    directory:nsILocalFile;
  (**
   * The name of the application vendor. This must be ASCII, and is normally
   * mixed-case, e.g. 'Mozilla'. Optional (may be null), but highly
   * recommended. Must not be the empty string.
   *)
    vendor:PChar;
  (**
   * The name of the application. This must be ASCII, and is normally
   * mixed-case, e.g. 'Firefox'. Required (must not be null or an empty
   * string).
   *)
    name:PChar;
  (**
   * The major version, e.g. '0.8.0+'. Optional (may be null), but
   * required for advanced application features such as the extension
   * manager and update service. Must not be the empty string.
   *)
    version:PChar;
  (**
   * The application's build identifier, e.g. '2004051604'
   *)
    buildID:PChar;
  (**
   * The application's UUID. Used by the extension manager to determine
   * compatible extensions. Optional, but required for advanced application
   * features such as the extension manager and update service.
   *
   * This has traditionally been in the form
   * '{AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE}' but for new applications
   * a more readable form is encouraged: 'appname@vendor.tld'. Only
   * the following characters are allowed: a-z A-Z 0-9 - . @ _ { } *
   *)
    ID:PChar;

  (**
   * The copyright information to print for the -h commandline flag,
   * e.g. 'Copyright (c) 2003 mozilla.org'.
   *)
    copyright:PChar;

  (**
   * Combination of NS_XRE_ prefixed flags (defined below).
   *)
    flags:PRUint32;

  (**
   * The location of the XRE. XRE_main may not be able to figure this out
   * programatically.
   *)
    xreDirectory:nsILocalFile;

  (**
   * The minimum/maximum compatible XRE version.
   *)
    minVersion:PChar;
    maxVersion:PChar;

  (**
   * The server URL to send crash reports to.
   *)
    crashReporterURL:PChar;

  (**
   * The profile directory that will be used. Optional (may be null). Must not
   * be the empty string, must be ASCII. The path is split into components
   * along the path separator characters '/' and '\'.
   *
   * The application data directory ('UAppData', see below) is normally
   * composed as follows, where $HOME is platform-specific:
   *
   *   UAppData = $HOME[/$vendor]/$name
   *
   * If present, the 'profile' string will be used instead of the combination of
   * vendor and name as follows:
   *
   *   UAppData = $HOME/$profile
   *)
    profile:PChar;
  end;
  XULRunnerFunctions = record
    
  end;
implementation

var
  xulFunc:XULRunnerFunctions;
  xulLib:HMODULE;

function XRE_Startup: Longword;
begin
(*
nsresult rv;
    // Find the GRE (libxul). We are only using frozen interfaces, so we
    // should be compatible all the way up to (but not including) mozilla 2.0
    static const GREVersionRange vr = {
        "1.8a1",
        PR_TRUE,
        "2.0",
        PR_FALSE
    };

    char xpcomPath[_MAX_PATH];
    rv = GRE_GetGREPathWithProperties(&vr, 1, nsnull, 0,
                                      xpcomPath, sizeof(xpcomPath));
    if (NS_FAILED(rv))
        return 1;
    char *lastslash = ns_strrpbrk(xpcomPath, "/\\");
    if (!lastslash)
        return 2;

    rv = XPCOMGlueStartup(xpcomPath);
    if (NS_FAILED(rv))
        return 3;

    *lastslash = '\0';

    char xulPath[_MAX_PATH];
    _snprintf(xulPath, sizeof(xulPath), "%s\\xul.dll", xpcomPath);
    xulPath[sizeof(xulPath) - 1] = '\0';

    HINSTANCE xulModule = LoadLibraryEx(xulPath, NULL, 0);
    if (!xulModule)
        return 4;

    char temp[_MAX_PATH];
    GetModuleFileName(xulModule, temp, sizeof(temp));

    XRE_InitEmbedding =
        (XRE_InitEmbeddingType) GetProcAddress(xulModule, "XRE_InitEmbedding");
    if (!XRE_InitEmbedding) {
       fprintf(stderr, "Error: %i\n", GetLastError());
       return 5;
    }

    XRE_TermEmbedding =
        (XRE_TermEmbeddingType) GetProcAddress(xulModule,  "XRE_TermEmbedding");
    if (!XRE_TermEmbedding) {
        fprintf(stderr, "Error: %i\n", GetLastError());
        return 5;
    }

    // Scope all the XPCOM stuff
    {
        nsCOMPtr<nsILocalFile> xuldir;
        rv = NS_NewNativeLocalFile(nsCString(xpcomPath), PR_FALSE,
                                   getter_AddRefs(xuldir));
        if (NS_FAILED(rv))
            return 6;

        char self[_MAX_PATH];
		HINSTANCE hInstanceApp = NULL;
		hInstanceApp = GetModuleHandle(NULL);
        GetModuleFileName(hInstanceApp, self, sizeof(self));
        lastslash = ns_strrpbrk(xpcomPath, "/\\");
        if (!lastslash)
            return 7;

        *lastslash = '\0';

        nsCOMPtr<nsILocalFile> appdir;
        rv = NS_NewNativeLocalFile(nsCString(self), PR_FALSE,
                                   getter_AddRefs(appdir));
        if (NS_FAILED(rv))
            return 8;

        rv = XRE_InitEmbedding(xuldir, appdir, nsnull, nsnull, 0);
        if (NS_FAILED(rv))
            return 9;
	}
	return rv;
*)
end;

function XRE_Shutdown: Longword;
begin

end;

end.
