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
 * The Original Code is GeckoSDK for Delphi.
 *
 * The Initial Developer of the Original Code is Takanori Ito.
 * Portions created by the Initial Developer are Copyright (C) 2003
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
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
unit nsInit;

interface

uses
  nsXPCOM, nsConsts, nsTypes, nsGeckoStrings, SysUtils;

function XPCOMGlueStartup(xpcomFile: PAnsiChar): nsresult;
function XPCOMGlueShutdown: nsresult;

function GRE_Startup: Longword;
function GRE_Shutdown: Longword;

function NS_InitXPCOM2(out servMgr: nsIServiceManager; binDir: nsIFile; appFileLocationProvider: nsIDirectoryServiceProvider): nsresult; cdecl;
function NS_ShutdownXPCOM(servMgr: nsIServiceManager): nsresult; cdecl;
function NS_GetServiceManager(out servMgr: nsIServiceManager): nsresult; cdecl;
function NS_GetComponentManager(out compMgr: nsIComponentManager): nsresult; cdecl;
function NS_GetComponentRegistrar(out compReg: nsIComponentRegistrar): nsresult; cdecl;
function NS_GetMemoryManager(out memMgr: nsIMemory): nsresult; cdecl;
function NS_NewLocalFile(const Path: nsAString; FollowLinks: PRBool; out newFile: nsILocalFile): nsresult; cdecl;
function NS_NewNativeLocalFile(const Path: nsACString; FollowLinks: PRBool; out newFile: nsILocalFile): nsresult; cdecl;
function NS_GetDebug(out debug: nsIDebug): nsresult; cdecl;
function NS_GetTraceRefcnt(out traceRefcnt: nsITraceRefcnt): nsresult; cdecl;

type
  PLongBool = ^LongBool;

function NS_StringContainerInit(var aContainer: nsStringContainer): nsresult; cdecl;
procedure NS_StringContainerFinish(var aContainer: nsStringContainer); cdecl;
function NS_StringGetData(const aStr: nsAString; out aData: PWideChar; aTerminated: PLongBool=nil): nsresult; cdecl;
function NS_StringCloneData(const aStr: nsAString): PWideChar; cdecl;
procedure NS_StringSetData(aStr: nsAString; const aData: PWideChar; aDataLength: PRUint32 = High(PRUint32)); cdecl;
procedure NS_StringSetDataRange(aStr: nsAString; aCutOffset, aCutLength: Longword; const aData: PWideChar; aDataLength: PRUint32 = High(PRUint32)); cdecl;
procedure NS_StringCopy(aDestStr: nsAString; const aSrcStr: nsAString); cdecl;
procedure NS_StringAppendData(aStr: nsAString; const aData: PWideChar; aDataLength: PRUint32 = High(PRUint32));
procedure NS_StringInsertData(aStr: nsAString; aOffSet: PRUint32; const aData: PWideChar; aDataLength: PRUint32 = High(PRUint32));
procedure NS_StringCutData(aStr: nsAString; aCutOffset, aCutLength: PRUint32);

function NS_CStringContainerInit(var aContainer: nsCStringContainer): nsresult; cdecl;
procedure NS_CStringContainerFinish(var aContainer: nsCStringContainer); cdecl;
function NS_CStringGetData(const aStr: nsACString; out aData: PAnsiChar; aTerminated: PLongBool=nil): PRUint32; cdecl;
function NS_CStringCloneData(const aStr: nsACString): PAnsiChar; cdecl;
procedure NS_CStringSetData(aStr: nsACString; const aData: PAnsiChar; aDataLength: PRUint32 = High(PRUint32)); cdecl;
procedure NS_CStringSetDataRange(aStr: nsACString; aCutOffset, aCutLength: PRUint32; const aData: PAnsiChar; aDataLength: PRUint32 = High(PRUint32)); cdecl;
procedure NS_CStringCopy(aDestStr: nsACString; const aSrcStr: nsACString); cdecl;
procedure NS_CStringAppendData(aStr: nsACString; const aData: PAnsiChar; aDataLength: Longword = High(PRUint32));
procedure NS_CStringInsertData(aStr: nsACString; aOffSet: PRUint32; const aData: PAnsiChar; aDataLength: PRUint32 = High(PRUint32));
procedure NS_CStringCutData(aStr: nsACString; aCutOffset, aCutLength: PRUint32);

type
  nsSourceEncoding = ( NS_ENCODING_ASCII = 0,
                       NS_ENCODING_UTF8 = 1,
                       NS_ENCODING_NATIVE_FILESYSTEM = 2);

function NS_CStringToUTF16(const aSource: nsACString; aSrcEncoding: nsSourceEncoding; aDest: nsAString): Longword; cdecl;
function NS_UTF16ToCString(const aSource: nsAString; aSrcEncoding: nsSourceEncoding; aDest: nsACString): Longword; cdecl;

implementation

uses
  Windows, nsError, nsMemory;

type
  XPCOMExitRoutine = function : Longword; stdcall;

  InitFunc = function(out servMgr: nsIServiceManager; binDir: nsIFile; provider: nsIDirectoryServiceProvider): Longword; cdecl;
  ShutdownFunc = function (servMgr: nsIServiceManager): Longword; cdecl;
  GetServiceManagerFunc = function (out servMgr: nsIServiceManager): Longword; cdecl;
  GetComponentManagerFunc = function (out compMgr: nsIComponentManager): Longword; cdecl;
  GetComponentRegistrarFunc = function (out compReg: nsIComponentRegistrar): Longword; cdecl;
  GetMemoryManagerFunc = function (out memMgr: nsIMemory): Longword; cdecl;
  NewLocalFileFunc = function (const path: nsAString; followLinks: LongBool; out newFile: nsILocalFile): Longword; cdecl;
  NewNativeLocalFileFunc = function (const path: nsACString; followLinks: LongBool; out newFile: nsILocalFile): Longword; cdecl;
  RegisterXPCOMExitRoutineFunc = function (exitRoutine: XPCOMExitRoutine; proproty: Longword): Longword; cdecl;
  UnregisterXPCOMExitRoutineFunc = function (exitRoutine: XPCOMExitRoutine): Longword; cdecl;
  GetDebugFunc = function (out debug: nsIDebug): Longword; cdecl;
  GetTraceRefcntFunc = function (out traceRefcnt: nsITraceRefcnt): Longword; cdecl;
  StringContainerInitFunc = function (var container: nsStringContainer): Longword; cdecl;
  StringContainerFinishFunc = procedure (var container: nsStringContainer); cdecl;
  StringGetDataFunc = function (const str: nsAString; out data: PWideChar; aTerminated: PLongBool): Longword; cdecl;
  StringCloneDataFunc = function (const str: nsAString): PWideChar; cdecl;
  StringSetDataFunc = procedure (str: nsAString; const data: PWideChar; length: Longword); cdecl;
  StringSetDataRangeFunc = procedure (str: nsAString; aCutOffset, aCutLength: Longword; const data: PWideChar; length: Longword); cdecl;
  StringCopyFunc = procedure (dst: nsAString; const src: nsAString); cdecl;

  CStringContainerInitFunc = function (var container: nsCStringContainer): Longword; cdecl;
  CStringContainerFinishFunc = procedure (var container: nsCStringContainer); cdecl;
  CStringGetDataFunc = function (const str: nsACString; out data: PAnsiChar; aTerminated: PLongBool): Longword; cdecl;
  CStringCloneDataFunc = function (const str: nsACString): PAnsiChar; cdecl;
  CStringSetDataFunc = procedure (str: nsACString; const data: PAnsiChar; length: Longword); cdecl;
  CStringSetDataRangeFunc = procedure (str: nsACString; aCutOffset, aCutLength: Longword; const data: PAnsiChar; length: Longword); cdecl;
  CStringCopyFunc = procedure (dst: nsACString; const src: nsACString); cdecl;

  CStringToUTF16Func = function (const src: nsACString; encoding: nsSourceEncoding; dst: nsAString): Longword; cdecl;
  UTF16ToCStringFunc = function (const src: nsAString; encoding: nsSourceEncoding; dst: nsACString): Longword; cdecl;

  PnsStaticModuleInfo = Pointer;

  XRE_InitEmbeddingFunc = function (
    aLibXULDirectory : nsILocalFile;
    aAppDirectory:nsILocalFile;
    aAppDirProvider:nsIDirectoryServiceProvider;
    const aStaticComponents:PnsStaticModuleInfo;
    aStaticComponentCount:PRUint32
  ):Cardinal; cdecl;

  XRE_TermEmbeddingFunc = procedure; cdecl;
  XRE_NotifyProfileFunc = procedure; cdecl;


  XPCOMFunctions = record
    version: Longword;
    size: Longword;

    init: InitFunc;
    shutdown: ShutdownFunc;
    getServiceManager: GetServiceManagerFunc;
    getComponentManager: GetComponentManagerFunc;
    getComponentRegistrar: GetComponentRegistrarFunc;
    getMemoryManager: GetMemoryManagerFunc;
    newLocalFile: NewLocalFileFunc;
    newNativeLocalFile: NewNativeLocalFileFunc;

    registerXPCOMExitRoutine: RegisterXPCOMExitRoutineFunc;
    unregisterXPCOMExitRoutine: UnregisterXPCOMExitRoutineFunc;
    getDebug: GetDebugFunc;
    getTraceRefCnt: GetTraceRefCntFunc;
    stringContainerInit: StringContainerInitFunc;
    stringContainerFinish: StringContainerFinishFunc;
    stringGetData: StringGetDataFunc;
    stringSetData: StringSetDataFunc;
    stringSetDataRange: StringSetDataRangeFunc;
    stringCopy: StringCopyFunc;
    cstringContainerInit: CStringContainerInitFunc;
    cstringContainerFinish: CStringContainerFinishFunc;
    cstringGetData: CStringGetDataFunc;
    cstringSetData: CStringSetDataFunc;
    cstringSetDataRange: CStringSetDataRangeFunc;
    cstringCopy: CStringCopyFunc;
    cstringToUTF16: CStringToUTF16Func;
    UTF16ToCString: UTF16ToCStringFunc;
    stringCloneData: StringCloneDataFunc;
    cstringCloneData: CStringCloneDataFunc;
  end;

  GetFrozenFunctionsFunc = function(out enrtyPoints: XPCOMFunctions; libraryPath: PAnsiChar): Longword; cdecl;

var
  xpcomFunc: XPCOMFunctions;
  XRE_InitEmbedding:XRE_InitEmbeddingFunc;
  XRE_TermEmbedding:XRE_TermEmbeddingFunc;
  XRE_NotifyProfile:XRE_NotifyProfileFunc;
  xpcomLib: HMODULE;

function NS_InitXPCOM2(out servMgr: nsIServiceManager;
                       binDir: nsIFile;
                       appFileLocationProvider: nsIDirectoryServiceProvider): Longword;
begin
  if Assigned(xpcomFunc.init) then
    Result := xpcomFunc.init(servMgr, binDir, appFileLocationProvider)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_ShutdownXPCOM(servMgr: nsIServiceManager): Longword;
begin
  if Assigned(xpcomFunc.shutdown) then
    Result := xpcomFunc.shutdown(servMgr)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetServiceManager(out servMgr: nsIServiceManager): Longword;
begin
  if Assigned(xpcomFunc.getServiceManager) then
    Result := xpcomFunc.getServiceManager(servMgr)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetComponentManager(out compMgr: nsIComponentManager): nsresult;
begin
  if Assigned(xpcomFunc.getComponentManager) then
    Result := xpcomFunc.getComponentManager(compMgr)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetComponentRegistrar(out compReg: nsIComponentRegistrar): nsresult;
begin
  if Assigned(xpcomFunc.getComponentRegistrar) then
    Result := xpcomFunc.getComponentRegistrar(compReg)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetMemoryManager(out memMgr: nsIMemory): nsresult;
begin
  if Assigned(xpcomFunc.getMemoryManager) then
    Result := xpcomFunc.getMemoryManager(memMgr)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_NewLocalFile(const path: nsAString;
                         followLinks: PRBool;
                         out newFile: nsILocalFile): nsresult;
begin
  if Assigned(xpcomFunc.newLocalFile) then
    Result := xpcomFunc.newLocalFile(path, followLinks, newFile)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_NewNativeLocalFile(const path: nsACString;
                               followLinks: PRBool;
                               out newFile: nsILocalFile): nsresult;
begin
  if Assigned(xpcomFunc.newNativeLocalFile) then
    Result := xpcomFunc.newNativeLocalFile(path, followLinks, newFile)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_RegisterXPCOMExitRoutine(exitRoutine: XPCOMExitRoutine;
                                     priority: Longword): Longword;
begin
  if Assigned(xpcomFunc.registerXPCOMExitRoutine) then
    Result := xpcomFunc.registerXPCOMExitRoutine(exitRoutine, priority)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_UnregisterXPCOMExitRoutine(exitRoutine: XPCOMExitRoutine): Longword;
begin
  if Assigned(xpcomFunc.unregisterXPCOMExitRoutine) then
    Result := xpcomFunc.unregisterXPCOMExitRoutine(exitRoutine)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetDebug(out debug: nsIDebug): Longword;
begin
  if Assigned(xpcomFunc.getDebug) then
    Result := xpcomFunc.getDebug(debug)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_GetTraceRefcnt(out traceRefcnt: nsITraceRefcnt): Longword;
begin
  if Assigned(xpcomFunc.getTraceRefCnt) then
    Result := xpcomFunc.getTraceRefCnt(traceRefcnt)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_StringContainerInit(var aContainer: nsStringContainer): Longword;
begin
  if Assigned(xpcomFunc.stringContainerInit) then
    Result := xpcomFunc.stringContainerInit(aContainer)
  else
    Result := NS_ERROR_FAILURE;
end;

procedure NS_StringContainerFinish(var aContainer: nsStringContainer);
begin
  if Assigned(xpcomFunc.stringContainerFinish) then
    xpcomFunc.stringContainerFinish(aContainer);
end;

function NS_StringGetData(const aStr: nsAString; out aData: PWideChar; aTerminated: PLongBool): Longword;
begin
  if Assigned(xpcomFunc.stringGetData) then
    Result := xpcomFunc.stringGetData(aStr, aData, aTerminated)
  else
    Result := 0;
end;

procedure NS_StringSetData(aStr: nsAString; const aData: PWideChar; aDataLength: Longword);
begin
  if Assigned(xpcomFunc.stringSetData) then
    xpcomFunc.stringSetData(aStr, aData, aDataLength);
end;

procedure NS_StringSetDataRange(aStr: nsAString; aCutOffset, aCutLength: Longword; const aData: PWideChar; aDataLength: Longword);
begin
  if Assigned(xpcomFunc.stringSetDataRange) then
    xpcomFunc.stringSetDataRange(aStr, aCutOffset, aCutLength, aData, aDataLength);
end;

procedure NS_StringCopy(aDestStr: nsAString; const aSrcStr: nsAString);
begin
  if Assigned(xpcomFunc.stringCopy) then
    xpcomFunc.stringCopy(aDestStr, aSrcStr);
end;

procedure NS_StringAppendData(aStr: nsAString; const aData: PWideChar; aDataLength: Longword);
begin
  NS_StringSetDataRange(aStr, High(Longword), 0, aData, aDataLength);
end;

procedure NS_StringInsertData(aStr: nsAString; aOffSet: Longword; const aData: PWideChar; aDataLength: Longword);
begin
  NS_StringSetDataRange(aStr, aOffset, 0, aData, aDataLength);
end;

procedure NS_StringCutData(aStr: nsAString; aCutOffset, aCutLength: Longword);
begin
  NS_StringSetDataRange(aStr, aCutOffset, aCutLength, nil, 0);
end;

function NS_CStringContainerInit(var aContainer: nsCStringContainer): Longword;
begin
  if Assigned(xpcomFunc.cstringContainerInit) then
    Result := xpcomFunc.cstringContainerInit(aContainer)
  else
    Result := NS_ERROR_FAILURE;
end;

procedure NS_CStringContainerFinish(var aContainer: nsCStringContainer);
begin
  if Assigned(xpcomFunc.cstringContainerFinish) then
    xpcomFunc.cstringContainerFinish(aContainer);
end;

function NS_CStringGetData(const aStr: nsACString; out aData: PAnsiChar; aTerminated: PLongBool): Longword;
begin
  if Assigned(xpcomFunc.cstringGetData) then
    Result := xpcomFunc.cstringGetData(aStr, aData, aTerminated)
  else
    Result := 0;
end;

procedure NS_CStringSetData(aStr: nsACString; const aData: PAnsiChar; aDataLength: Longword);
begin
  if Assigned(xpcomFunc.cstringSetData) then
    xpcomFunc.cstringSetData(aStr, aData, aDataLength);
end;

procedure NS_CStringSetDataRange(aStr: nsACString; aCutOffset, aCutLength: Longword; const aData: PAnsiChar; aDataLength: Longword);
begin
  if Assigned(xpcomFunc.cstringSetDataRange) then
    xpcomFunc.cstringSetDataRange(aStr, aCutOffset, aCutLength, aData, aDataLength);
end;

procedure NS_CStringCopy(aDestStr: nsACString; const aSrcStr: nsACString);
begin
  if Assigned(xpcomFunc.cstringCopy) then
    xpcomFunc.cstringCopy(aDestStr, aSrcStr);
end;

procedure NS_CStringAppendData(aStr: nsACString; const aData: PAnsiChar; aDataLength: Longword);
begin
  NS_CStringSetDataRange(aStr, High(Longword), 0, aData, aDataLength);
end;

procedure NS_CStringInsertData(aStr: nsACString; aOffSet: Longword; const aData: PAnsiChar; aDataLength: Longword);
begin
  NS_CStringSetDataRange(aStr, aOffset, 0, aData, aDataLength);
end;

procedure NS_CStringCutData(aStr: nsACString; aCutOffset, aCutLength: Longword);
begin
  NS_CStringSetDataRange(aStr, aCutOffset, aCutLength, nil, 0);
end;

function NS_CStringToUTF16(const aSource: nsACString; aSrcEncoding: nsSourceEncoding; aDest: nsAString): Longword;
begin
  if Assigned(xpcomFunc.cstringToUTF16) then
    Result := xpcomFunc.cstringToUTF16(aSource, aSrcEncoding, aDest)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_UTF16ToCString(const aSource: nsAString; aSrcEncoding: nsSourceEncoding; aDest: nsACString): Longword;
begin
  if Assigned(xpcomFunc.UTF16ToCString) then
    Result := xpcomFunc.UTF16ToCString(aSource, aSrcEncoding, aDest)
  else
    Result := NS_ERROR_FAILURE;
end;

function NS_StringCloneData(const aStr: nsAString): PWideChar;
begin
  if Assigned(xpcomFunc.stringCloneData) then
    Result := xpcomFunc.stringCloneData(aStr)
  else
    Result := nil;
end;

function NS_CStringCloneData(const aStr: nsACString): PAnsiChar;
begin
  if Assigned(xpcomFunc.cstringCloneData) then
    Result := xpcomFunc.cstringCloneData(aStr)
  else
    Result := nil;
end;

function StrLen(const Str: PChar): Cardinal; forward;
function StrCopy(Dest: PChar; const Source: PChar): PChar; forward;
function StrCat(Dest: PChar; const Source: PChar): PChar; forward;
function StrComp(const Str1, Str2: PChar): Integer; forward;
function StrRScan(const Str: PChar; Chr: Char): PChar; forward;

type
  TAnsiCharArray = array [0..High(Word) div SizeOf(AnsiChar)] of AnsiChar;
  PAnsiCharArray = ^TAnsiCharArray;
  TMaxPathChar = array[0..MAX_PATH] of Char;

function XPCOMGlueStartup(xpcomFile: PAnsiChar): Longword;
const
  XPCOM_DLL = 'xpcom.dll';
var
  path: PAnsiChar;
  pathStr: TMaxPathChar;
  pathAry: TAnsiCharArray;
  func: GetFrozenFunctionsFunc;
  slashPos: PChar;
  pathLen: Integer;
  handle: HMODULE;
begin
  Result := NS_OK;

  func := nil;
  FillChar(xpcomFunc, SizeOf(XPCOMFunctions), 0);
  xpcomFunc.version := 1;
  xpcomFunc.size := SizeOf(XPCOMFunctions);

  if Assigned(xpcomFile) and (xpcomFile[0]='.') and (xpcomFIle[1]=#0) then
  begin
    func := GetProcAddress(xpcomLib, 'NS_GetFrozenFunctions');
    if not Assigned(func) then
    begin
      xpcomFile := nil;
    end else
    begin
      handle := GetModuleHandle(XPCOM_DLL);
      if GetModuleFileName(handle, pathStr, MAX_PATH)=0 then
      begin
        Result := NS_ERROR_FAILURE;
      end else
        Result := func(xpcomFunc, xpcomFile);
    end;
  end;

  if not Assigned(func) then
  begin
    if not Assigned(xpcomFile) then
      path := XPCOM_DLL
    else
      path := xpcomFile;
    StrCopy(pathStr, path);
    slashPos := StrRScan(pathStr, '\');
    if Assigned(slashPos) then
    begin
      // xpcom.dllのあるディレクトリをPATHに追加
      slashPos^ := #0;
      pathLen := GetEnvironmentVariable('PATH', pathAry, sizeof(PathAry));
      if pathLen>0 then
        StrCat(pathAry, ';');
      StrCat(pathAry, pathStr);
      SetEnvironmentVariable('PATH', pathAry);
    end;

    xpcomLib := LoadLibrary(path);

    if xpcomLib=0 then
    begin
      Result := NS_ERROR_FAILURE;
      Exit;
    end;

    func := GetProcAddress(xpcomLib, 'NS_GetFrozenFunctions');

    if not Assigned(func) then
    begin
      Result := NS_ERROR_FAILURE;
    end else
    begin
      Result := func(xpcomFunc, path);
    end;
  end;

  if NS_FAILED(Result) then
  begin
    FreeLibrary(xpcomLib);
    xpcomLib := 0;
    xpcomFunc.version := 0;
    Exit;
  end;

  (*Result := GlueStartupDebug;

  if NS_FAILED(Result) then
  begin
    FreeLibrary(xpcomLib);
    xpcomLib := 0;
    FreeMemory(xpcomFunc);
    xpcomFunc := nil;
    Exit;
  end;*)

  Result := GlueStartupMemory;

  if NS_FAILED(Result) then
  begin
    //GlueShutdownDebug;
    FreeLibrary(xpcomLib);
    xpcomLib := 0;
    xpcomFunc.version := 0;
    Exit;
  end;
end;

function XPCOMGlueShutdown: Longword;
begin
  GlueShutdownMemory;
  //GlueShutdownDebug;

  FreeLibrary(xpcomLib);
  xpcomLib := 0;

  //FreeMemory(xpcomFunc);
  //xpcomFunc := nil;
  xpcomFunc.version := 0;

  Result := NS_OK;
end;

function GetCurrentProccessDirectory(buf: PAnsiChar): Boolean;
var
  i: Integer;
begin
  Result := False;
  if SUCCEEDED(GetModuleFileName(0, buf, SizeOf(TMaxPathChar))) then
  begin
    i := StrLen(buf)-1;
    while i>=0 do
    begin
      if buf[i]='\' then
      begin
        buf[i] := #0;
        Result := True;
        Exit;
      end;
      Dec(i);
    end;
  end;
end;

type
  TGREVersion = record
    major: Integer;
    minor: Integer;
    revision: Integer;
    date: Integer;
  end;

function IsNumber(AChar: AnsiChar): Boolean;
begin
  Result := AChar in ['0'..'9'];
end;

function GetGREVersion(verStr: PAnsiChar): TGREVersion;
var
  idx: Integer;
  major, minor, revision, date: Integer;
  verStrPtr: PAnsiCharArray;
begin
  FillChar(Result, SizeOf(Result), 0);
  verStrPtr := PAnsiCharArray(verStr);

  // major version
  // i.e.: '1' of '1.7.3_2004091008'
  idx := 0;
  major := 0;
  while IsNumber(verStrPtr[idx]) do
  begin
    major := major*10 + (Ord(verStrPtr[idx]) - Ord('0'));
    Inc(idx);
  end;

  // minor version
  // i.e.: '7' of '1.7.3_2004091008'
  Inc(idx); // '.' は決め打ちで飛ばす
  minor := 0;
  while IsNumber(verStrPtr[idx]) do
  begin
    minor := minor*10 + (Ord(verStrPtr[idx]) - Ord('0'));
    Inc(idx);
  end;

  // revision
  revision := 0;
  if verStrPtr[idx]='.' then // 1.7 or 1.7.3?
  begin
    // リビジョン番号が存在することもある
    Inc(idx);
    while IsNumber(verStrPtr[idx]) do
    begin
      revision := revision*10 + (Ord(verStrPtr[idx]) - Ord('0'));
      Inc(idx);
    end;
  end;

  // date
  date := 0;
  while not (verStrPtr[idx] in ['_', ':', ' ', #0]) do
    Inc(idx);
  while (verStrPtr[idx] in ['_', ':', ' ', #0]) do
    Inc(idx);
  if verStrPtr[idx]<>#0 then
  begin
    //Inc(idx);
    while IsNumber(verStrPtr[idx]) do
    begin
      date := date*10 + (Ord(verStrPtr[idx]) - Ord('0'));
      Inc(idx);
    end;
  end;

  Result.major := major;
  Result.minor := minor;
  Result.revision := revision;
  Result.date := date;
end;

function GREVersionCompare(const lhs, rhs: TGREVersion): Integer;
begin
  Result := lhs.major - rhs.major;
  if Result<>0 then Exit;
  Result := lhs.minor - rhs.minor;
  if Result<>0 then Exit;
  Result := lhs.revision - rhs.revision;
  if Result<>0 then Exit;
  Result := lhs.date - rhs.date;
end;

// あるファイルがGREの必要バージョンに達しているかを調べる。
function CheckGeckoVersion(path: PAnsiChar; const reqVer: TGREVersion): Boolean;
const
  BUFSIZE = 4096;
var
  buf: array[0..BUFSIZE-1] of Char;
  fileVer: PChar;
  dwSize: DWORD;
  dw: DWORD;
  greVer: TGREVersion;
begin
  Result := False;

  dwSize := GetFileVersionInfoSize(path, dw);
  if (dwSize<=0) or (dwSize>BUFSIZE) then Exit;

  Result := GetFileVersionInfo(path, 0, dwSize, @buf);
  if not Result then Exit;

  // バージョン情報の言語IDは決め打ち
  Result := VerQueryValue(@buf, '\StringFileInfo\000004b0\FileVersion', Pointer(fileVer), dw);
  if not Result then Exit;

  greVer := GetGREVersion(fileVer);

  if GREVersionCompare(greVer, reqVer)>=0 then Result := True;
end;

function IsXpcomDll(const filename: PAnsiChar): Boolean;
var
  module: HMODULE;
  proc: Pointer;
begin
  Result := False;
  module := LoadLibrary(filename);
  if module=0 then Exit;

  proc := GetProcAddress(module, 'NS_GetFrozenFunctions');
  if Assigned(proc) then Result := True;

  FreeLibrary(module);
end;

function GetLatestGreFromReg(regBase: HKEY; const reqVer: TGREVersion;
  grePath: PAnsiChar; var greVer: TGREVersion): Boolean;
var
  curKey: HKEY;
  dwSize: DWORD;
  i: Integer;
  keyName: TMaxPathChar;
  rv: HRESULT;
  path, dllPath: TMaxPathChar;
  ver: TGREVersion;
begin
  Result := False;
  i := 0;
  dwSize := MAX_PATH;
  rv := RegEnumKeyEx(regBase, i, keyName, dwSize, nil, nil, nil, nil);
  while rv=0 do
  begin
    rv := RegOpenKey(regBase, PChar(@keyName), curKey);
    if rv=0 then
    begin
      dwSize := MAX_PATH;
      rv := RegQueryValueEx(curKey, 'GreHome', nil, nil, PByte(@path), @dwSize);
      if rv=0 then
      begin
        ver := GetGREVersion(keyName);
        if (GREVersionCompare(ver, reqVer)>=0) and
           (GREVersionCompare(ver, greVer)>=0) then
        begin
          dllPath := path;
          StrCat(dllPath, '\xpcom.dll');
          //if IsXpcomDll(dllPath) then
//          if CheckGeckoVersion(dllPath, reqVer) and
//             IsXpcomDll(@dllPath) then
          if CheckGeckoVersion(dllPath, reqVer) then
          begin
            StrCopy(grePath, path);
            greVer := ver;
            Result := True;
          end;
        end;
      end;
      RegCloseKey(curKey);
    end;
    Inc(i);
    dwSize := MAX_PATH;
    rv := RegEnumKeyEx(regBase, i, keyName, dwSize, nil, nil, nil, nil);
  end;
  RegCloseKey(regBase);
end;

function GetLatestGreLocation(buf: PAnsiChar): Boolean;
const
  nameBase: PAnsiChar = 'Software\mozilla.org\GRE';
var
  rv: HRESULT;
  base: HKEY;
  cuPath, lmPath: TMaxPathChar;
  cuVer, lmVer: TGREVersion;
  reqVer: TGREVersion;
  hasLM, hasCU: Boolean;
label
  NoLocalMachine,
  NoCurrentUser;
begin
  FillChar(cuVer, SizeOf(cuVer), 0);
  FillChar(lmVer, SizeOf(lmVer), 0);
  reqVer := GetGREVersion(GRE_BUILD_ID);

  rv := RegOpenKey(HKEY_LOCAL_MACHINE, nameBase, base);
  HasLM := (rv=ERROR_SUCCESS) and GetLatestGreFromReg(base, reqVer, lmPath, lmVer);
NoLocalMachine:;
  rv := RegOpenKey(HKEY_CURRENT_USER, nameBase, base);
  hasCU := (rv=ERROR_SUCCESS) and GetLatestGreFromReg(base, reqVer, cuPath, cuVer);
NoCurrentUser:;
  Result := hasLM or hasCU;

  if Result then
  begin
    if GREVersionCompare(lmVer,cuVer)>0 then
      //buf := lmPath
      StrCopy(buf, lmPath)
    else
      //buf := cuPath;
      StrCopy(buf, cuPath);
  end;
end;

function GetPathFromConfigDir(dirname: PAnsiChar; buf: PAnsiChar): Boolean;
begin
  //TODO 1: GetPathFromConfigDir の実装
  Result := False;
end;

function GetPathFromConfigFile(const filename: PAnsiChar; buf: PAnsiChar): Boolean;
begin
  //TODO 1: GetPathFromConfigFile の実装
  Result := False;
end;

var
  GRELocation: TMaxPathChar;

function GetGREDirectoryPath(buf: PAnsiChar): Boolean;
const
  GRE_REGISTRY_KEY = GRE_WIN_REG_LOC + GRE_BUILD_ID;
var
  cpd:TMaxPathChar;
  dllPath: TMaxPathChar;
  useLocalGre: TMaxPathChar;
begin
  if StrLen(GreLocation)>0 then
  begin
    StrCopy(buf, GreLocation);
    Result := True;
    Exit;
  end;

  if GetCurrentProccessDirectory(cpd) then
  begin
    dllPath := cpd;
    StrCat(dllPath, '\xpcom.dll');
    if IsXpcomDll(dllPath) then
    begin
      //buf := cpd;
      StrCopy(buf, cpd);
      Result := True;
      Exit;
    end;
  end;

  if GetEnvironmentVariable('USE_LOCAL_GRE', useLocalGre, MAX_PATH)>0 then
  begin
    Result := False;
    Exit;
  end;

  {if SUCCEEDED(GetEnvironmentVariable('HOME', greConfHomePath, MAX_PATH)) and
     (StrLen(path)>0) then
  begin
    StrCat(greConfHomePath, '\gre.config');
    if GetPathFromConfigFile(greConfHomePath, GRELocation) then
    begin
      buf := GRELocation;
      Result := True;
      Exit;
    end;
  end;}

  {if SUCCEEDED(GetEnvironmentVariable('MOZ_GRE_CONF', path, MAX_PATH)) and
     (StrLen(path)>0) then
  begin
    if GetPathFromConfigFile(path, GRELocation) then
    begin
      buf := GRELocation;
      Result := True;
      Exit;
    end;
  end;}

  // レジストリから探す
  if GetLatestGreLocation(buf) then
  begin
    Result := True;
    Exit;
  end;

  Result := False;
end;

type
  nsIDirectoryServiceProvider = interface(nsISupports)
  ['{bbf8cab0-d43a-11d3-8cc2-00609792278c}']
    function GetFile(const prop: PAnsiChar; out persistent: PRBool; out AFile: nsIFile): nsresult; stdcall;
  end;

  nsGREDirServiceProvider = class(TInterfacedObject,
                                  nsIDirectoryServiceProvider)
  public
    FPathEnvString: TMaxPathChar;
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
    function GetFile(const prop: PAnsiChar; out persistent: PRBool; out AFile: nsIFile): nsresult; stdcall;
    function GetGreDirectory(out AFile: nsILocalFile): nsresult;
  end;

function nsGREDirServiceProvider.GetGreDirectory(out AFile: nsILocalFile): nsresult;
var
  GreDir: TMaxPathChar;
  tempLocal: nsILocalFile;
  leaf: nsCStringContainer;
begin
  Result := NS_ERROR_FAILURE;
  if not GetGREDirectoryPath(GreDir) then Exit;

  Result := NS_CStringContainerInit(leaf);
  if NS_FAILED(Result) then Exit;
  NS_CStringSetData(@leaf, GreDir);
  Result := NS_NewNativeLocalFile(@leaf, True, tempLocal);

  if NS_SUCCEEDED(Result) then
    Result := tempLocal.QueryInterface(nsILocalFile, AFile);
end;

function nsGREDirServiceProvider.GetFile(const Prop: PChar; out Persistent: LongBool; out AFile: nsIFile): nsresult;
var
  localFile: nsILocalFile;
const
  NS_GRE_DIR                            = 'GreD';
begin
  persistent := True;

  if StrComp(Prop, NS_GRE_DIR)=0 then
    Result := GetGreDirectory(localFile)
  else
    Result := NS_ERROR_FAILURE;

  if NS_SUCCEEDED(Result) then
    Result := localFile.QueryInterface(nsIFile, AFile);
end;

class function nsGREDirServiceProvider.NewInstance: TObject;
var
  Instance: Pointer;
begin
  Instance := nsMemory.Alloc(InstanceSize);
  Result := InitInstance(Instance);
  nsGREDirServiceProvider(Instance).FRefCount := 1;
end;

procedure nsGREDirServiceProvider.FreeInstance;
begin
  nsMemory.Free(Self);
end;

function GetXPCOMPath(buf: PAnsiChar): Boolean;
var
  grePath: TMaxPathChar;
  greEnv: TMaxPathChar;
begin
  Result := False;
  if not GetGreDirectoryPath(grePath) then
  begin
    if GetEnvironmentVariable('MOZILLA_FIVE_HOME', greEnv, MAX_PATH)=0 then
      Exit;
    grePath := greEnv;
  end;

  StrCopy(buf, grePath);
  //StrCat(buf, '\xpcom.dll');
  Result := True;
end;

var
  sStartupCount: Integer = 0;

function GRE_Startup: Longword;
var
  xpcomLocation: TMaxPathChar;
  xpcomDLL: TMaxPathChar;
  xulPath: TMaxPathChar;
  provider: nsGREDirServiceProvider;
  servMgr: nsIServiceManager;
  xulModule: Cardinal;
  xuldir,appdir:nsILocalFile;
begin
  Result := NS_OK;

  if sStartupCount > 0 then
  begin
    Inc(sStartupCount);
    Exit;
  end;

  GetXPCOMPath(@xpcomLocation[0]);
  StrCopy(xpcomDLL, xpcomLocation);
  StrCat(xpcomDLL, '\xpcom.dll');

  Result := XPCOMGlueStartup(xpcomDLL);

  if NS_FAILED(Result) then Exit;

  //plus7によるXRE対応 ここから:
  StrCopy(xulPath, xpcomLocation);
  StrCat(xulPath, '\xul.dll');
  xulModule := LoadLibraryEx(xulPath,0,0);

  if xulModule = 0 then Exit;

  XRE_InitEmbedding := GetProcAddress(xulModule, PAnsiChar('XRE_InitEmbedding'));
  if not Assigned(XRE_InitEmbedding) then Exit;
  
  XRE_TermEmbedding := GetProcAddress(xulModule, PAnsiChar('XRE_TermEmbedding'));
  if not Assigned(XRE_TermEmbedding) then Exit;

  XRE_NotifyProfile := GetProcAddress(xulModule, PAnsiChar('XRE_NotifyProfile'));
  if not Assigned(XRE_NotifyProfile) then Exit;

  NS_NewNativeLocalFile(NewCString(xpcomLocation).ACString, False, xuldir);

  NS_NewNativeLocalFile(NewCString(ExtractFilePath(ParamStr(0))).ACString, False, appdir);

  Result := XRE_InitEmbedding(xuldir, appdir, nil, nil, 0);

  {provider := nsGREDirServiceProvider.Create;
  if not Assigned(provider) then
  begin
    Result := NS_ERROR_OUT_OF_MEMORY;
    XPCOMGlueShutdown;
    Exit;
  end;

  provider._AddRef;
  Result := NS_InitXPCOM2(servMgr, nil, provider as nsXPCOM.nsIDirectoryServiceProvider);
  provider._Release;}

  if NS_FAILED(Result) then
  begin
    XPCOMGlueShutdown;
    Exit;
  end;
  XRE_NotifyProfile;
  Inc(sStartupCount);
end;

function GRE_Shutdown: Longword;
begin
  Dec(sStartupCount);

  if sStartupCount=0 then
  begin
    XRE_TermEmbedding();
    XPCOMGlueShutdown;
  end else
  if sStartupCount<0 then sStartupCount := 0;

  Result := NS_OK;
end;

{ PChar routines }

function StrLen(const Str: PChar): Cardinal;
var
  P: PChar;
begin
  P := Str;
  Result := 0;
  while P^ <> #0 do
  begin
    Inc(P);
    Inc(Result);
  end;
end;

function StrCopy(Dest: PChar; const Source: PChar): PChar;
var
  D, S: PChar;
begin
  D := Dest;
  S := Source;
  repeat
    D^ := S^;
    Inc(D);
    Inc(S);
  until D[-1] = #0;
  Result := Dest;
end;

function StrCat(Dest: PChar; const Source: PChar): PChar;
var
  D: PChar;
begin
  D := Dest;
  while D^ <> #0 do
    Inc(D);
  StrCopy(D, Source);
  Result := Dest;
end;

function StrComp(const Str1, Str2: PChar): Integer;
var
  P1, P2: PChar;
begin
  P1 := Str1;
  P2 := Str2;
  while (P1^<>#0) and (P1^=P2^) do
  begin
    Inc(P1);
    Inc(P2);
  end;
  Result := Ord(P1^) - Ord(P2^);
end;

function StrRScan(const Str: PChar; Chr: Char): PChar;
var
  P: PChar;
begin
  P := Str;
  while P^<>#0 do
    Inc(P);
  while (P>=Str) and (P^<>Chr) do
    Dec(P);
  if (P>=Str) then
    Result := P
  else
    Result := nil;
end;

end.
