unit ContentAreaUtils;

interface

uses Classes, SysUtils, StrUtils, nsXPCOM, nsXPCOMGlue, nsGeckoStrings, nsDOM, nsNetUtil,
 nsImg, nsWebBrowserPersist, nsMIMEService, nsFilePicker, nsDownload,
 nsMIMEHeaderParam, nsTextToURI, nsStringBundle, nsMemory, nsLocale,
 SkRegExpW, nsMIMEInfo, nsStringEnumerator;

const
// We have no DOM, and can only save the URL as is.
  SAVEMODE_FILEONLY      = 0;
// We have a DOM and can save as complete.
  SAVEMODE_COMPLETE_DOM  = 1;
// We have a DOM which we can serialize as text.
  SAVEMODE_COMPLETE_TEXT = 2;
  
  kSaveAsType_Complete = 0; // Save document with attached objects.
//  kSaveAsType_URL      = 1; // Save document or URL by itself.
  kSaveAsType_Text     = 2; // Save document, converting to plain text.

type

TPersistArgs = record
  source      : nsISupports;
  contentType : String;
  target      : nsIURI;
  postData    : nsIInputStream;
  bypassCache : Boolean;
end;

TChosenData = record
  _File:nsILocalFile;
  Uri:nsIURI;
end;
PChosenData = ^TChosenData;

TFileInfo = record
  SuggestedFileName : String;
  FileName : String;
  FileBaseName : String;
  FileExt : String;
  Uri : nsIURI;
end;
PFileInfo = ^TFileInfo;

TFilePickerParams = record
  fpTitleKey: String;
  IsDocument: Boolean;
  FileInfo: PFileInfo;
  ContentType:String;
  SaveMode: Integer;
  SaveAsType: Integer;
  _File: nsILocalFile;
  FileURL: nsIURI;
end;
PFilePickerParams = ^TFilePickerParams;

procedure AppendFiltersForContentType(aFilePicker:nsIFilePicker; aContentType:String; aFileExtension:String; aSaveMode:Integer);
function GetMIMEService:nsIMIMEService;
function GetLastDir(Path:String):String;
function GetStringBundle:nsIStringBundle;
function InternalSave(aURL:String; aDocument:nsIDOMDocument;
                      aDefaultFileName:String; aContentDisposition:String;
                      aContentType:String; aShouldBypassCache:Boolean;
                      aFilePickerTitleKey:String; aChosenData:PChosenData;
                      aReferrer:nsIURI; aSkipPrompt:Boolean = False):Boolean;
function MakeURI(aURL:String; aOriginCharset:String; aBaseURI:nsIURI):nsIURI;
function MakeFilePicker:nsIFilePicker;
function MakeFileURI(aFile:nsIFile):nsIURI;
function MakeWebBrowserPersist:nsIWebBrowserPersist;
procedure SaveDocument(aDocument:nsIDOMDocument; aSkipPrompt:Boolean);

procedure SaveURL(aURL:String; aFileName:String; aFilePickerTitleKey:String;
                  aShouldBypassCache:Boolean; aSkipPrompt:Boolean; aReferrer:nsIURI);

procedure SaveImageURL(aURL:String; aFileName:String; aFilePickerTitleKey:String;
                  aShouldBypassCache:Boolean; aSkipPrompt:Boolean; aReferrer:nsIURI);
function ValidateFileName(fileName:String):String;

implementation

function NStr2DStr(nstr:nsISupportsString):String; overload;
var
 istr:IInterfacedString;
begin
  istr := NewString;
  nstr.GetData(istr.AString);
  Result := istr.ToString;
end;

function NStr2DStr(nstr:nsISupportsCString):String; overload;
var
 istr:IInterfacedCString;
begin
  istr := NewCString;
  nstr.GetData(istr.ACString);
  Result := istr.ToString;
end;

function GetCharsetforSave(aDocument:nsIDOMDocument):String;
var
  Charset:IInterfacedString;
begin
  if aDocument <> nil then begin
    Charset := NewString;
    (aDocument as nsIDOMNSDocument).GetCharacterSet(Charset.AString);
    Result := Charset.ToString;
  end
  else Result := '';
end;

// Given aFileName, find the fileName without the extension on the end.
function GetFileBaseName(aFileName:String):String;
var
  sk:TSkRegExp;
begin
  sk := TSkRegExp.Create;
  try
    // Remove the file extension from aFileName:
    sk.Expression := '\.[^.]*$';
    Result := sk.replace(aFileName, '');
  finally
    sk.Free;
  end;
end;

function GetLastDir(Path:String):String;
var
  idx:Integer;
  RevPath : String;
begin
  Result := '';
  RevPath := ReverseString(Path);
  if StartsStr('/',Path) then Exit;
  idx := PosEx('/', RevPath, 2);
  Result := Copy(Path, 2, idx);
end;

function GetDefaultFileName(aDefaultFileName:String; aURI:nsIURI; aDocument:nsIDOMDocument;
                            aContentDisposition:String):String;


var
  mhp:nsIMIMEHeaderParam;
  dummy:PAnsiChar;
  Charset:String;
  FileName,UnEscapedURI,DocTitle:IInterfacedString;
  Url:nsIURL;
  UrlFileName,UrlOriginCharset,Path,Host:IInterfacedCString;
  TextToSubURI:nsITextToSubURI;
  TmpStr:String;
  TmpPWideChar:PWideChar;
begin
  // 1) look for a filename in the content-disposition header, if any
  if (aContentDisposition<>'') then begin
    NS_GetService('@mozilla.org/network/mime-hdrparam;1',nsIMIMEHeaderParam,mhp);
    Charset := GetCharsetforSave(aDocument);

    FileName := NewString;
    try
      mhp.GetParameter(NewCString(aContentDisposition).ACString,
                       'filename',
                       NewCString(Charset).ACString,
                       True,
                       dummy,
                       FileName.AString);
    except
      try
        mhp.GetParameter(NewCString(aContentDisposition).ACString,
                         'name',
                         NewCString(Charset).ACString,
                         True,
                         dummy,
                         FileName.AString);
      except
      end;
    end;
    if (FileName.ToString<>'') then begin
      Result := FileName.ToString;
      Exit;
    end;
  end;

  try
    Url := aURI as nsIURL;
    UrlFileName := NewCString;
    Url.GetFileName(UrlFileName.ACString);
    if ( UrlFileName.ToString <> '') then begin
      // 2) Use the actual file name, if present
      NS_GetService('@mozilla.org/intl/texttosuburi;1', nsITextToSubURI, TextToSubURI);

      UrlOriginCharset := NewCString;
      Url.GetOriginCharset(UrlOriginCharset.ACString);
      UnEscapedURI := NewString;

      if UrlOriginCharset.ToString = '' then
        TextToSubURI.UnEscapeURIForUI(NewCString('UTF-8').ACString,UrlFileName.ACString,UnEscapedURI.AString)
      else
        TextToSubURI.UnEscapeURIForUI(UrlOriginCharset.ACString,UrlFileName.ACString,UnEscapedURI.AString);

      Result := ValidateFileName(UnEscapedURI.ToString);
      Exit;
    end;
  except
    // This is something like a data: and so forth URI... no filename here.
  end;

  if (aDocument<>nil) then begin
    DocTitle := NewString;
    (aDocument as nsIDOMNSDocument).GetTitle(DocTitle.AString);
    TmpStr := Trim(ValidateFileName(DocTitle.ToString));
    if (TmpStr<>'') then begin
      // 3) Use the document title
      Result := TmpStr;
      Exit;
    end;
  end;

  if (aDefaultFileName<>'') then begin
    // 4) Use the caller-provided name, if any
    Result := ValidateFileName(aDefaultFileName);
    Exit;
  end;

  // 5) If this is a directory, use the last directory name
  Path := NewCString;
  aURI.GetPath(Path.ACString);
  TmpStr := GetLastDir(Path.ToString);
  if (Length(TmpStr) > 0) then begin
    Result := ValidateFileName(TmpStr);
    Exit;
  end;

  try
    Host := NewCString;
    aURI.GetHost(Host.ACString);
    if (Host.ToString<>'') then begin
      // 6) Use the host.
      Result := Host.ToString;
      Exit;
    end;
  except
    // Some files have no information at all, like Javascript generated pages
  end;
  try
    // 7) Use the default file name
    TmpPWideChar := GetStringBundle.GetStringFromName('DefaultSaveFileName');
    Result := String(TmpPWideChar);
    nsMemory.Free(TmpPWideChar);
    Exit;
  except
    //in case localized string cannot be found
  end;
  // 8) If all else fails, use 'index'
  Result := 'index';
end;

function GetMIMETypeForURI(aURI:nsIURI):String;
begin
  Result := '';
  try
    Result := NewCString(GetMIMEService().GetTypeFromURI(aURI)).ToString;
  except
  end;
end;

function GetMIMEInfoForType(aMIMEType:String; aExtension:String):nsIMIMEInfo;
begin
  Result := nil;
  if (aMIMEType<>'') or (aExtension<>'') then begin
    try
      Result := GetMIMEService.GetFromTypeAndExtension(NewCString(aMIMEType).ACString, NewCString(aExtension).ACString);
    except
    end;
  end;
end;

function GetNormalizedLeafName(aFile:String; aDefaultExtension:String):String;
var
  sk:TSkRegExp;
begin
  Result := aFile;

  if (aDefaultExtension='') then Exit;

  sk := TSkRegExp.Create;
  try
    // Remove trailing dots and spaces on windows
    sk.Expression := '[\s.]+$';
    aFile := sk.Replace(aFile,'');

    // Remove leading dots
    sk.Expression := '^\.+';
    aFile := sk.Replace(aFile,'');
  finally
    sk.Free;
  end;

  // Fix up the file name we're saving to to include the default extension
  if ExtractFileExt(aFile) <> aDefaultExtension then
    Result := aFile + '.' + aDefaultExtension
  else
    Result := aFile;
end;

//@todo
function GetPostData:nsIInputStream;
begin
  Result := nil;
  (*try
    var sessionHistory = getWebNavigation().sessionHistory;
    return sessionHistory.getEntryAtIndex(sessionHistory.index, false)
                         .QueryInterface(Components.interfaces.nsISHEntry)
                         .postData;
  except
  end;*)
end;

function GetStringBundle:nsIStringBundle;
const
  bundleURL = 'chrome://global/locale/contentAreaCommands.properties';
var
  sbs:nsIStringBundleService;
  ls:nsILocaleService;
  AppLocale:nsILocale;
begin
  NS_GetService('@mozilla.org/intl/stringbundle;1', nsIStringBundleService, sbs);
  NS_GetService('@mozilla.org/intl/nslocaleservice;1', nsILocaleService, ls);
  AppLocale := ls.GetApplicationLocale;
  Result := sbs.CreateBundle(bundleURL);
end;

function GetTargetFile(aFpP:PFilePickerParams; aSkipPrompt:Boolean):Boolean;
var
  prefSvc : nsIPrefService;
  prefs : nsIPrefBranch;
  UseDownloadDir : Boolean;
  DnldMgr : nsIDownloadManager;
  fp : nsIFilePicker;
  Dir, LastDir, Directory, _File : nsILocalFile;
  FileLocator : nsIProperties;
  TitleKey : String;
  Bundle : nsIStringBundle;
  LeafName : IInterfacedString;
  CollisionCount : Integer;
  TmpLeafName : String;
  sk : TSkRegExp;
begin
  Result := False;

  NS_GetService('@mozilla.org/preferences-service;1',nsIPrefService,prefSvc);
  if prefSvc=nil then Exit;
  prefs := prefSvc.GetBranch('browser.download.');

  // For information on download folder preferences, see
  // mozilla/browser/components/preferences/main.js

  UseDownloadDir := prefs.GetBoolPref('useDownloadDir');

  // Default to lastDir if useDownloadDir is false, and lastDir
  // is configured and valid. Otherwise, use the user's default
  // downloads directory configured through download prefs.
  NS_GetService('@mozilla.org/download-manager;1', nsIDownloadManager, dnldMgr);

  try
    prefs.GetComplexValue('lastDir', nsILocalFile, LastDir);
    if (((not aSkipPrompt) and (not useDownloadDir)) and lastDir.exists()) then
      Dir := LastDir
    else
      Dir := dnldMgr.userDownloadsDirectory;
  except
    Dir := dnldMgr.userDownloadsDirectory;
  end;

  if ((not aSkipPrompt) or (not useDownloadDir) or (Dir=nil) or ((Dir<>nil) and (not Dir.Exists))) then begin
    if ((Dir = nil) or ((Dir<>nil) and (not Dir.exists))) then begin
      // Default to desktop.
      NS_GetService('@mozilla.org/file/directory_service;1',nsIProperties,FileLocator);
      FileLocator.Get('Desk', nsILocalFile, Dir);
    end;

    fp := MakeFilePicker();
    TitleKey := aFpP^.fpTitleKey;
    // || 'SaveLinkTitle';
    Bundle := GetStringBundle;
    //TODO:ここはBundleの仕組みに従わなくてよさそう
    fp.init(nil(*window*), NewString('Title').AString(*Bundle.GetStringFromName(titleKey)*),
            NS_IFILEPICKER_modeSave);

    fp.SetDefaultExtension(NewString(aFpP^.fileInfo^.fileExt).AString);
    fp.SetDefaultString(NewString(GetNormalizedLeafName(aFpP^.fileInfo^.fileName,
                                             aFpP^.fileInfo^.fileExt)).AString);
    AppendFiltersForContentType(fp, aFpP^.contentType, aFpP^.fileInfo^.fileExt,
                                aFpP^.saveMode);

    if Dir <> nil then
      fp.DisplayDirectory := Dir;

    if (aFpP.IsDocument) then begin
      try
        fp.FilterIndex := prefs.getIntPref('save_converter_index');
      except
      end;
    end;

    if ((fp.Show = NS_IFILEPICKER_returnCancel) or (fp._File = nil)) then begin
      Result := False;
      Exit;
    end;

    Directory := fp._File.parent as nsILocalFile;
    prefs.SetComplexValue('lastDir', nsILocalFile, Directory);

    LeafName := NewString;
    fp._File.GetLeafName(LeafName.AString);
    fp._File.SetLeafName(NewString(ValidateFileName(LeafName.ToString)).AString);
    aFpP.SaveAsType := fp.FilterIndex;
    aFpP._File := fp._File;
    aFpP.FileURL := fp.FileURL;

    if (aFpP.IsDocument) then
      prefs.SetIntPref('save_converter_index', aFpP.SaveAsType);
  end
  else begin
    //ここはどう考えても効率的ではない(DelphiとXPCOMの往復)ので全面的にDelphiのコードに書き換える
    Dir.Append(NewString(
                 GetNormalizedLeafName(
                     aFpP.fileInfo.FileName,
                     aFpP.fileInfo.FileExt)).AString);
    _File := Dir;

    // Since we're automatically downloading, we don't get the file picker's 
    // logic to check for existing files, so we need to do that here.
    //
    // Note - this code is identical to that in
    //   mozilla/toolkit/mozapps/downloads/src/nsHelperAppDlg.js.in
    // If you are updating this code, update that code too! We can't share code
    // here since that code is called in a js component.
    CollisionCount := 0;
    LeafName := NewString;
    sk := TSkRegExp.Create;
    try
      while (_File.exists()) do begin
        Inc(CollisionCount);
        fp._File.GetLeafName(LeafName.AString);
        TmpLeafName := LeafName.ToString;
        if (CollisionCount = 1) then begin
          // Append '(2)' before the last dot in (or at the end of) the filename
          // special case .ext.gz etc files so we don't wind up with .tar(2).gz
          sk.Expression := '\.[^\.]{1,3}\.(gz|bz2|Z)$';
          if sk.Exec(TmpLeafName) then
            TmpLeafName := sk.Replace(TmpLeafName, '(2)$&', False)
          else begin
            sk.Expression := '(\.[^\.]*)?$';
            TmpLeafName := sk.Replace(TmpLeafName, '(2)$&', False);
          end;

        end
        else begin
          // replace the last (n) in the filename with (n+1)
          sk.Expression := '^(.*\()\d+\)';
          TmpLeafName := sk.Replace(TmpLeafName, '$1' + IntToStr(CollisionCount+1) + ')');
        end;
        _File.SetLeafName(NewString(TmpLeafName).AString);
      end;
    finally
      sk.Free;
    end;
    aFpP._File := _File;
  end;

  Result := True;
end;

function GetSaveModeForContentType(aContentType:String):Integer;
begin
  Result := SAVEMODE_FILEONLY;
  if (aContentType = 'text/html') or
     (aContentType = 'application/xhtml+xml') or
     (aContentType = 'image/svg+xml') then
  begin
    Result := (Result or SAVEMODE_COMPLETE_TEXT);
    if (aContentType = 'text/html') or
       (aContentType = 'application/xhtml+xml') or
       (aContentType = 'image/svg+xml') then
    begin
      Result := (Result or SAVEMODE_COMPLETE_DOM);
    end;
  end;
end;

function InternalSave(aURL:String; aDocument:nsIDOMDocument;
                      aDefaultFileName:String; aContentDisposition:String;
                      aContentType:String; aShouldBypassCache:Boolean;
                      aFilePickerTitleKey:String; aChosenData:PChosenData; aReferrer:nsIURI;
                      aSkipPrompt:Boolean = False):Boolean;
var
  SaveMode, EncodingFlags:Integer;
  IsDocument:Boolean;
  SaveAsType:Integer;
  _File, FilesFolder:nsILocalFile;
  FileURL:nsIURI;
  Charset, FFLeafName:IInterfacedString;
  CharsetC:IInterfacedCString;
  fpParams:TFilePickerParams;
  tr:nsITransfer;
  UseSaveDocument:Boolean;
  Source:nsISupports;
  Persist:nsIWebBrowserPersist;
  FileInfo:TFileInfo;
  NameWithoutExtension, FilesFolderLeafName:String;
  PersistArgs:TPersistArgs;
const
  kWrapColumn = 80;
  flags = NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_REPLACE_EXISTING_FILES;
begin
  // Note: aDocument == nil when this code is used by save-link-as...
  SaveMode := GetSaveModeForContentType(aContentType);
  IsDocument := (aDocument <> nil) and (SaveMode <> SAVEMODE_FILEONLY);
  SaveAsType := kSaveAsType_Complete;

  // Find the URI object for aURL and the FileName/Extension to use when saving.
  // FileName/Extension will be ignored if aChosenData supplied.
  //TODO:
  //FileInfo := new FileInfo(aDefaultFileName);
  if aChosenData<>nil then
    _File := aChosenData._File
  else begin
    Charset := NewString;
    CharsetC := NewCString;
    if aDocument<>nil then
      (aDocument as nsIDOMNSDocument).GetCharacterSet(Charset.AString)
    else if aReferrer<>nil then
      aReferrer.GetOriginCharset(CharsetC.ACString);
    //TODO:
    //InitFileInfo(fileInfo, aURL, charset, aDocument,
    //             aContentType, aContentDisposition);

    fpParams.fpTitleKey := aFilePickerTitleKey;
    fpParams.IsDocument := isDocument;
    //pParams.FileInfo := myFileInfo;
    fpParams.ContentType := aContentType;
    fpParams.SaveMode := SaveMode;
    fpParams.SaveAsType := SaveAsType;
    fpParams._File := _File;
    fpParams.FileURL := FileURL;

    if (not GetTargetFile(@fpParams, aSkipPrompt)) then
      // If the method returned false this is because the user cancelled from
      // the save file picker dialog.
      Exit;

    SaveAsType := fpParams.SaveAsType;
    SaveMode := fpParams.SaveMode;
    _File := fpParams._File;
    FileURL := fpParams.FileURL;
  end;

  if (FileURL = nil) then
    FileURL := MakeFileURI(_File);

  // XXX We depend on the following holding true in appendFiltersForContentType():
  // If we should save as a complete page, the saveAsType is kSaveAsType_Complete.
  // If we should save as text, the saveAsType is kSaveAsType_Text.
  UseSaveDocument := IsDocument and
                        (((saveMode and SAVEMODE_COMPLETE_DOM <> 0) and (saveAsType = kSaveAsType_Complete)) or
                         ((saveMode and SAVEMODE_COMPLETE_TEXT <> 0) and (saveAsType = kSaveAsType_Text)));
  // If we're saving a document, and are saving either in complete mode or
  // as converted text, pass the document to the web browser Persist component.
  // If we're just saving the HTML (second option in the list), send only the URI.
  if UseSaveDocument then
    Source := aDocument
  else
    Source := FileInfo.Uri;

  PersistArgs.source := Source;
  PersistArgs.target := FileURL;
  PersistArgs.bypassCache := aShouldBypassCache;
  if (aChosenData=nil) and UseSaveDocument and (SaveAsType = kSaveAsType_Text) then
    PersistArgs.contentType := 'text/plain'
  else
    PersistArgs.contentType := '';
  PersistArgs.postData := nil; //IsDocument ? getPostData() : nil,

  Persist := MakeWebBrowserPersist();

  // Calculate Persist flags.
  if aShouldBypassCache then
    Persist.PersistFlags := flags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_BYPASS_CACHE
  else
    Persist.PersistFlags := flags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_FROM_CACHE;

  // Leave it to WebBrowserPersist to discover the encoding type (or lack thereof):
  Persist.PersistFlags := Persist.PersistFlags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_AUTODETECT_APPLY_CONVERSION;

  // Create download and initiate it (below)
  NS_CreateInstance('@mozilla.org/transfer;1', nsITransfer, tr);

  if (UseSaveDocument) then begin
    // Saving a Document, not a URI:
    FilesFolder := nil;
    if (PersistArgs.ContentType <> 'text/plain') then begin
      // Create the local directory into which to save associated files.
      FilesFolder := _File.clone() as nsILocalFile;

      FFLeafName := NewString;
      FilesFolder.GetLeafName(FFLeafName.AString);
      NameWithoutExtension := GetFileBaseName(FFLeafName.ToString);
      FilesFolderLeafName := NameWithoutExtension + '_files';
      //GetStringBundle.FormatStringFromName('filesFolder',
      //                                          [nameWithoutExtension],
      //                                          1);

      FilesFolder.SetLeafName(NewString(FilesFolderLeafName).AString);
    end;

    EncodingFlags := 0;
    if (PersistArgs.ContentType = 'text/plain') then begin
      EncodingFlags := EncodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_FORMATTED or
                       NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_ABSOLUTE_LINKS or
                       NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_NOFRAMES_CONTENT;
    end
    else begin
      EncodingFlags := EncodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_ENCODE_BASIC_ENTITIES;
    end;


    if aChosenData<>nil then
      tr.init(aChosenData.uri, PersistArgs.target, NewString.AString, nil, 0, nil, Persist)
    else
      tr.init(fileInfo.uri, PersistArgs.target, NewString.AString, nil, 0, nil, Persist);

    //Persist.progressListener = new DownloadListener(window, tr);
    Persist.SaveDocument((PersistArgs.source as nsIDOMDocument), PersistArgs.target, filesFolder,
                         PAnsiChar(PersistArgs.contentType), EncodingFlags, kWrapColumn);
  end
  else begin
    if aChosenData<>nil then
      tr.init(aChosenData.uri, PersistArgs.target, NewString.AString, nil, 0, nil, Persist)
    else
      tr.init(source as nsIURI, PersistArgs.target, NewString.AString, nil, 0, nil, Persist);
    //Persist.progressListener = new DownloadListener(window, tr);
    if aChosenData<>nil then
      Persist.SaveURI(aChosenData.uri,
                    nil, aReferrer, PersistArgs.postData, nil,
                    PersistArgs.target)
    else
      Persist.SaveURI(source as nsIURI,
                    nil, aReferrer, PersistArgs.postData, nil,
                    PersistArgs.target);
  end;
end;

function MakeURI(aURL:String; aOriginCharset:String; aBaseURI:nsIURI):nsIURI;
begin
  Result := NS_GetIOService.NewURI(NewCString(aURL).ACString, PAnsiChar(aOriginCharset), aBaseURI);
end;

function MakeFileURI(aFile:nsIFile):nsIURI;
begin
  Result := NS_GetIOService.NewFileURI(aFile);
end;

function MakeWebBrowserPersist:nsIWebBrowserPersist;
var
  Persist: nsIWebBrowserPersist;
begin
  NS_CreateInstance('@mozilla.org/embedding/browser/nsWebBrowserPersist;1',nsIWebBrowserPersist,Persist);
  Result := Persist;
end;

function MakeFilePicker:nsIFilePicker;
var
  fp:nsIFilePicker;
begin
  NS_GetService('@mozilla.org/filepicker;1',nsIFilePicker,fp);
  Result := fp;
end;

function GetMIMEService:nsIMIMEService;
var
  mimeSvc:nsIMIMEService;
begin
  NS_GetService('@mozilla.org/mime;1',nsIMIMEService,mimeSvc);
  Result := mimeSvc;
end;

//@todo
procedure SaveFrameDocument;
begin
//
end;

procedure SaveDocument(aDocument:nsIDOMDocument; aSkipPrompt:Boolean);
var
  ContentDisposition:IInterfacedString;
  WinUtil:nsIDOMWindowUtils;
  Href, ContentType, Referer:IInterfacedString;
  RefererURI:nsIURI;
begin
  if aDocument=nil then raise Exception.Create('Must have a document when calling SaveDocument');

  // We want to use cached data because the document is currently visible.
  ContentDisposition := NewString;
  try
    ((aDocument as nsIDOMDocumentView).defaultView as nsIInterfaceRequestor)
          .GetInterface(nsIDOMWindowUtils, WinUtil);
    WinUtil.GetDocumentMetadata(NewString('content-disposition').AString, ContentDisposition.AString);
  except
    // Failure to get a content-disposition is ok
  end;

  Href := NewString;
  (aDocument as nsIDOMNSDocument).Location.GetHref(Href.AString);
  ContentType := NewString;
  (aDocument as nsIDOMNSDocument).GetContentType(ContentType.AString);
  Referer := NewString;
  (aDocument as nsIDOMNSDocument).GetReferrer(Referer.AString);
  if Referer.ToString<>'' then RefererURI := MakeURI(Referer.ToString,'',nil)
  else RefererURI := nil;

  InternalSave(Href.ToString, aDocument, '', ContentDisposition.ToString,
               ContentType.ToString, False, '', nil,
               RefererURI, aSkipPrompt);
end;

//@cmpl
procedure SaveURL(aURL:String; aFileName:String; aFilePickerTitleKey:String;
                  aShouldBypassCache:Boolean; aSkipPrompt:Boolean; aReferrer:nsIURI);
begin
  InternalSave(aURL, nil, aFileName, '', '', aShouldBypassCache,
               aFilePickerTitleKey, nil, aReferrer, aSkipPrompt);
end;

//@cmpl
procedure SaveImageURL(aURL:String; aFileName:String; aFilePickerTitleKey:String;
                  aShouldBypassCache:Boolean; aSkipPrompt:Boolean; aReferrer:nsIURI);
var
  imageCache:imgICache;
  props:nsIProperties;
  ContentType, ContentDisposition:nsISupportsCString;
begin
  if not aShouldBypassCache then begin
    try
      NS_GetService('@mozilla.org/image/cache;1',imgICache,imageCache);
      props := imageCache.FindEntryProperties(MakeURI(aURL, GetCharsetforSave(nil), nil));
      if props <> nil then begin
        props.Get('type', nsISupportsCString, ContentType);
        props.Get('content-disposition', nsISupportsCString, ContentDisposition);
      end;
    except
      // Failure to get type and content-disposition off the image is non-fatal
    end;
  end;
  InternalSave(aURL, nil, aFileName, NStr2DStr(ContentDisposition), NStr2DStr(ContentType),
               aShouldBypassCache, aFilePickerTitleKey, nil, aReferrer, aSkipPrompt);
end;

//@cmpl
function ValidateFileName(fileName:String):String;
begin
  Result:=StringReplace(fileName,'"','''',[rfReplaceAll]);
  Result:=StringReplace(Result,'*',' ',[rfReplaceAll]);
  Result:=StringReplace(Result,':',' ',[rfReplaceAll]);
  Result:=StringReplace(Result,'?',' ',[rfReplaceAll]);
  Result:=StringReplace(Result,'<','(',[rfReplaceAll]);
  Result:=StringReplace(Result,'>',')',[rfReplaceAll]);
  Result:=StringReplace(Result,'\','_',[rfReplaceAll]);
  Result:=StringReplace(Result,'/','_',[rfReplaceAll]);
  Result:=StringReplace(Result,'|','_',[rfReplaceAll]);
end;

// If we are able to save a complete DOM, the 'save as complete' filter
// must be the first filter appended.  The 'save page only' counterpart
// must be the second filter appended.  And the 'save as complete text'
// filter must be the third filter appended.
procedure AppendFiltersForContentType(aFilePicker:nsIFilePicker; aContentType:String; aFileExtension:String; aSaveMode:Integer);
var
  BundleName:String; // The bundle name for saving only a specific content type.
  FilterString:String; // The corresponding filter string for a specific content type.
  Bundle: nsIStringBundle;
  MimeInfo: nsIMIMEInfo;
  extString: String;
  extEnumerator: nsIUTF8StringEnumerator;
  extension: IInterfacedCString;
  desc: IInterfacedString;
begin
  bundle := getStringBundle();

  // XXX all the cases that are handled explicitly here MUST be handled
  // in GetSaveModeForContentType to return a non-fileonly filter.
  if aContentType = 'text/html' then begin
    bundleName   := 'WebPageHTMLOnlyFilter';
    filterString := '*.htm; *.html';
  end
  else if aContentType = 'application/xhtml+xml' then begin
    bundleName   := 'WebPageXHTMLOnlyFilter';
    filterString := '*.xht; *.xhtml';
  end
  else if aContentType = 'image/svg+xml' then begin
    bundleName   := 'WebPageSVGOnlyFilter';
    filterString := '*.svg; *.svgz';
  end
  else if (aContentType = 'text/xml') or (aContentType = 'application/xml') then begin
    bundleName   := 'WebPageXMLOnlyFilter';
    filterString := '*.xml';
  end
  else begin
    if (aSaveMode <> SAVEMODE_FILEONLY) then
      raise Exception.Create('Invalid save mode for type '' + aContentType + ''');

    MimeInfo := GetMIMEInfoForType(aContentType, aFileExtension);
    if MimeInfo<>nil then begin

      extEnumerator := mimeInfo.getFileExtensions();

      extString := '';
      extension := NewCString;
      while (extEnumerator.hasMore()) do begin
        extEnumerator.getNext(extension.ACString);
        if (extString<>'') then
          extString := extString + '; ';    // If adding more than one extension,
                                // separate by semi-colon
        extString := extString + '*.' + extension.ToString;
      end;

      if (extString<>'') then begin
        desc := NewString;
        MimeInfo.GetDescription(desc.AString);
        aFilePicker.AppendFilter(desc.AString, NewString(extString).AString);
      end;
    end;

  end;

  if (aSaveMode and SAVEMODE_COMPLETE_DOM) <> 0 then begin
    aFilePicker.AppendFilter(NewString(bundle.GetStringFromName('WebPageCompleteFilter')).AString, NewString(filterString).AString);
    // We should always offer a choice to save document only if
    // we allow saving as complete.
    aFilePicker.AppendFilter(NewString(bundle.GetStringFromName(PWideChar(WideString(bundleName)))).AString, NewString(filterString).AString);
  end;

  if (aSaveMode and SAVEMODE_COMPLETE_TEXT) <> 0 then
    aFilePicker.AppendFilters(NS_IFILEPICKER_filterText);

  // Always append the all files (*) filter
  aFilePicker.AppendFilters(NS_IFILEPICKER_filterAll);
end;

(*
function urlSecurityCheck(aURL, aPrincipal, aFlags)
{
  const nsIScriptSecurityManager =
    Components.interfaces.nsIScriptSecurityManager;
  var secMan = Components.classes['@mozilla.org/scriptsecuritymanager;1']
                         .getService(nsIScriptSecurityManager);
  if (aFlags === undefined)
    aFlags = nsIScriptSecurityManager.STANDARD;

  try {
    if (aURL instanceof Components.interfaces.nsIURI)
      secMan.checkLoadURIWithPrincipal(aPrincipal, aURL, aFlags);
    else
      secMan.checkLoadURIStrWithPrincipal(aPrincipal, aURL, aFlags);
  } catch (e) {
    // XXXmano: dump the principal url here too
    throw 'Load of ' + aURL + ' denied.';
  }
}*)


end.
