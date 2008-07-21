unit SelectionUtils;

interface

uses SysUtils, nsXPCOM, nsTypes, nsGeckoStrings, nsXPCOMGlue, nsSelection,
     WindowUtils, DOMUtils, nsDOM;

procedure SetSelectionAndScroll(aRange:nsIDOMRange;selCon:nsISelectionController);
procedure SetSelection(aRange:nsIDOMRange;selCon:nsISelectionController);
procedure DoCenterRange(aFrame:nsIDOMWindow;aRange:nsIDOMRange);
procedure ChangeSelectionColor(win:nsIDOMWindow;attention:Boolean);

implementation


procedure SetSelectionAndScroll(aRange:nsIDOMRange;selCon:nsISelectionController);
var
  selection:nsISelection;
begin
  selection := selCon.GetSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
  selection.RemoveAllRanges;
  selection.AddRange(aRange);
  selCon.ScrollSelectionIntoView(
  NS_ISELECTIONCONTROLLER_SELECTION_NORMAL,
  NS_ISELECTIONCONTROLLER_SELECTION_FOCUS_REGION,
  true);
end;

procedure SetSelection(aRange:nsIDOMRange;selCon:nsISelectionController);
var
  selection:nsISelection;
//  a:nsIContentViewer;
begin
//  selection.
//selCon.getSelection(selCon.SELECTION_NORMAL);

  selection := selCon.GetSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
  selection.RemoveAllRanges;
  selection.AddRange(aRange);
  (*selCon.ScrollSelectionIntoView(
  NS_ISELECTIONCONTROLLER_SELECTION_NORMAL,
  NS_ISELECTIONCONTROLLER_SELECTION_FOCUS_REGION,
  true);*)
end;
{RangeÇâÊñ ÇÃíÜâõÇ…éùÇ¡ÇƒÇ≠ÇÈ}
procedure DoCenterRange(aFrame:nsIDOMWindow;aRange:nsIDOMRange);
var
  myRange:nsIDOMRange;
  myElem:nsIDOMElement;
  y_Offset:Integer;
  tmpNode:nsIDOMNode;
  tmpNode2:nsIDOMNode;
  tmpOffset:Integer;
  pageXOffset:Integer;
  FrameHeight:Integer;
begin
  myElem := aFrame.Document.CreateElement(NewString('span').AString);
  myRange := (aFrame.Document as nsIDOMDocumentRange).CreateRange;
  {aRange.GetStartContainer(tmpNode);
  aRange.GetStartOffset(tmpOffset);}
  tmpNode := aRange.EndContainer;
  tmpOffset := aRange.EndOffset;
  myRange.SetStart(tmpNode,tmpOffset);
  myRange.SetEnd(tmpNode,tmpOffset);
  myRange.InsertNode(myElem as nsIDOMNode);

  FrameHeight := (aFrame as nsIDOMWindowInternal).InnerHeight;
  y_Offset := GetPageOffsetTop(myElem) - (FrameHeight div 2);
  pageXOffset := (aFrame as nsIDOMWindowInternal).PageXOffset;
  (aFrame as nsIDOMWindowInternal).Scroll(pageXOffset,y_Offset);

  tmpNode := myElem.ParentNode;
  tmpNode2:=tmpNode.RemoveChild(myElem as nsIDOMNode);
  myRange.DeleteContents;
  myRange.Detach;
  tmpNode.Normalize;
end;

procedure ChangeSelectionColor(win:nsIDOMWindow;attention:Boolean);
var
  selcon:nsISelectionController;
begin
  selcon:=GetSelconByWin(win);
  if selcon=nil then exit;
  if attention then begin
    selcon.SetDisplaySelection(NS_ISELECTIONCONTROLLER_SELECTION_ATTENTION);
  end
  else begin
    selcon.SetDisplaySelection(NS_ISELECTIONCONTROLLER_SELECTION_ON)
  end;
  selcon.RepaintSelection(NS_ISELECTIONCONTROLLER_SELECTION_NORMAL);
end;

end.
