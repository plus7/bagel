unit StyleSheetUtils;

interface

uses SysUtils, nsXPCOM, nsTypes, nsGeckoStrings;

function IsValidMedia(StyleSheet:nsIDOMStyleSheet):Boolean;
function IsAlternate(StyleSheet:nsIDOMStyleSheet):Boolean;
function IsPersistent(StyleSheet:nsIDOMStyleSheet):Boolean;
function IsPreferred(StyleSheet:nsIDOMStyleSheet):Boolean;
procedure SetStyleSheetDisabled(StyleSheet:nsIDOMStyleSheet; IsDisabled:Boolean);
function IsValidForFrame(Frame: nsIDOMWindow; Title: String):Boolean;
procedure SwitchStyleSheetInFrame(Frame: nsIDOMWindow; Title: String);

implementation

function IsValidMedia(StyleSheet:nsIDOMStyleSheet):Boolean;//media=screen ‚Ì‚Ý true
var
  mediaText:IInterfacedString;
  strMedia:String;
begin
  MediaText:=NewString('');
  StyleSheet.Media.GetMediaText(mediaText.AString);
  strMedia:=LowerCase(mediatext.ToString);
  Result:=False;
  if (strMedia='') or (Pos('all',strMedia)<>0) or (Pos('screen',strMedia)<>0) then Result:=true;
end;

function IsAlternate(StyleSheet:nsIDOMStyleSheet):Boolean;
var
  Node:nsIDOMNode;
  NodeName:IInterfacedString;
  Attr:IInterfacedString;
  Rel:IInterfacedString;
begin
  Result:=False;
  Node := styleSheet.OwnerNode;
  if Node=nil then Exit;
  NodeName:=NewString;
  Node.GetNodeName(NodeName.AString);
  if LowerCase(NodeName.ToString)<>'link' then Exit;
  Rel:=NewString('rel');
  Attr:=NewString('');
  (Node as nsIDOMElement).GetAttribute(Rel.AString,Attr.AString);
  if Attr.ToString = 'alternate stylesheet' then Result:=True;
end;

function IsPersistent(StyleSheet:nsIDOMStyleSheet):Boolean;
var
  title:IInterfacedString;
begin
  title:=NewString;
  styleSheet.GetTitle(title.AString);
	Result := (not isAlternate(styleSheet)) and (title.ToString = '');
end;

function IsPreferred(StyleSheet:nsIDOMStyleSheet):Boolean;
var
  title:IInterfacedString;
begin
  title:=NewString;
  styleSheet.GetTitle(title.AString);
  Result := (not isAlternate(styleSheet)) and (title.ToString <> '');
end;

procedure SetStyleSheetDisabled(StyleSheet:nsIDOMStyleSheet; IsDisabled:Boolean);
begin
  StyleSheet.SetDisabled(IsDisabled);
end;


function IsValidForFrame(Frame: nsIDOMWindow; Title: String):Boolean;
var
  i:Integer;
  ssl:nsIDOMStyleSheetList;
  styleSheet:nsIDOMStyleSheet;
  str:IInterfacedstring;
begin
  Result:=False;
  ssl := (frame.Document as nsIDOMDocumentStyle).StyleSheets;

  str:=NewString;

  if Title='_nostyle' then Result:=True
  else if TiTle='_default' then Result:=True
  else
  begin
    For i:=0 to ssl.Length -1 do
    begin
      styleSheet:=ssl.Item(i);
      styleSheet.GetTitle(str.AString);
      if str.ToString = Title then
      begin
        Result:=True;
        exit;
      end;
    end;
  end;
end;

procedure SwitchStyleSheetInFrame(Frame: nsIDOMWindow; Title: String);
var
  ssl:nsIDOMStyleSheetList;
  j:Integer;
  i:Integer;
  styleSheet:nsIDOMStyleSheet;
  StrSTitle:IInterfacedString;
begin

  if not IsValidForFrame(Frame, Title) then exit;

  ssl := (Frame.Document as nsIDOMDocumentStyle).StyleSheets;

  For j:=0 to ssl.Length - 1 do
  begin
    styleSheet := ssl.Item(j);
    if IsValidMedia(styleSheet) then
    begin
      if Title = '_nostyle' then SetStyleSheetDisabled(styleSheet, true)
      else if Title = '_default' then
      begin
        if isPersistent(styleSheet) or isPreferred(styleSheet) then
        begin
          SetStyleSheetDisabled(styleSheet, false);
        end
        else
        begin
          SetStyleSheetDisabled(styleSheet, true);
        end;
      end
      else
      begin
        StrSTitle:=NewString('');
        styleSheet.GetTitle(StrSTitle.AString);

        if IsPersistent(styleSheet) then
        begin
          SetStyleSheetDisabled(styleSheet, false);
        end
        else
        begin
          SetStyleSheetDisabled(styleSheet, (StrSTitle.ToString<>Title));
        end;
      end;
    end;
  end;

  if Frame.Frames.Length >0 then For i:=0 to Frame.Frames.Length - 1 do
  begin
    SwitchStyleSheetInFrame(Frame.Frames.Item(i),Title);
  end;

end;


end.
