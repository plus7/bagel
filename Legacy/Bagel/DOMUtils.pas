unit DOMUtils;

interface

uses SysUtils, nsXPCOM, nsTypes, nsGeckoStrings, nsDOM, BagelPref, nsFind, nsXPCOMGlue;

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
function Range2String(range:nsIDOMRange):WideString;
function HilightRange(range:nsIDOMRange;node:nsIDOMElement):nsIDOMElement;
procedure HilightWin(win:nsIDOMWindow;style:String;patText:String;hilight:Boolean);

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

function Range2String(range:nsIDOMRange):WideString;
var
  doc:nsIDOMDocument;
  scrs:nsIDOMNodeList;
  scr:nsIDOMNode;
  trash:nsIDOMRange;
  noscrs:nsIDOMNodeList;
  noscr:nsIDOMNode;
  gp:TGeckoPref;
  tmp:nsIDOMRange;
  tmp2:nsIDOMRange;
  i:Integer;
  count:Cardinal;
  startContainer:nsIDOMNode;
  startOffset:Integer;
  endContainer:nsIDOMNode;
  endOffset:Integer;
  tagName:IInterfacedString;
  aTagName:nsAString;
  toStrRet:IInterfacedString;
  aToStrRet:nsAString;
  parent:nsIDOMNode;
  compare1:SmallInt;
  compare2:SmallInt;
begin
  Result:='';
  startContainer := range.StartContainer;
  startOffset := range.StartOffset;
  endContainer := range.EndContainer;
  endOffset:=range.EndOffset;
  doc:=startContainer.OwnerDocument;
  if doc=nil then Exit;
  scrs := doc.GetElementsByTagName(NewString('SCRIPT').AString);
  trash:=(doc as nsIDOMDocumentRange).CreateRange;
  noscrs := doc.GetElementsByTagName(NewString('NOSCRIPT').AString);
  gp:=TGeckoPref.Create;
  if gp.GetBoolPref('javascript.enabled') then begin
    count := noscrs.Length;
    for i:=0 to count-1 do begin
      noscr := noscrs.Item(i);
      trash.SelectNode(noscr);
      trash.DeleteContents;
    end;
  end;
  tmp:=(doc as nsIDOMDocumentRange).CreateRange;
  tmp2:=(doc as nsIDOMDocumentRange).CreateRange;
  tmp.SetStart(startContainer,startOffset);
  count:=scrs.GetLength;
  tagName:=newString;
  aTagName:=tagName.AString;
  toStrRet:=newString;
  aToStrRet:=toStrRet.AString;
  for i:=0 to count-1 do begin
    scr := scrs.Item(i);
    parent := scr.ParentNode;
    parent.GetNodeValue(aTagName);
    if UpperCase(tagName.ToString)='HEAD' then continue;
    tmp2.SelectNode(scr);
    compare1 := range.CompareBoundaryPoints(0,tmp2);
    compare2 := tmp2.CompareBoundaryPoints(2,range);
    if (compare1=-1) and (compare2=-1) then begin
      tmp.SetEndBefore(scr);
      tmp.ToString(aToStrRet);
      Result:=Result+toStrRet.ToString;
      tmp.SelectNode(scr);
      tmp.Collapse(false);
    end;
  end;
  tmp.SetEnd(endContainer,endOffset);
  tmp.ToString(aToStrRet);
  Result:=Result+toStrRet.ToString;
end;
function HilightRange(range:nsIDOMRange;node:nsIDOMElement):nsIDOMElement;
var
  startContainer:nsIDOMNode;
  before:nsIDOMText;
  startOffset:Integer;
  docfrag:nsIDOMDocumentFragment;
  parent:nsIDOMNode;
  dummy:nsIDOMNode;
begin
  startContainer := range.StartContainer;
  startOffset := range.StartOffset;
  docfrag := range.ExtractContents;
  before := (startContainer as nsIDOMText).SplitText(startOffset);
  parent := before.ParentNode;
  dummy  := node.AppendChild(docfrag);
  dummy  := parent.InsertBefore(node,before);
  Result := node;
end;

procedure HilightWin(win:nsIDOMWindow;style:String;patText:String;hilight:Boolean);
var
  retRange:nsIDOMRange;
  finder:nsIFind;
  searchRange:nsIDOMRange;
  startPt:nsIDOMRange;
  endPt:nsIDOMRange;
  doc:nsIDOMDocument;
  nodeSurround:nsIDOMElement;
  baseNode:nsIDOMElement;
  node:nsIDOMElement;
  nodeListLength:Cardinal;
  body:nsIDOMElement;
  i:Integer;
  name:IInterfacedString;
  aname:nsAString;
  hilightedElm:nsIDOMElement;
  docfrag:nsIDOMDocumentFragment;
  next:nsIDOMNode;
  parent:nsIDOMNode;
  child:nsIDOMNode;
  input:nsIDOMHTMLInputElement;
  parent2:nsIDOMNode;
  parent3:nsIDOMNode;
begin

  if win.Frames.Length >0 then for i:=0 to win.Frames.Length - 1 do begin
    HilightWin(win.Frames.Item(i),style,patText,hilight);
  end;

  doc := win.Document;
  body:= doc.GetDocumentElement;

  if hilight then begin
	  NS_CreateInstance('@mozilla.org/embedcomp/rangefind;1',nsIFind,finder);

	  name:=NewString('span');
	  aname:=name.AString;
	  baseNode:=doc.CreateElement(aname);
	  baseNode.SetAttribute(NewString('style').AString,NewString(style).AString);
	  baseNode.SetAttribute(NewString('id').AString,NewString(BAGEL_HILIGHT_ID).AString);

	  searchRange:=(doc as nsIDOMDocumentRange).CreateRange;
	  startPt:=(doc as nsIDOMDocumentRange).CreateRange;
	  endPt:=(doc as nsIDOMDocumentRange).CreateRange;

	  searchRange.SelectNode(body);
	  startPt.SelectNode(body);
	  startPt.Collapse(true);
	  endPt.SelectNode(body);
	  endPt.Collapse(false);

	  retRange := finder.Find(PWideChar(WideString(patText)),searchRange,startPt,endPt);
	  while retRange<>nil do begin
	    nodeSurround:=(baseNode.CloneNode(true) as nsIDOMElement);
      parent := retRange.StartContainer;
      parent2:= parent.ParentNode;
      if parent2<>nil then parent3 := parent2.ParentNode;
      if Supports(parent3,nsIDOMHTMLInputElement,input) then begin
        startPt := retRange.CloneRange;
        startPt.Collapse(false);
      end
	    else begin
        node:=HilightRange(retRange,nodeSurround);
	      startPt:=(doc as nsIDOMDocumentRange).CreateRange;
	      nodeListLength:=node.ChildNodes.Length;
	      startPt.SetStart(node,nodeListLength);
	      startPt.SetEnd(node,nodeListLength);
      end;
	    retRange := finder.Find(PWideChar(WideString(patText)),searchRange,startPt,endPt);
	  end;
  end
  else begin

    hilightedElm := doc.GetElementById(NewString(BAGEL_HILIGHT_ID).AString);
    while hilightedElm<>nil do begin
      child:=nil;
      docfrag := doc.CreateDocumentFragment;
      next    := hilightedElm.NextSibling;
      parent  := hilightedElm.ParentNode;
      child   := hilightedElm.FirstChild;

      while child<>nil do begin
        docfrag.AppendChild(child);
        child := hilightedElm.FirstChild;
      end;

      parent.RemoveChild(hilightedElm);
      parent.InsertBefore(docfrag,next);

      hilightedElm := doc.GetElementById(NewString(BAGEL_HILIGHT_ID).AString);
    end;
  end;
end;

end.
