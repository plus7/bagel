unit NkDropTarget;

interface

uses
  Windows, Classes, Controls, ActiveX, ComObj;

type
  TNkCustomDropTarget = class;

  ////////////
  // TNkDropTargetObject
  //
  //  IDropTaget 用のインターフェーストオブジェクト
  //

  // キーの状態
  TNkKeyStates = (nkKsControl, nkKsShift,
                  nkKsLButton, nkKsMButton, nkKsRButton);
  TNkKeyState = set of TNkKeyStates;

  TNkDropTargetObject = class(TInterfacedObject, IDroptarget)
  private
    Parent: TNkCustomDroptarget;  // 親コンポーネントへの参照

    // キー状態を TNkKeyState に変換
    function ConvertKeyState(aKeyState: LongInt): TNkKeyState;
  public
    // インターフェースオブジェクトの作成
    constructor Create(aParent: TNkCustomDropTarget);
    // インターフェースオブジェクトの破棄
    destructor Destroy; override;

    // IDropTarget のメソッド
    function DragEnter (const dataObj: IDataObject;
                        grfKeyState: Longint;
                        pt: TPoint;
                        var dwEffect: Longint): HResult; stdcall;
    function DragOver  (grfKeyState: Longint;
                        pt: TPoint;
                        var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop      (const dataObj: IDataObject;
                        grfKeyState:
                        Longint; pt: TPoint;
                        var dwEffect: Longint): HResult; stdcall;
  end;

  ////////////
  // TNkCustomDropTarget
  //
  //  OLE Drop Client Component のカスタム版
  //

  //　イベントの型定義
  TNkOleDragEnter = procedure(var Res: HResult;
                              const dataObj: IDataObject;
                              KeyState: TNkKeyState;
                              pt: TPoint;
                              var dwEffect: LongInt) of Object;
  TNkOleDragOver  = procedure(var Res: HResult;
                              KeyState: TNkKeyState;
                              pt: TPoint;
                              var dwEffect: LongInt) of Object;

  TNkOleDragLeave = procedure(var Res: HResult) of Object;

  TNkOleDrop      = procedure(var Res: HResult;
                              const dataObj: IDataObject;
                              KeyState: TNkKeyState;
                              pt: TPoint;
                              var dwEffect: LongInt) of Object;


  TNkCustomDropTarget = class(TComponent)
  private
    FWindow: TWinControl;
    TargetInterface: IDropTarget;  // インターフェースオブジェクト(IDropTarget)
    FOnDragEnter: TNkOleDragEnter;  // IDropTarget で起こされるイベント
    FOnDragOver:  TNkOleDragOver;
    FOnDragLeave: TNkOleDragLeave;
    FOnDrop:      TNkOleDrop;

    procedure SetWindow(Value: TWinControl);
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
                          Operation: TOperation); override;
    // Drag & Drop 時のイベント
    property OnDragEnter: TNkOleDragEnter read FOnDragEnter write FOnDragEnter;
    property OnDragOver:  TNkOleDragOver  read FOnDragOver  write FOnDragOver;
    property OnDragLeave: TNkOleDragLeave read FOnDragLeave write FOnDragLeave;
    property OnDrop:      TNkOleDrop      read FOnDrop      write FOnDrop;
    property Window: TWinControl read FWindow write SetWindow;
  public
    // コンポーネントの作成
    constructor Create(AOwner: TComponent); override;
    // コンポーネントの破棄
    destructor  Destroy; override;
  end;

  // 汎用ドロップターゲットコンポーネント
  TNkDropTarget = class(TNkCustomDropTarget)
  published
    property OnDragEnter;
    property OnDragOver;
    property OnDragLeave;
    property OnDrop;
    property Window;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('NkCtrls', [TNkDropTarget]);
end;

{ TNkDropTargetObject }

function TNkDropTargetObject.ConvertKeyState(aKeyState: LongInt): TNkKeyState;
begin
  Result := [];
  if (aKeyState and MK_CONTROL) = MK_CONTROL then
    Include(Result , nkKsControl);
  if (aKeyState and MK_SHIFT) = MK_SHIFT then
    Include(Result , nkKsShift);
  if (aKeyState and MK_LBUTTON) = MK_LBUTTON then
    Include(Result , nkKsLButton);
  if (aKeyState and MK_MBUTTON) = MK_MBUTTON then
    Include(Result , nkKsMButton);
  if (aKeyState and MK_RBUTTON) = MK_RBUTTON then
    Include(Result , nkKsRButton);
  //if (aKeyState and MK_ALT) = MK_ALT then
  //  Include(Result , nkKsAlt);
end;


constructor TNkDropTargetObject.Create(aParent: TNkCustomDropTarget);
begin
  inherited Create;
  Parent := aParent;
end;

destructor TNkDropTargetObject.Destroy;
begin
  inherited;
end;

function TNkDropTargetObject.DragEnter(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
begin
  Result := S_OK;
  if Assigned(Parent.FOnDragEnter) then
    Parent.FOnDragEnter(Result, dataObj, ConvertKeyState(grfKeyState),
                        pt, dwEffect);
end;

function TNkDropTargetObject.DragLeave: HResult;
begin
  Result := S_OK;
  if Assigned(Parent.FOnDragLeave) then
    Parent.FOnDragLeave(Result);
end;

function TNkDropTargetObject.DragOver(grfKeyState: Integer; pt: TPoint;
  var dwEffect: Integer): HResult;
begin
  Result := S_OK;
  if Assigned(Parent.FOnDragOver) then
    Parent.FOnDragOver(Result, ConvertKeyState(grfKeyState), pt, dwEffect);
end;

function TNkDropTargetObject.Drop(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
begin
  Result := S_OK;
  if Assigned(Parent.FOnDrop) then
    Parent.FOnDrop(Result, dataObj, ConvertkeyState(grfKeyState), pt, dwEffect);
end;

{ TNkCustomDropTarget }

constructor TNkCustomDropTarget.Create(aOwner: TComponent);
begin
  inherited;
  TargetInterface := TNkDropTargetObject.Create(Self);
end;

destructor TNkCustomDropTarget.Destroy;
begin
  if FWindow <> Nil then OleCheck(RevokeDragDrop(FWindow.Handle));
  TargetInterface := Nil;
  inherited;
end;


procedure TNkCustomDropTarget.Loaded;
begin
  if not (csDesigning in ComponentState) and
    (FWindow <> Nil) then
    OleCheck(RegisterDragDrop(FWindow.Handle, TargetInterface));
end;

procedure TNkCustomDropTarget.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent = FWindow) then
    FWindow := Nil;
end;

procedure TNkCustomDropTarget.SetWindow(Value: TWinControl);
begin
  if not (csLoading in ComponentState) and
    not (csDesigning in ComponentState) and
    (FWindow <> Nil) then
    OleCheck(RevokeDragDrop(FWindow.Handle));
  FWindow := Value;
  if not (csLoading in ComponentState) and
    not (csDesigning in ComponentState) and
    (FWindow <> Nil) then
    OleCheck(RegisterDragDrop(FWindow.Handle, TargetInterface));

  if FWindow <> Nil then
    FWindow.FreeNotification(Self);
end;


initialization OleInitialize(Nil);
Finalization  OleUnInitialize;
end.


