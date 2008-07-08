unit SaveUtils;

interface

uses
  Forms,Classes, SysUtils,StrUtils,nsXPCOM,nsXPCOMGlue,nsGeckoStrings, nsConsts,BagelPref,Dialogs,
  nsMIMEInfo,nsStringEnumerator,nsMIMEService,nsMIMEHeaderParam,nsTextToURI,
  nsDOM,nsNetUtil,nsWebBrowserPersist,nsImg//,//nsDownload,
  ;

const
// We have no DOM, and can only save the URL as is.
  SAVEMODE_FILEONLY      = 0;
// We have a DOM and can save as complete.
  SAVEMODE_COMPLETE_DOM  = 1;
// We have a DOM which we can serialize as text.
  SAVEMODE_COMPLETE_TEXT = 2;

  kSaveAsType_Complete = 0;   // Save document with attached objects
// const kSaveAsType_URL = 1;     // Save document or URL by itself
  kSaveAsType_Text = 2;       // Save document, converting to plain text.

procedure SaveURL(aURL:String; aFileName:String; aFilePickerTitleKey:String; aShouldBypassCache:Boolean=true;
                 aSkipPrompt:Boolean=false; aReferrer:String=''; aBasePath:String = '');

procedure SaveImageURL(aURL:String; aFileName:String; aFilePickerTitleKey:String; aShouldBypassCache:Boolean=true;
                 aSkipPrompt:Boolean=false; aReferrer:String=''; aBasePath:String = '');


procedure SaveDocument(aDocument:nsIDOMDocument; aSkipPrompt:Boolean; aBasePath:String = '');

function SaveFrameDocument:Boolean;

function InternalSave(aURL:String;
                      aDocument:nsIDOMDocument;
                      aDefaultFileName:String;
                      aContentDisposition:String;
                      aContentType:String;
                      aShouldBypassCache:Boolean=True;
                      aFilePickerTitle:String = '';
                      aReferrer:String = '';
                      aSkipPrompt:Boolean = false;
                      aBasePath:String = ''):Boolean;

function GetSaveModeForContentType(aContentType:String):Integer;

function GetMIMEInfoForType(aMIMEType:String; aExtension:String):nsIMIMEInfo;

function GetMIMEService:nsIMIMEService;
                      {
GetDefaultExtension
GetFileBaseName
GetTargetFile          }
function GetTargetFile(aContentType:String;
                       aFileExtension:String;
                       aDefaultFileName:String;
                       aSaveMode:Integer;
                       aSkipPrompt:Boolean;
                       var saveAsType:Integer;
                       var localfile:nsILocalFile;
                       aBasePath:String=''):Boolean;

function GetFilterForContentType(aContentType:String; aFileExtension:String; aSaveMode:Integer):String;

function GetDefaultFileName(aDefaultFileName:String; aURI:nsIURI; aDocument:nsIDOMDocument;
                            aContentDisposition:string):String;
function getCharsetforSave(aDocument:nsIDOMDocument):WideString;

function validateFileName(fileName:String):String;

implementation

procedure SaveURL(aURL:String; aFileName:String; aFilePickerTitleKey:String; aShouldBypassCache:Boolean=true;
                 aSkipPrompt:Boolean=false; aReferrer:String=''; aBasePath:String = '');
begin
  internalSave(aURL, nil, aFileName, '', '', aShouldBypassCache,
               aFilePickerTitleKey, aReferrer, aSkipPrompt, aBasePath);
end;

procedure SaveImageURL(aURL:String; aFileName:String; aFilePickerTitleKey:String; aShouldBypassCache:Boolean=true;
                 aSkipPrompt:Boolean=false; aReferrer:String=''; aBasePath:String = '');
var
  imageCache:imgICache;
  props:nsIProperties;
  uri:nsIURI;
  contentType:nsISupportsCString;
  strContentType:IInterfacedCString;
  acstrContentType:nsACString;
  contentDisposition:nsISupportsCString;
  strContentDisposition:IInterfacedCString;
  acstrContentDisposition:nsACString;
begin
//.
  if aURL='' then Exit;
  if not aShouldBypassCache then begin
    NS_GetService('@mozilla.org/image/cache;1',imgICache,imageCache);
    NS_CreateInstance('@mozilla.org/network/standard-url;1',nsIURI,uri);
    uri.SetSpec(NewCString(aURL).ACString);
    props := imageCache.FindEntryProperties(uri);
    if props<>nil then begin
      strContentType:=NewCString;
      acstrContentType:=strContentType.ACString;
      props.Get('type',nsISupportsCString,contentType);
      if contentType<>nil then
      contentType.GetData(acstrContentType);

      strContentDisposition:=NewCString;
      acstrContentDisposition:=strContentDisposition.ACString;
      props.Get('content-disposition',nsISupportsCString,contentDisposition);
      if contentDisposition<> nil then
      contentDisposition.GetData(acstrContentDisposition);

    end;
  end;
  internalSave(aURL,nil,aFileName,strContentDisposition.ToString,strContentType.ToString,aShouldBypassCache,aFilePickerTitleKey,
  aReferrer,aSkipPrompt,aBasePath);
end;
(*{
  }
  internalSave(aURL, null, aFileName, contentDisposition, contentType,
               aShouldBypassCache, aFilePickerTitleKey, null, aReferrer, aSkipPrompt);
}*)


procedure SaveDocument(aDocument:nsIDOMDocument; aSkipPrompt:Boolean; aBasePath:String = '');
var
//  contentDisposition:nsISupportsCString;
  absView:nsIDOMAbstractView;
  ir:nsIInterfaceRequestor;
  utils:nsIDOMWindowUtils;
  disp:IInterfacedString;
  nsADisp:nsAString;
  contentType:IInterfacedString;
  nsAContentType:nsAString;
  location:nsIDOMLocation;
  href:IInterfacedString;
  nsAHref:nsAString;
//  contentDisposition:nsISupportsCString;
begin
  if aDocument=nil then Exit;
  absView := (aDocument as nsIDOMDocumentView).DefaultView;
  absView.QueryInterface(nsIInterfaceRequestor,ir);
  ir.GetInterface(nsIDOMWindowUtils,utils);
  disp:=NewString;
  nsADisp:=disp.AString;
  contentType:=NewString;
  nsAContentType:=contentType.AString;
  utils.GetDocumentMetadata(NewString('content-disposition').AString,nsADisp);
  (aDocument as nsIDOMNSDocument).GetContentType(nsAContentType);
  href := NewString;
  nsAhref := href.AString;
  location := (aDocument as nsIDOMNSDocument).Location;
  location.GetHref(nsAhref);
  {const nsISupportsWString = Components.interfaces.nsISupportsWString;
var string = Components.classes['@mozilla.org/supports-wstring;1'].createInstance(nsISupportsWString);
string.data = 文字列 ;}
//  NS_CreateInstance('@mozilla.org/supports-cstring;1',nsISupportsCString,contentDisposition);
//  contentDisposition.SetData(NewCString(disp.ToString).ACString);
  internalSave(href.ToString,aDocument,'',disp.ToString,contentType.ToString,false,'','',aSkipPrompt,aBasePath);
(*
  if (!aDocument)
    throw "Must have a document when calling saveDocument";

  // We want to use cached data because the document is currently visible.
  var contentDisposition = null;
  try {
    contentDisposition =
      aDocument.defaultView
               .QueryInterface(Components.interfaces.nsIInterfaceRequestor)
               .getInterface(Components.interfaces.nsIDOMWindowUtils)
               .getDocumentMetadata("content-disposition");
  } catch (ex) {
    // Failure to get a content-disposition is ok
  }
  internalSave(aDocument.location.href, aDocument, null, contentDisposition,
               aDocument.contentType, false, null, null, aSkipPrompt);
*)
end;

function SaveFrameDocument:Boolean;
begin
//
end;

function GetSaveModeForContentType(aContentType:String):Integer;
var
  saveMode:Integer;
begin
  saveMode := SAVEMODE_FILEONLY;
  if (aContentType = 'text/html') or (aContentType = 'application/xhtml+xml') then
  begin
    saveMode:=saveMode or SAVEMODE_COMPLETE_TEXT;
    saveMode:=saveMode or SAVEMODE_COMPLETE_DOM;
  end
  else if (aContentType = 'text/xml') or (aContentType = 'application/xml') then
  begin
    saveMode:=saveMode or SAVEMODE_COMPLETE_DOM;
  end;

  Result := saveMode;
end;

function InternalSave(aURL:String;
                      aDocument:nsIDOMDocument;
                      aDefaultFileName:String;
                      aContentDisposition:String;
                      aContentType:String;
                      aShouldBypassCache:Boolean=True;
                      aFilePickerTitle:String = '';
                      aReferrer:String = '';
                      aSkipPrompt:Boolean = false;
                      aBasePath:String = ''):Boolean;
var
  saveMode:Integer;
  isDocument:Boolean;
  saveAsType:Integer;
  uri:nsIURI;
  url:nsIURL;
  fileURL:nsIURI;
  fileExtension:IInterfacedCString;
  nsACFileExtension:nsACString;
  fileName:String;
  thefile:nsILocalFile;
  simplefile:nsiFile;
  useSaveDocument:Boolean;
  persist:nsIWebBrowserPersist;
  flags:Cardinal;
  pd:nsIProgressDialog;
  ref:nsIURI;
  encodingFlags:Cardinal;
  filesFolder:nsIFile;
  leafname:IInterfacedString;
  nsALeafname:nsAString;
  newleafname:IInterfacedString;
begin
  SaveMode:=GetSaveModeForContentType(aContentType);
  isDocument:=(aDocument <> nil) and (saveMode <> SAVEMODE_FILEONLY);
  saveAsType := kSaveAsType_Complete;

  //initFileInfoの代わりの処理
  NS_NewURI(uri,aURL);
  uri.QueryInterface(nsIURL,url);
  fileExtension:=NewCString;
  nsACfileExtension:=fileExtension.ACString;
  url.GetFileExtension(nsACfileExtension);

  fileName:=getDefaultFileName(aDefaultFileName,
                                      uri, aDocument, aContentDisposition);

  if not GetTargetFile(aContentType,fileExtension.ToString,fileName,SaveMode,aSkipPrompt,saveAsType,thefile,aBasePath) then Exit;

//  simpleFile:=(thefile as nsIFile);
  NS_NewFileURI(fileURL,thefile);
  useSaveDocument:= (isDocument) and
                        (((saveMode and SAVEMODE_COMPLETE_DOM<>0) and (saveAsType = kSaveAsType_Complete)) or
                         ((saveMode and SAVEMODE_COMPLETE_TEXT<>0) and (saveAsType = kSaveAsType_Text)));
  NS_Createinstance('@mozilla.org/embedding/browser/nsWebBrowserPersist;1',nsIWebBrowserPersist,persist);
  flags:=NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_REPLACE_EXISTING_FILES;
  if (aShouldBypassCache) then
    flags := flags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_BYPASS_CACHE
  else
    flags := flags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_FROM_CACHE;
  flags:=flags or NS_IWEBBROWSERPERSIST_PERSIST_FLAGS_AUTODETECT_APPLY_CONVERSION;

  NS_CreateInstance('@mozilla.org/progressdialog;1',nsIProgressDialog,pd);
  if useSaveDocument then begin
    if (saveAsType <> kSaveAsType_Text) then begin   //text/plainではない
      thefile.Clone(filesFolder);
      leafname:=NewString;
      nsALeafName:=leafname.AString;

      filesFolder.GetLeafName(nsALeafName);
      newleafname:=NewString(ChangeFileExt( leafname.ToString, '' )+'_files');
//      ShowMessage(newleafname.ToString);
      filesFolder.SetLeafName(newleafname.AString);
      encodingFlags := encodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_ENCODE_BASIC_ENTITIES;
    end
    else begin
      aContentType:='text/plain';
      encodingFlags := encodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_FORMATTED;
      encodingFlags := encodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_ABSOLUTE_LINKS;
      encodingFlags := encodingFlags or NS_IWEBBROWSERPERSIST_ENCODE_FLAGS_NOFRAMES_CONTENT;
    end;
    pd.Init(uri,fileURL,nil,nil,0,nil,persist);
    persist.SetProgressListener(pd);

    persist.SaveDocument(aDocument,thefile,filesFolder,PChar(aContentType),encodingFlags,80);
  end
  else begin
    pd.Init(uri,fileURL,nil,nil,0,nil,persist);
    persist.SetProgressListener(pd);
    NS_NewURI(ref,aReferrer);
    persist.SaveURI(uri,nil,ref,nil,PChar(''),fileURL);
  end;
end;

function GetFilterForContentType(aContentType:String; aFileExtension:String; aSaveMode:Integer):String;
var
  filterString:String;
  info:nsIMIMEInfo;
  extEnumerator:nsIUTF8StringEnumerator;
  hasMore:LongBool;
  extString:String;
  extension:IInterfacedCString;
  nsACExtension:nsACString;
  description:IInterfacedString;
  nsADescription:nsAString;
begin
  if aContentType='text/html' then begin
    filterString:='HTMLファイルのみ|*.htm;*.html'
  end
  else if aContentType='application/xhtml+xml' then begin
    filterString:='XHTMLファイルのみ|*.xht;*.xhtml'
  end
  else if (aContentType='text/xml') or (aContentType = 'application/xml') then begin
    filterString:='XMLファイル|*.xml'
  end
  else begin
    info:=getMIMEInfoForType(aContentType,aFileExtension);
    if info<>nil then begin
      info.GetFileExtensions(extEnumerator);
      extEnumerator.HasMore(hasmore);
      extension:=NewCString;
      nsACExtension:=extension.ACString;
      while hasmore do begin
        extEnumerator.GetNext(nsACExtension);
        if extString<>'' then extString:=extString+';';
        extString:='*.'+extString;
        extEnumerator.HasMore(hasmore);
      end;
      if extString<>'' then begin
        description:=NewString;
        nsAdescription:=description.AString;
        info.GetDescription(nsAdescription);
        filterString:=description.ToString+'|'+extString;
      end;
    end;
  end;

  if (aSaveMode and SAVEMODE_COMPLETE_DOM)<>0 then begin
    filterString:='Webページ(完全)|*.htm;*.html|'+filterString;
    //aFilePicker.appendFilter(bundle.GetStringFromName("WebPageCompleteFilter"), filterString);
    // We should always offer a choice to save document only if
    // we allow saving as complete.
    //aFilePicker.appendFilter(bundle.GetStringFromName(bundleName), filterString);
  end;

  if (aSaveMode and SAVEMODE_COMPLETE_TEXT)<>0 then filterString:=filterString+'|プレーンテキスト|*.txt';


  // Always append the all files (*) filter
  filterString:=filterString+'|すべて表示|*.*';
  Result:=filterString;
end;

function GetTargetFile(aContentType:String;
                       aFileExtension:String;
                       aDefaultFileName:String;
                       aSaveMode:Integer;
                       aSkipPrompt:Boolean;
                       var saveAsType:Integer;
                       var localfile:nsILocalFile;
                       aBasePath:String=''):Boolean;
var
  dialog:TSaveDialog;
  local:nsILocalFile;
begin
  //Pref.UseDLDir or 
  if aSkipPrompt then begin//デフォルトのフォルダに保存される
    Result:=true;
    if aBasePath<>'' then begin
      NS_NewLocalFile(NewString(aBasePath+aDefaultFileName).AString,true,local);
    end
    else begin
      NS_NewLocalFile(NewString(ExtractFilepath(Application.ExeName)+aDefaultFileName).AString,true,local);
    end;
    localfile:=local;
  end
  else begin
    dialog:=TSaveDialog.Create(nil);
    //dialog.Filter
    dialog.FileName:=aDefaultFileName;
    dialog.Filter:=GetFilterForContentType(aContentType,aFileExtension,aSaveMode);
    if dialog.Execute then begin
      Result:=true;
      saveAsType:=dialog.FilterIndex-1;
      NS_NewLocalFile(NewString(dialog.FileName).AString,true,local);
      localfile:=local;
    end
    else begin
      Result:=false;
    end;
    dialog.Free;
  end;


{
Gecko をレンダリングエンジンに使用した、軽量タブブラウザ。Donutシリーズに外観を似せ、FirefoxやOpenJaneも参考にしている。
名前の由来はベーグルとドーナツがともにトーラス状だからのよう。
}
end;



function GetDefaultFileName(aDefaultFileName:String; aURI:nsIURI; aDocument:nsIDOMDocument;
                            aContentDisposition:String):String;
var
  mhp:nsIMIMEHeaderParam;
  nsACStr:nsACString;
  dummy:PChar;
  fileName:IInterfacedString;
  nsAFileName:nsAString;

  CfileName:IInterfacedCString;
  nsACFileName:nsACString;

  charset:IInterfacedCString;
  nsACCharset:nsACString;

  originCharset:IInterfacedCString;
  nsACOriginCharset:nsACString;
  url:nsIURL;
  texttosuburi:nsITextToSubURI;
begin
  fileName:=NewString;
  nsAFileName:=filename.AString;
  
  if aContentDisposition<> '' then begin//content-dispositionヘッダに従う
    NS_GetService('@mozilla.org/network/mime-hdrparam;1',nsIMIMEHeaderParam,mhp);
    //aContentDisposition.GetData(nsACStr);
    charset:=NewCString(GetCharsetForSave(aDocument));
    nsACCharset:=charset.ACString;
    mhp.GetParameter(NewCString(aContentDisposition).ACString,PChar('filename'),nsACCharset,true,dummy,nsAFileName);
    if filename.ToString<>'' then begin
      Result:=filename.ToString;
      Exit;
    end;
  end;

  CfileName:=NewCString;
  nsACfileName:=CfileName.ACString;
  aURI.QueryInterface(nsIURL,url);
  url.GetFileName(nsACfileName);

  originCharset:=NewCString;
  nsACOriginCharset:=originCharset.ACString;
  url.GetOriginCharset(nsACOriginCharset);
  if CFileName.ToString<>'' then begin
    NS_GetService('@mozilla.org/intl/texttosuburi;1',nsITextToSubURI,texttosuburi);
    textToSubURI.unEscapeURIForUI(nsACOriginCharset,nsACfileName,nsAFileName);
    Result:=validateFileName(filename.ToString);
    Exit;
  end;
  
  if (aDocument<>nil) then begin
    // 3) Use the document title
    (aDocument as nsIDOMNSDocument).GetTitle(nsAFileName);
    Result:=validateFileName(fileName.ToString);
    Exit;
  end;

  if (aDefaultFileName<>'') then begin
    // 4) Use the caller-provided name, if any
    Result:=validateFileName(aDefaultFileName);
  end;
end;

function getCharsetforSave(aDocument:nsIDOMDocument):WideString;
var
  charset:IInterfacedString;
  nsACharset:nsAString;

begin
  if (aDocument<>nil)then begin
    charset:=NewString;
    nsACharset:=charset.AString;
    (aDocument as nsIDOMNSDocument).GetCharacterSet(nsACharset);
    Result:=charset.ToString;
  end;
end;

function validateFileName(fileName:String):String;
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

function getMIMEInfoForType(aMIMEType:String; aExtension:String):nsIMIMEInfo;
var
info:nsIMIMEInfo;
begin
  Result:=nil;
  GetMIMEService.GetFromTypeAndExtension(NewCString(aMIMEType).ACString,NewCString(aExtension).ACString,info);
  Result:=info;
end;

function GetMIMEService:nsIMIMEService;
var
  mimeSvc:nsIMIMEService;
begin
  NS_GetService('@mozilla.org/mime;1',nsIMIMEService,mimeSvc);
  Result:=mimeSvc;
end;

end.
