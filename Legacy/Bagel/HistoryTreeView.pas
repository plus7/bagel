(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
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
 * The Original Code is Bagel Support Components.
 *
 * The Initial Developer of the Original Code is NOSE Takafumi.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 *
 * ***** END LICENSE BLOCK ***** *)
 
unit HistoryTreeView;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,
  CommCtrl, ComCtrls, nsTypes, nsPlaces, nsXPCOMGlue,
  nsGeckoStrings, Dialogs, nsInit;
type

  THistorySortingType = (
    hstVisited,
    hstLastVisited,
    hstDayAndSite,
    hstSite,
    hstDay
  );
  THistoryData = class(TObject)
  private
    FResultNode: nsINavHistoryResultNode;
  public
    constructor Create;
    property ResultNode: nsINavHistoryResultNode read FResultNode write FResultNode;
  end;

  THistoryTreeView = class(TCustomTreeView, nsINavHistoryResultViewer)
  private
    FResult: nsINavHistoryResult;
    FSortingType: THistorySortingType;
    procedure SetSortingType(Value: THistorySortingType);

    procedure ItemInserted(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aNewIndex: PRUint32); safecall;
    procedure ItemRemoved(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aOldIndex: PRUint32); safecall;
    procedure ItemMoved(aItem: nsINavHistoryResultNode; aOldParent: nsINavHistoryContainerResultNode; aOldIndex: PRUint32; aNewParent: nsINavHistoryContainerResultNode; aNewIndex: PRUint32); safecall;
    procedure ItemChanged(item: nsINavHistoryResultNode); safecall;
    procedure ItemReplaced(parent: nsINavHistoryContainerResultNode; oldItem: nsINavHistoryResultNode; newItem: nsINavHistoryResultNode; index: PRUint32); safecall;
    procedure ContainerOpened(item: nsINavHistoryContainerResultNode); safecall;
    procedure ContainerClosed(item: nsINavHistoryContainerResultNode); safecall;
    procedure InvalidateContainer(item: nsINavHistoryContainerResultNode); safecall;
    procedure InvalidateAll(); safecall;
    procedure SortingChanged(sortingMode: PRUint16); safecall;
    function GetResult(): nsINavHistoryResult; safecall;
    procedure SetResult(aResult: nsINavHistoryResult); safecall;
    procedure Clear;
    property _Result: nsINavHistoryResult read GetResult write SetResult;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoSearch(keyword: String);
    property SortingType: THistorySortingType read FSortingType write SetSortingType;
  published
    property OnAddition;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnCompare;
    property OnContextPopup;
    property OnCreateNodeClass;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnDblClick;
    property OnDeletion;
    property OnDragDrop;
    property OnDragOver;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnExpanding;
    property OnExpanded;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property HotTrack;
    property RowSelect;
    property HideSelection;
  end;

implementation

constructor THistoryData.Create;
begin
  inherited Create;
  FResultNode:=nil;
end;

constructor THistoryTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor THistoryTreeView.Destroy;
var
  history:nsINavHistoryService;
begin
  Self.Clear;
  inherited;
end;

procedure THistoryTreeView.ItemInserted(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aNewIndex: PRUint32); safecall;
begin
  //ShowMessage('');
end;
procedure THistoryTreeView.ItemRemoved(aParent: nsINavHistoryContainerResultNode; aItem: nsINavHistoryResultNode; aOldIndex: PRUint32); safecall;
begin
  //
end;
procedure THistoryTreeView.ItemMoved(aItem: nsINavHistoryResultNode; aOldParent: nsINavHistoryContainerResultNode; aOldIndex: PRUint32; aNewParent: nsINavHistoryContainerResultNode; aNewIndex: PRUint32); safecall;
begin
  //
end;
procedure THistoryTreeView.ItemChanged(item: nsINavHistoryResultNode); safecall;
begin
  //
end;

procedure THistoryTreeView.ItemReplaced(parent: nsINavHistoryContainerResultNode; oldItem: nsINavHistoryResultNode; newItem: nsINavHistoryResultNode; index: PRUint32); safecall;
begin
  //
end;
procedure THistoryTreeView.ContainerOpened(item: nsINavHistoryContainerResultNode); safecall;
begin
  //
end;
procedure THistoryTreeView.ContainerClosed(item: nsINavHistoryContainerResultNode); safecall;
begin
  //
end;
procedure THistoryTreeView.InvalidateContainer(item: nsINavHistoryContainerResultNode); safecall;
begin
  //
end;
procedure THistoryTreeView.InvalidateAll(); safecall;
begin
  //ShowMessage('');
end;
procedure THistoryTreeView.SortingChanged(sortingMode: PRUint16); safecall;
begin
  //
end;
function THistoryTreeView.GetResult(): nsINavHistoryResult; safecall;
begin
  Result := FResult;
end;

procedure THistoryTreeView.SetResult(aResult: nsINavHistoryResult); safecall;
begin
  FResult := aResult;
end;

procedure THistoryTreeView.DoSearch(keyword: String);
  procedure MakeChild(parent:TTreeNode;container:nsINavHistoryContainerResultNode);
  var
    treenode: TTreeNode;
    child: nsINavHistoryResultNode;
    childAsContainer: nsINavHistoryContainerResultNode;
    i:Integer;
    cstr:IInterfacedCString;
  begin
    cstr := NewCString;
    container.ContainerOpen:=true;
    if container.ChildCount>0 then
    for i:=0 to container.ChildCount-1 do begin
      child := container.GetChild(i);
      child.GetTitle(cstr.ACString);
      treenode := Self.Items.AddChild(parent,UTF8Decode(cstr.ToString));
      treenode.Data := THistoryData.Create;
      THistoryData(treenode.Data).ResultNode := child;
      if Supports(child,nsINavHistoryContainerResultNode,childAsContainer) then
        MakeChild(treenode,childAsContainer);
    end;
  end;

var
  history:nsINavHistoryService;
  query: nsINavHistoryQuery;
  options: nsINavHistoryQueryOptions;
  result:nsINavHistoryResult;
  sortingMode,resultType:Word;
  root:nsINavHistoryContainerResultNode;
  child :nsINavHistoryResultNode;
  childAsContainer:nsINavHistoryContainerResultNode;
  groups:array[0..1] of PRUint16;
  p,p2:Pointer;
  i,j:Integer;
  treenode: TTreeNode;
  cstr:IInterfacedCString;
begin
  try
    NS_GetService('@mozilla.org/browser/nav-history-service;1',nsINavHistoryService,history);
  except
    On E:Exception do begin
      Exit;
    end
  end;

  Self.Clear;

  query := history.GetNewQuery;
  options := history.GetNewQueryOptions;

  if keyword<>'' then
  begin
    query.SetSearchTerms(NewString(keyword).AString);
    options.SortingMode := ns_INavHistoryQueryOptions_SORT_BY_TITLE_ASCENDING;
    options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_URI;
  end
  else begin
    case Self.SortingType of
      hstVisited: begin
        options.SortingMode := ns_INavHistoryQueryOptions_SORT_BY_VISITCOUNT_DESCENDING;
        options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_URI;
      end;
      hstLastVisited: begin
        options.SortingMode := ns_INavHistoryQueryOptions_SORT_BY_DATE_DESCENDING;
        options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_URI;
      end;
      hstDayAndSite: begin
        options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_DATE_SITE_QUERY
      end;
      hstSite: begin
        options.SortingMode := ns_INavHistoryQueryOptions_SORT_BY_TITLE_ASCENDING;
        options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_SITE_QUERY;
      end;
    else
      begin
        options.ResultType := ns_INavHistoryQueryOptions_RESULTS_AS_DATE_QUERY;
      end;
    end;
  end;

  result := history.ExecuteQuery(query,options);
  result.Viewer := Self;

  cstr := NewCString;
  root := result.Root;
  root.ContainerOpen:=true;


  if root.HasChildren then begin
    if root.ChildCount>0 then
      for i:=0 to root.ChildCount-1 do begin
        child := root.GetChild(i);
        child.GetTitle(cstr.ACString);
        treenode := Self.Items.Add(nil,UTF8Decode(cstr.ToString));
        treenode.Data := THistoryData.Create;
        THistoryData(treenode.Data).ResultNode := child;
        if Supports(child,nsINavHistoryContainerResultNode,childAsContainer) then
          MakeChild(treenode,childAsContainer);
      end;
  end;
end;

procedure THistoryTreeView.Clear;
var
  i:Integer;
begin
  for i:=0 to Self.Items.Count - 1 do begin
    if (Self.Items.Item[i].Data <> nil) then
      THistoryData(Self.Items.Item[i].Data).Free;
  end;
  Self.Items.Clear;
end;

procedure THistoryTreeView.SetSortingType(Value: THistorySortingType);
begin
  FSortingType := Value;
  DoSearch('');
end;

initialization
  GRE_Startup();
finalization
  GRE_Shutdown();

end.
