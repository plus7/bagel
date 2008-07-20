unit WindowUtils;

interface

uses SysUtils, nsMemory, nsXPCOM, nsTypes, nsGeckoStrings, nsDocShell, nsSelection, BrowserSupports;

function GetDocShellObjByWin(win:nsIDOMWindow):nsIDocShell;
function GetSelConByWin(win:nsIDOMWindow):nsISelectionController;
function GetRootWindowByWin(win:nsIDOMWindow):nsIDOMWindow;
function GetSelectionStrFromWin(win:nsIDOMWindow):WideString;

implementation

function GetDocShellObjByWin(win:nsIDOMWindow):nsIDocShell;
var
  doc:nsIDOMDocument;
  ir:nsIInterfaceRequestor;
  webnav:nsiWebnavigation;
  docshell:nsIDocShell;
begin
  if win=nil then exit;
  doc:=win.Document;
  (doc as nsIDOMDocumentView).GetDefaultView.QueryInterface(nsIInterfaceRequestor,ir);
  ir.GetInterface(nsiWebnavigation,webnav);
  webNav.QueryInterface(nsIDocShell,docshell);
  Result:=docshell;
end;

function GetSelConByWin(win:nsIDOMWindow):nsISelectionController;
var
  ir:nsIInterfaceRequestor;
  seldisp:nsISelectionDisplay;
  selcon:nsISelectionController;
begin
  GetDocShellObjByWin(win).QueryInterface(nsIInterfaceRequestor,ir);
  ir.GetInterface(nsISelectionDisplay,seldisp);
  seldisp.QueryInterface(nsISelectionController,selcon);
  Result:=selcon;
end;

function GetRootWindowByWin(win:nsIDOMWindow):nsIDOMWindow;
var
  tmpWin,window:nsIDOMWindow;
begin
  Result:=nil;
  if win=nil then Exit;
  tmpWin := win.Parent;
  while tmpWin<>nil do begin
    if window=tmpWin then break;
    window:=tmpWin;
    tmpWin := window.Parent;
  end;
  Result:=window;
end;

function GetSelectionStrFromWin(win:nsIDOMWindow):WideString;
var
  childwin:nsIDOMWindow;
  sel:nsISelection;
  length:Cardinal;
  i:Integer;
  ret:String;
  selstr:PWideChar;
begin
  Result:='';
  if win=nil then Exit;
  sel := win.GetSelection;
  if sel.IsCollapsed then begin
    length := win.Frames.Length;
    if length=0 then Result:=''
    else begin
      for i:=0 to length-1 do begin
        childwin := win.Frames.Item(i);
        ret:=GetSelectionStrFromWin(childwin);
        if ret<>'' then begin
          Result:=ret;
          exit;
        end;
      end;
    end;
  end
  else begin
    selstr := sel.ToString;
    Result := WideString(selstr);
    nsMemory.Free(selstr);
  end;
end;

end.
