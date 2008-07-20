unit DOMUtils;

interface

uses SysUtils, nsXPCOM, nsTypes, nsGeckoStrings, nsDOM;

const
  BAGEL_HILIGHT_ID = '_bagel_hilight_id';

function GetPageOffsetLeft( elem : nsIDOMElement ):Integer;
function GetPageOffsetTop( elem : nsIDOMElement ):Integer;
function GetRange(sn:nsIDOMNode;so:Integer;en:nsIDOMNode;eo:Integer):nsIDOMRange;
function IsNodeInsideLink(node:nsIDOMNode):nsIDOMHTMLAnchorElement;
function IsNodeInsideQuote(node:nsIDOMNode):nsIDOMElement;
function IsRangeInsideLink(range:nsIDOMRange):nsIDOMHTMLAnchorElement;
function IsHilightedWin(win:nsIDOMWindow):Boolean;
function IsTargetNew(target:nsIDOMEventTarget):Boolean;

implementation

{LEFT Ç©ÇÁÇÃê‚ëŒç¿ïWÇéÊìæ}
function GetPageOffsetLeft( elem : nsIDOMElement ):Integer;
var
  Left:Integer;
  offsLeft:Integer;
  tmpElem:nsIDOMElement;
  hoge:nsIDOMNSHTMLElement;
begin
  Result := 0;
  if elem=nil then Exit;

  Left:=(elem as nsIDOMNSHTMLElement).OffsetLeft;
  tmpElem:=(elem as nsIDOMNSHTMLElement).OffsetParent;
  while (tmpElem<>nil) do begin
    offsLeft := (tmpElem as nsIDOMNSHTMLElement).OffsetLeft;
    left := left + offsLeft;
    hoge := (tmpElem as nsIDOMNSHTMLElement);
    tmpElem:=hoge.OffsetParent;
  end;

  Result:=left;
end;

{TOP Ç©ÇÁÇÃê‚ëŒç¿ïWÇéÊìæ}
function GetPageOffsetTop( elem : nsIDOMElement ):Integer;
var
  top:Integer;
  offsTop:Integer;
  tmpElem:nsIDOMElement;
  hoge:nsIDOMNSHTMLElement;
begin
  Result := 0;
  if elem=nil then Exit;

  top := (elem as nsIDOMNSHTMLElement).OffsetTop;
  tmpElem:=(elem as nsIDOMNSHTMLElement).OffsetParent;
  while (tmpElem<>nil) do begin
    offsTop:=(tmpElem as nsIDOMNSHTMLElement).OffsetTop;
    top := top + offsTop;
    hoge := (tmpElem as nsIDOMNSHTMLElement);
    tmpElem:=hoge.OffsetParent;
  end;

  Result:=top;
end;

function GetRange(sn:nsIDOMNode;so:Integer;en:nsIDOMNode;eo:Integer):nsIDOMRange;
var
  tmpRange:nsIDOMRange;
begin
  tmpRange := (sn.GetOwnerDocument as nsIDOMDocumentRange).CreateRange;
  tmpRange.SetStart(sn,so);
  tmpRange.SetEnd(en,eo);
  Result:=tmpRange;
end;

function IsNodeInsideLink(node:nsIDOMNode):nsIDOMHTMLAnchorElement;
var
  anchorNode:nsIDOMHTMLAnchorElement;
  tmpnode:nsIDOMNode;
begin
  while node<>nil do begin
    if Supports(node,nsIDOMHTMLAnchorElement,anchorNode) then begin
      Result:=anchorNode;
      exit;
    end;
    tmpnode:=node.ParentNode;
    node:=tmpnode;
  end;
end;

function IsNodeInsideQuote(node:nsIDOMNode):nsIDOMElement;
var
  elm:nsIDOMElement;
  str:IInterfacedString;
  tmpnode:nsIDOMNode;
begin
  str:=NewString;
  while node<>nil do begin
    if Supports(node,nsIDOMElement,elm) then begin
      elm.GetTagName(str.AString);
      if (LowerCase(str.ToString)='q') or (LowerCase(str.ToString)='blockquote') then begin
        Result:=elm;
        exit;
      end;
    end;
    tmpnode := node.ParentNode;
    node:=tmpnode;
  end;
end;

function IsRangeInsideLink(range:nsIDOMRange):nsIDOMHTMLAnchorElement;
var
  commonAncestor:nsIDOMNode;
  node:nsIDOMNode;
begin
  Result:=nil;
  if range = nil then exit;
  commonAncestor := range.CommonAncestorContainer;
  if commonAncestor<>nil then node:=commonAncestor.ParentNode;
  Result:=IsNodeInsideLink(node);
end;

function IsHilightedWin(win:nsIDOMWindow):Boolean;
var
  elm:nsIDOMElement;
  doc:nsIDOMDocument;
  str:IInterfacedString;
  childwin:nsIDOMWindow;
  collection:nsIDOMWindowCollection;
  length:Cardinal;
  i:Integer;
begin
  Result:=False;
  str:=NewString(BAGEL_HILIGHT_ID);
  doc := win.Document;
  elm:=doc.GetElementById(str.AString);
  if elm<>nil then Result:=true
  else begin
    collection := win.Frames;
    length := collection.Length;
    if length=0 then Result:=false
    else begin
      for i:=0 to length-1 do begin
        childwin := collection.Item(i);
        if IsHilightedWin(childwin) then begin
          Result:=true;
          exit;
        end;
      end;
    end;
  end;
end;

function IsTargetNew(target:nsIDOMEventTarget):Boolean;
var
  tagName:IInterfacedString;
  targetStr:IInterfacedString;
begin
  Result:=False;
  targetStr:=NewString('');
  tagName:=NewString('');

  (target as nsIDOMElement).GetTagName(tagName.AString);
  if Uppercase(tagName.ToString)='A' then
  begin
    (target as nsIDOMHTMLAnchorElement).GetTarget(targetStr.AString);
    if (targetStr.ToString = '_content') {or
       (iastr.ToString = '_content') or
       (iastr.ToString = '_content') or
       (iastr.ToString = '_content') }then
    result:=true
    else result:=false;
  end;

end;

end.
