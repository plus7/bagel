unit nsTree;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsAtom,nsSupportsArray;

const
  NS_ITREEBOXOBJECT_IID: TGUID = '{a264f607-9d90-469e-b770-1ae7284fde05}';

  NS_ITREEVIEW_IID: TGUID = '{637276b5-58c0-4eff-89ea-c7f3c5bf0b54}';
  NS_ITREEVIEW_DROP_BEFORE = -1;
  NS_ITREEVIEW_DROP_ON = 0;
  NS_ITREEVIEW_DROP_AFTER = 1;
  NS_ITREEVIEW_PROGRESS_NORMAL = 1;
  NS_ITREEVIEW_PROGRESS_UNDETERMINED = 2;
  NS_ITREEVIEW_PROGRESS_NONE = 3;

  NS_INATIVETREEVIEW_IID: TGUID = '{38e0b44d-fa08-458c-83fb-3e10b12aeb45}';

  NS_ITREECOLUMN_IID: TGUID = '{ae835ecf-6b32-4660-9b43-8a270df56e02}';
  NS_ITREECOLUMN_TYPE_TEXT = 1;
  NS_ITREECOLUMN_TYPE_CHECKBOX = 2;
  NS_ITREECOLUMN_TYPE_PROGRESSMETER = 3;

  NS_ITREECOLUMNS_IID: TGUID = '{f8a8d6b4-6788-438d-9009-7142798767ab}';

  NS_ITREESELECTION_IID: TGUID = '{ab6fe746-300b-4ab4-abb9-1c0e3977874c}';

type
  nsITreeBoxObject = interface;
  nsITreeView = interface;
  nsINativeTreeView = interface;
  nsITreeColumn = interface;
  nsITreeColumns = interface;
  nsITreeSelection = interface;
  nsITreeBoxObject = interface(nsISupports)
  ['{a264f607-9d90-469e-b770-1ae7284fde05}']
    function GetColumns(): nsITreeColumns; safecall;
    property Columns: nsITreeColumns read GetColumns;
    function GetView(): nsITreeView; safecall;
    procedure SetView(aView: nsITreeView); safecall;
    property View: nsITreeView read GetView write SetView;
    function GetFocused(): PRBool; safecall;
    procedure SetFocused(aFocused: PRBool); safecall;
    property Focused: PRBool read GetFocused write SetFocused;
    function GetTreeBody(): nsIDOMElement; safecall;
    property TreeBody: nsIDOMElement read GetTreeBody;
    function GetRowHeight(): PRInt32; safecall;
    property RowHeight: PRInt32 read GetRowHeight;
    function GetRowWidth(): PRInt32; safecall;
    property RowWidth: PRInt32 read GetRowWidth;
    function GetHorizontalPosition(): PRInt32; safecall;
    property HorizontalPosition: PRInt32 read GetHorizontalPosition;
    function GetFirstVisibleRow(): PRInt32; safecall;
    function GetLastVisibleRow(): PRInt32; safecall;
    function GetPageLength(): PRInt32; safecall;
    procedure EnsureRowIsVisible(index: PRInt32); safecall;
    procedure EnsureCellIsVisible(row: PRInt32; col: nsITreeColumn); safecall;
    procedure ScrollToRow(index: PRInt32); safecall;
    procedure ScrollByLines(numLines: PRInt32); safecall;
    procedure ScrollByPages(numPages: PRInt32); safecall;
    procedure ScrollToCell(row: PRInt32; col: nsITreeColumn); safecall;
    procedure ScrollToColumn(col: nsITreeColumn); safecall;
    procedure ScrollToHorizontalPosition(horizontalPosition: PRInt32); safecall;
    procedure Invalidate(); safecall;
    procedure InvalidateColumn(col: nsITreeColumn); safecall;
    procedure InvalidateRow(index: PRInt32); safecall;
    procedure InvalidateCell(row: PRInt32; col: nsITreeColumn); safecall;
    procedure InvalidateRange(startIndex: PRInt32; endIndex: PRInt32); safecall;
    procedure InvalidateColumnRange(startIndex: PRInt32; endIndex: PRInt32; col: nsITreeColumn); safecall;
    function GetRowAt(x: PRInt32; y: PRInt32): PRInt32; safecall;
    procedure GetCellAt(x: PRInt32; y: PRInt32; out row: PRInt32; out col: nsITreeColumn; childElt: nsACString); safecall;
    procedure GetCoordsForCellItem(row: PRInt32; col: nsITreeColumn; const element: nsACString; out x: PRInt32; out y: PRInt32; out width: PRInt32; out height: PRInt32); safecall;
    function IsCellCropped(row: PRInt32; col: nsITreeColumn): PRBool; safecall;
    procedure RowCountChanged(index: PRInt32; count: PRInt32); safecall;
    procedure BeginUpdateBatch(); safecall;
    procedure EndUpdateBatch(); safecall;
    procedure ClearStyleAndImageCaches(); safecall;
  end;

  nsITreeView = interface(nsISupports)
  ['{637276b5-58c0-4eff-89ea-c7f3c5bf0b54}']
    function GetRowCount(): PRInt32; safecall;
    property RowCount: PRInt32 read GetRowCount;
    function GetSelection(): nsITreeSelection; safecall;
    procedure SetSelection(aSelection: nsITreeSelection); safecall;
    property Selection: nsITreeSelection read GetSelection write SetSelection;
    procedure GetRowProperties(index: PRInt32; properties: nsISupportsArray); safecall;
    procedure GetCellProperties(row: PRInt32; col: nsITreeColumn; properties: nsISupportsArray); safecall;
    procedure GetColumnProperties(col: nsITreeColumn; properties: nsISupportsArray); safecall;
    function IsContainer(index: PRInt32): PRBool; safecall;
    function IsContainerOpen(index: PRInt32): PRBool; safecall;
    function IsContainerEmpty(index: PRInt32): PRBool; safecall;
    function IsSeparator(index: PRInt32): PRBool; safecall;
    function IsSorted(): PRBool; safecall;
    function CanDrop(index: PRInt32; orientation: PRInt32): PRBool; safecall;
    procedure Drop(row: PRInt32; orientation: PRInt32); safecall;
    function GetParentIndex(rowIndex: PRInt32): PRInt32; safecall;
    function HasNextSibling(rowIndex: PRInt32; afterIndex: PRInt32): PRBool; safecall;
    function GetLevel(index: PRInt32): PRInt32; safecall;
    procedure GetImageSrc(row: PRInt32; col: nsITreeColumn; _retval: nsAString); safecall;
    function GetProgressMode(row: PRInt32; col: nsITreeColumn): PRInt32; safecall;
    procedure GetCellValue(row: PRInt32; col: nsITreeColumn; _retval: nsAString); safecall;
    procedure GetCellText(row: PRInt32; col: nsITreeColumn; _retval: nsAString); safecall;
    procedure SetTree(tree: nsITreeBoxObject); safecall;
    procedure ToggleOpenState(index: PRInt32); safecall;
    procedure CycleHeader(col: nsITreeColumn); safecall;
    procedure SelectionChanged(); safecall;
    procedure CycleCell(row: PRInt32; col: nsITreeColumn); safecall;
    function IsEditable(row: PRInt32; col: nsITreeColumn): PRBool; safecall;
    function IsSelectable(row: PRInt32; col: nsITreeColumn): PRBool; safecall;
    procedure SetCellValue(row: PRInt32; col: nsITreeColumn; const value: nsAString); safecall;
    procedure SetCellText(row: PRInt32; col: nsITreeColumn; const value: nsAString); safecall;
    procedure PerformAction(const action: PWideChar); safecall;
    procedure PerformActionOnRow(const action: PWideChar; row: PRInt32); safecall;
    procedure PerformActionOnCell(const action: PWideChar; row: PRInt32; col: nsITreeColumn); safecall;
  end;

  nsINativeTreeView = interface(nsITreeView)
  ['{38e0b44d-fa08-458c-83fb-3e10b12aeb45}']
    procedure EnsureNative(); safecall;
  end;

  nsITreeColumn = interface(nsISupports)
  ['{ae835ecf-6b32-4660-9b43-8a270df56e02}']
    function GetElement(): nsIDOMElement; safecall;
    property Element: nsIDOMElement read GetElement;
    function GetColumns(): nsITreeColumns; safecall;
    property Columns: nsITreeColumns read GetColumns;
    function GetX(): PRInt32; safecall;
    property X: PRInt32 read GetX;
    function GetWidth(): PRInt32; safecall;
    property Width: PRInt32 read GetWidth;
    procedure GetId(aId: nsAString); safecall;
    procedure GetIdConst(out idConst: PWideChar); safecall;
    function GetAtom(): nsIAtom; safecall;
    property Atom: nsIAtom read GetAtom;
    function GetIndex(): PRInt32; safecall;
    property Index: PRInt32 read GetIndex;
    function GetPrimary(): PRBool; safecall;
    property Primary: PRBool read GetPrimary;
    function GetCycler(): PRBool; safecall;
    property Cycler: PRBool read GetCycler;
    function GetEditable(): PRBool; safecall;
    property Editable: PRBool read GetEditable;
    function GetSelectable(): PRBool; safecall;
    property Selectable: PRBool read GetSelectable;
    function GetType(): PRInt16; safecall;
    property _Type: PRInt16 read GetType;
    function GetNext(): nsITreeColumn; safecall;
    function GetPrevious(): nsITreeColumn; safecall;
    procedure Invalidate(); safecall;
  end;

  nsITreeColumns = interface(nsISupports)
  ['{f8a8d6b4-6788-438d-9009-7142798767ab}']
    function GetTree(): nsITreeBoxObject; safecall;
    property Tree: nsITreeBoxObject read GetTree;
    function GetCount(): PRInt32; safecall;
    property Count: PRInt32 read GetCount;
    function GetLength(): PRInt32; safecall;
    property Length: PRInt32 read GetLength;
    function GetFirstColumn(): nsITreeColumn; safecall;
    function GetLastColumn(): nsITreeColumn; safecall;
    function GetPrimaryColumn(): nsITreeColumn; safecall;
    function GetSortedColumn(): nsITreeColumn; safecall;
    function GetKeyColumn(): nsITreeColumn; safecall;
    function GetColumnFor(element: nsIDOMElement): nsITreeColumn; safecall;
    function GetNamedColumn(const id: nsAString): nsITreeColumn; safecall;
    function GetColumnAt(index: PRInt32): nsITreeColumn; safecall;
    procedure InvalidateColumns(); safecall;
    procedure RestoreNaturalOrder(); safecall;
  end;

  nsITreeSelection = interface(nsISupports)
  ['{ab6fe746-300b-4ab4-abb9-1c0e3977874c}']
    function GetTree(): nsITreeBoxObject; safecall;
    procedure SetTree(aTree: nsITreeBoxObject); safecall;
    property Tree: nsITreeBoxObject read GetTree write SetTree;
    function GetSingle(): PRBool; safecall;
    property Single: PRBool read GetSingle;
    function GetCount(): PRInt32; safecall;
    property Count: PRInt32 read GetCount;
    function IsSelected(index: PRInt32): PRBool; safecall;
    procedure Select(index: PRInt32); safecall;
    procedure TimedSelect(index: PRInt32; delay: PRInt32); safecall;
    procedure ToggleSelect(index: PRInt32); safecall;
    procedure RangedSelect(startIndex: PRInt32; endIndex: PRInt32; augment: PRBool); safecall;
    procedure ClearRange(startIndex: PRInt32; endIndex: PRInt32); safecall;
    procedure ClearSelection(); safecall;
    procedure InvertSelection(); safecall;
    procedure SelectAll(); safecall;
    function GetRangeCount(): PRInt32; safecall;
    procedure GetRangeAt(i: PRInt32; out min: PRInt32; out max: PRInt32); safecall;
    procedure InvalidateSelection(); safecall;
    procedure AdjustSelection(index: PRInt32; count: PRInt32); safecall;
    function GetSelectEventsSuppressed(): PRBool; safecall;
    procedure SetSelectEventsSuppressed(aSelectEventsSuppressed: PRBool); safecall;
    property SelectEventsSuppressed: PRBool read GetSelectEventsSuppressed write SetSelectEventsSuppressed;
    function GetCurrentIndex(): PRInt32; safecall;
    procedure SetCurrentIndex(aCurrentIndex: PRInt32); safecall;
    property CurrentIndex: PRInt32 read GetCurrentIndex write SetCurrentIndex;
    function GetCurrentColumn(): nsITreeColumn; safecall;
    procedure SetCurrentColumn(aCurrentColumn: nsITreeColumn); safecall;
    property CurrentColumn: nsITreeColumn read GetCurrentColumn write SetCurrentColumn;
    function GetShiftSelectPivot(): PRInt32; safecall;
    property ShiftSelectPivot: PRInt32 read GetShiftSelectPivot;
  end;

implementation

end.
