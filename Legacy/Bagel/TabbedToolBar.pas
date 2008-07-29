unit TabbedToolBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ToolWin,
  ComCtrls, Graphics, Themes;

type
  TTabbedToolBar = class;

  TBagelTabStyle = (
    btsTabs,
    btsSkinnedTabs,
    btsFlatButtons
  );

  TBagelTabStrings = class(TStringList)
  private
    FTabControl: TTabbedToolBar;
  protected

    procedure Put(Index: Integer; const S: string); override;
    procedure UpdateTabs(ACount: Integer);
  public
    function Add(const S: string): Integer; override;
    function AddObject(const S: string; AObject: TObject): Integer; override;
    procedure InsertObject(Index: Integer; const S: string; AObject: TObject); override;
    procedure Move(CurIndex, NewIndex: Integer); override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

  TTabbedToolBar = class(TToolbar)
  private
    { Private 宣言 }
    FhTheme: THandle;

    FHotIndex:Integer;

    FTabIndex: Integer;
    FTabWidth: Integer;
    FTabHeight: Integer;
    FMultiLine: Boolean;
    FTabStyle: TBagelTabStyle;

    FLastClickedPos:Integer;

    FOffsetX:Integer;
    FOffsetY:Integer;
//    FInnerWidth:Integer;
    FShowSeparator:Boolean;

//    FEachCloseButton:Boolean;
//    FCloseButton:Boolean;
//    FNewTabButton:Boolean;

    FTabs: TStrings;

    FOnChange: TNotifyEvent;
    FOnHeightChange: TNotifyEvent;
    FOnHeightChanging: TNotifyEvent;
    //FOnChanging: TTabChangingEvent;
    FOnDrawTab: TDrawTabEvent;

    procedure HeightChange;
    procedure CheckHeight;
    procedure SetTabs(Value: TStrings);
    procedure SetTabIndex(Value: Integer);
    function GetTabIndex:Integer;
    procedure SetTabWidth(Value: Integer);
    procedure SetTabHeight(Value: Integer);
    procedure SetMultiLine(Value: Boolean);
    procedure SetShowSeparator(Value: Boolean);

    function GetRowCount:Integer;

    




  protected
    { Protected 宣言 }
    procedure WndProc(var Message: TMessage); override;
    procedure CreateWnd; override;
	 	procedure DestroyWnd; override;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; override;
    function CustomDraw(const ARect: TRect; Stage: TCustomDrawStage):Boolean; override;
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  public
    { Public 宣言 }


    function TabRect(Index:Integer):TRect;

    function IndexOfTabAt(X: Integer; Y: Integer):Integer;
  published
    { Published 宣言 }
    property LastClickedPos:Integer read FLastClickedPos write FLastClickedPos;
    property MultiLine:Boolean read FMultiLine write SetMultiLine default true;

//    property OnContextMenu;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnHeightChanging: TNotifyEvent read FOnHeightChanging write FOnHeightChanging;
    property OnHeightChange: TNotifyEvent read FOnHeightChange write FOnHeightChange;
    //property OnChanging: TTabChangingEvent read FOnChanging write FOnChanging;
    property OnDrawTab: TDrawTabEvent read FOnDrawTab write FOnDrawTab;{}
    property OnContextPopup;
    property RowCount:Integer read GetRowCount default 1;
    property ShowSeparator: Boolean read FShowSeparator write SetShowSeparator default true;
    property TabHeight:Integer read FTabHeight write SetTabHeight default 20;
    property Tabs: TStrings read FTabs write SetTabs;
    property TabStyle: TBagelTabStyle read FTabStyle write FTabStyle;
    property TabIndex: Integer read GetTabIndex write SetTabIndex;
    property TabWidth:Integer read FTabWidth write SetTabWidth;




    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


    //property Canvas: TCanvas read FCanvas;
    //property TabStop default True;
  end;

implementation

uses Types;

function Min(A, B: Integer): Integer;
begin
  if A < B then Result := A else Result := B;
end;

function Max(A, B: Integer): Integer;
begin
  if A > B then Result := A else Result := B;
end;

function TTabbedToolBar.IndexOfTabAt(X: Integer; Y: Integer):Integer;
var
  left,right:Integer;
  i:Integer;
//  ARect:TRect;
//  sep:Integer;
  row:Integer;
  cntx,cnty:Integer;
  tmpwidth:Integer;
  sepOffset:Integer;
  baseOffset:Integer;
begin

  Result:=-1;

  if FTabStyle = btsFlatButtons then begin
    sepOffset:=4;
    baseOffset:=0;
  end
  else begin
    sepOffset:=0;
    baseOffset:=2;
  end;

  if FMultiLine then begin
    row:=y div FTabHeight;
    cnty:=0;
    cntx:=0;
    right:=baseOffset;

    for i:=0 to FTabs.Count-1 do begin

      left:=right;
      if FTabWidth>0 then tmpWidth := FTabWidth
      else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;

      if left + tmpWidth +sepOffset > Self.Width then begin
        if cntx=0 then begin
          cntx:=1;
        end
        else begin
          Inc(cnty);
          cntx:=1;
          left:=baseOffset;
        end;
      end
      else begin
        Inc(cntx);
      end;

      right:=left + tmpWidth + sepOffset;

      if (cnty = row) and (X>=left) and (X<=right) then begin
        Result:=i;
        Exit;
      end;

    end;

  end
  else begin
    right:=-FOffsetX+baseOffset;
    for i:=0 to FTabs.Count-1 do begin

      left:=right;

      if FTabWidth>0 then tmpWidth := FTabWidth
      else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;

      right := right + tmpWidth + sepOffset;

      if (X>=left) and (X<=right) then begin
        Result:=i;
        Exit;
      end;

    end;
  end;



end;

function TTabbedToolBar.IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean;
begin
  //Result:=False;
  if inherited IsCustomDrawn(Target,Stage) then
    Result:=True
  else
    Result:=True;
end;

function TTabbedToolBar.CustomDraw(const ARect: TRect; Stage: TCustomDrawStage):Boolean;
{
  if Assigned(FOnDrawTab) then
    FOnDrawTab(Self, TabIndex, Rect, Active) else
    FCanvas.FillRect(Rect);
}
  procedure DrawTabStyleTab(r:TRect);
  var
  r2:TRect;
  begin
    with Canvas do begin
      //左側を描画
      Pen.Color := clBtnHighlight;
      MoveTo(r.Left, r.Top+2);
      LineTo(r.Left, r.Bottom);

      MoveTo(r.Left+1, r.Top+1);
      LineTo(r.Left, r.Top+2);


      Pen.Color := cl3DLight;
      MoveTo(r.Left+1, r.Top+2);
      LineTo(r.Left+1, r.Bottom);

      //右側の描画
      Pen.Color := cl3DDkShadow;
      MoveTo(r.Right-1, r.Top+2);
      LineTo(r.Right-1, r.Bottom);

      MoveTo(r.Right-2, r.Top+1);
      LineTo(r.Right-1, r.Top+2);

      Pen.Color := clBtnShadow;
      MoveTo(r.Right-2, r.Top+2);
      LineTo(r.Right-2, r.Bottom);

      //上側の描画
      Pen.Color := clBtnHighlight;
      MoveTo(r.Left+2, r.Top);
      LineTo(r.Right-2, r.Top);

      Pen.Color := cl3DLight;
      MoveTo(r.Left+2, r.Top+1);
      LineTo(r.Right-2, r.Top+1);

      Brush.Style:=bsSolid;
      Brush.Color:=clBtnFace;

      r2.Left:=r.Left+2;
      r2.Right:=r.Right-2;
      r2.Top:=r.Top+2;
      r2.Bottom:=r.Bottom;

      FillRect(r2);
    end;
  end;
  procedure DrawSkinnedTab(ARect:TRect;State:TCustomDrawState);
  var
    tt:TThemedTab;
    Details: TThemedElementDetails;
  begin
    if cdsSelected in State then begin
      tt := ttTabItemSelected;
      Details := ThemeServices.GetElementDetails(tt);
      ThemeServices.DrawElement(Canvas.Handle, Details, ARect);
      //Result := ThemeServices.ContentRect(Canvas.Handle, Details, ARect);
    end
    else if cdsHot in State then begin
      tt := ttTabItemHot;
      Details := ThemeServices.GetElementDetails(tt);
      ThemeServices.DrawElement(Canvas.Handle, Details, ARect);
    end
    else begin
      tt := ttTabItemNormal;
      Details := ThemeServices.GetElementDetails(tt);
      ThemeServices.DrawElement(Canvas.Handle, Details, ARect);
    end;
  end;
  
  procedure DrawTab(ARect: TRect; Hot: Boolean);
  var
    left,right:Integer;
    i:Integer;
    r,r2,r3,ActiveRect:TRect;
    ActiveStr:String;
    cntx,cnty:Integer;
    sepOffset,baseOffset,tmpWidth:Integer;
  begin
    if FTabStyle = btsFlatButtons then begin
      sepOffset:=4;
      baseOffset:=0;
    end
    else begin
      sepOffset:=0;
      baseOffset:=2;
    end;

    ActiveRect.Left:=0;
    ActiveRect.Right:=0;

    with Canvas do begin
      if FMultiLine then begin
        cnty:=0;
        cntx:=0;
        right:=baseOffset;
        left:=0;
        for i:=0 to FTabs.Count-1 do begin

          left:=right;

          if FTabWidth>0 then tmpWidth := FTabWidth
          else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;


          if left + tmpWidth + sepOffset > Self.Width then begin
            if cntx=0 then begin
              cntx:=1;
            end
            else begin
              Inc(cnty);
              cntx:=1;
              left:=baseOffset;
            end;
          end
          else begin
            Inc(cntx);
          end;
          right := left + tmpWidth;//+4;

          r.Left := ARect.Left + left;
          r.Right := ARect.Left + right;
          r.Top := cnty * Self.FTabHeight;
          r.Bottom := r.Top + Self.FTabHeight;


          if FTabStyle = btsTabs then begin
            if i=TabIndex then begin

              ActiveRect.Left:=r.Left-2;
              ActiveRect.Top:=r.Top;
              ActiveRect.Right:=r.Right+2;
              ActiveRect.Bottom:=r.Bottom;
              ActiveStr := FTabs.Strings[i];
            end
            else begin

              //タブの輪郭の描画
              r3.Left := r.Left;
              r3.Right := r.Right;
              r3.Top:=r.top+2;
              r3.Bottom:=r.Bottom;



              if ThemeServices.ThemesEnabled then begin
                if FHotIndex=i then DrawSkinnedTab(r3,[cdsHot])
                else DrawSkinnedTab(r3,[])
              end
              else DrawTabStyleTab(r3);

              r2.Left := r.Left+2;
              r2.Right := r.Right-2;
              r2.Top:=r.top+4;
              r2.Bottom:=r.Bottom;
              if Assigned(FOnDrawTab) then begin
                FOnDrawTab(TCustomTabControl(Self),i,r2,True);
              end
              else begin
                Canvas.Brush.Style := bsClear;
                Canvas.TextRect(r2,r2.Left+5,r2.Top+2,FTabs.Strings[i]);
              end;

            end;
            
          end
          else if FTabStyle = btsFlatButtons then begin

            Brush.Style:=bsClear;

            r2.Left := r.Left+2;
            r2.Right := r.Right-2;
            r2.Top:=r.top+2;
            r2.Bottom:=r.Bottom-2;
            if Assigned(FOnDrawTab) then begin
              if i=TabIndex then begin
                FOnDrawTab(TCustomTabControl(Self),i,r2,True);
              end
              else FOnDrawTab(TCustomTabControl(Self),i,r,False);
            end
            else begin
              Canvas.Brush.Style := bsClear;
              Canvas.TextRect(r2,r2.Left+5,r2.Top+2,FTabs.Strings[i]);
            end;

            if i=FTabIndex then begin
              DrawEdge(Handle,r,BDR_SUNKENOUTER Or BDR_SUNKENINNER,BF_RECT);
            end;
          end;

          if FTabStyle = btsFlatButtons then begin
            Pen.Color := clBtnShadow;
            MoveTo(right+1, r.Top+2);
            LineTo(right+1, r.Bottom-2);

            Pen.Color := clBtnHighlight;

            MoveTo(right+2, r.Top+2);
            LineTo(right+2, r.Bottom-2);

            right:=right+4;
          end;

        end;

        if FTabStyle=btsTabs then begin
          //アクティブタブの描画

          if ActiveRect.Left-ActiveRect.Right<>0 then begin
            if ThemeServices.ThemesEnabled then DrawSkinnedTab(ActiveRect,[cdsSelected])
            else DrawTabStyleTab(ActiveRect);

            r2.Left := ActiveRect.Left+2;
            r2.Right := ActiveRect.Right-2;
            r2.Top := ActiveRect.top+2;
            r2.Bottom:= ActiveRect.Bottom;
            if Assigned(FOnDrawTab) then begin
              FOnDrawTab(TCustomTabControl(Self),FTabIndex,r2,True);
            end
            else begin
              Canvas.Brush.Style := bsClear;
              Canvas.TextRect(r2,r2.Left+5,r2.Top+2,ActiveStr);
            end;
          end;

        end;

      end
      else begin
        left:=-FOffsetX+baseOffset;
        for i:=0 to FTabs.Count-1 do begin
        
          if FTabWidth>0 then tmpWidth := FTabWidth
          else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;


          r.Left := ARect.Left+Left;
          r.Right := r.Left + tmpWidth;
          r.Top := ARect.Top; //cnty * Self.FTabHeight;
          r.Bottom := ARect.Top + Self.FTabHeight; //(cnty+1) * Self.FTabHeight;


          if FTabStyle = btsTabs then begin
            if i=TabIndex then begin

              ActiveRect.Left:=r.Left-2;
              ActiveRect.Top:=r.Top;
              ActiveRect.Right:=r.Right+2;
              ActiveRect.Bottom:=r.Bottom;
              ActiveStr := FTabs.Strings[i];
            end
            else begin

              //タブの輪郭の描画
              r3.Left  := r.Left;
              r3.Right := r.Right;
              r3.Top   := r.top + 2;
              r3.Bottom:= r.Bottom;



              if ThemeServices.ThemesEnabled then begin
                if FHotIndex=i then DrawSkinnedTab(r3,[cdsHot])
                else DrawSkinnedTab(r3,[])
              end
              else DrawTabStyleTab(r3);

              r2.Left  := r.Left+2;
              r2.Right := r.Right-2;
              r2.Top   := r.top+4;
              r2.Bottom:= r.Bottom;
              if Assigned(FOnDrawTab) then begin
                FOnDrawTab(TCustomTabControl(Self),i,r2,True);
              end
              else begin
                Canvas.Brush.Style := bsClear;
                Canvas.TextRect(r2,r2.Left+5,r2.Top+2,FTabs.Strings[i]);
              end;

            end;
          end
          else if FTabStyle = btsFlatButtons then begin
            Brush.Style:=bsClear;

            r2.Left := r.Left+2;
            r2.Right := r.Right-2;
            r2.Top:=r.top+2;
            r2.Bottom:=r.Bottom-2;
            if Assigned(FOnDrawTab) then begin
              if i=TabIndex then begin
                FOnDrawTab(TCustomTabControl(Self),i,r2,True);
              end
              else FOnDrawTab(TCustomTabControl(Self),i,r,False);
            end
            else begin
              Canvas.Brush.Style := bsClear;
              Canvas.TextRect(r2,r2.Left+5,r2.Top+2,FTabs.Strings[i]);
            end;

            if i=FTabIndex then begin
              DrawEdge(Handle,r,BDR_SUNKENOUTER Or BDR_SUNKENINNER,BF_RECT);
            end;
          end;

          left:=Left + tmpWidth;

          if FTabStyle = btsFlatButtons then begin
            Pen.Color := clBtnShadow;
            MoveTo(left+1, ARect.Top+2);
            LineTo(left+1, ARect.Bottom-2);

            Pen.Color := clBtnHighlight;

            MoveTo(left+2, ARect.Top+2);
            LineTo(left+2, ARect.Bottom-2);


            left:=left+4;
          end;

        end;

        if FTabStyle=btsTabs then begin
          //アクティブタブの描画

          if ActiveRect.Left-ActiveRect.Right<>0 then begin
            if ThemeServices.ThemesEnabled then DrawSkinnedTab(ActiveRect,[cdsSelected])
            else DrawTabStyleTab(ActiveRect);

            r2.Left := ActiveRect.Left+2;
            r2.Right := ActiveRect.Right-2;
            r2.Top := ActiveRect.top+2;
            r2.Bottom:= ActiveRect.Bottom;
            if Assigned(FOnDrawTab) then begin
              FOnDrawTab(TCustomTabControl(Self),FTabIndex,r2,True);
            end
            else begin
              Canvas.Brush.Style := bsClear;
              Canvas.TextRect(r2,r2.Left+5,r2.Top+2,ActiveStr);
            end;
          end;

        end;

      end;
    end;
  end;
//var
//  i:Integer;
//  r:TRect;
begin
  Result := inherited CustomDraw(ARect,Stage);
  if not result then exit;
  if not (csDesigning in ComponentState) then
  DrawTab(ARect,false);
end;

procedure TTabbedToolBar.HeightChange;
begin
  if Assigned(FOnHeightChange) then FOnHeightChange(Self);
end;

procedure TTabbedToolBar.CheckHeight;
var
c:Integer;
oldHeight:Integer;
begin
  oldHeight:=Self.Height;

  if FMultiline = false then begin
    Self.Height := FTabHeight;
  end
  else begin
    c:=GetRowCount;
    if (oldHeight<>0) and (oldheight<>FTabHeight * c) then begin
      if Assigned(FOnHeightChanging) then FOnHeightChanging(Self);
    end;
    Self.Height := FTabHeight * c;
//    Self.OnResize(Self);
    //Self.Resize;
  end;
  if (oldHeight<>0) and (oldheight<>Self.Height) then begin
    HeightChange;
  end;
end;

procedure TTabbedToolBar.SetTabs(Value: TStrings);
begin
  FTabs.Assign(Value);
end;

procedure TTabbedToolBar.SetTabIndex(Value: Integer);
var
  ActiveTabRect:TRect;
  baseOffset:Integer;
begin
  FTabIndex:=Value;

  if FTabStyle = btsFlatButtons then begin
    baseOffset:=0;
  end
  else begin
    baseOffset:=2;
  end;

  if not FMultiLine then begin
    ActiveTabRect := Self.TabRect(FTabIndex);
    if ActiveTabRect.Right>=Self.Width then begin
      FOffsetX := FOffsetX + ActiveTabRect.Right - Self.Width + baseOffset;
    end
    else if ActiveTabRect.Left<=0 then begin
      FOffsetX := FOffsetX - (0-ActiveTabRect.Left) - baseOffset;
    end;
  end;


  //
  Self.Invalidate;
end;

function TTabbedToolBar.GetTabIndex:Integer;
begin
  if Self.FTabs.Count <= 0 then Result := -1
  else Result := FTabIndex;
end;

procedure TTabbedToolBar.SetTabWidth(Value: Integer);
begin
  FTabWidth:=Value;
  CheckHeight;
  Self.Invalidate;
end;

procedure TTabbedToolBar.SetTabHeight(Value: Integer);
begin
  FTabHeight:=Value;
  CheckHeight;
  Self.Invalidate;
end;

procedure TTabbedToolBar.SetMultiLine(Value: Boolean);
begin
  FMultiLine:=Value;
  if FMultiLine then begin FOffsetX:=0; FOffsetY:=0; end;
  CheckHeight;
  Self.Invalidate;
end;

procedure TTabbedToolBar.SetShowSeparator(Value: Boolean);
begin
  FShowSeparator:=Value;
  CheckHeight;
  Self.Invalidate;
end;

function TTabbedToolBar.GetRowCount:Integer;
var
i,right,left,cnty,cntx:Integer;
sepOffset,baseOffset,tmpWidth:Integer;
begin
  if (not FMultiline) or (FTabs=nil) then begin
    Result:=1;
  end
  else begin

    if FTabStyle = btsFlatButtons then begin
      sepOffset:=4;
      baseOffset:=0;
    end
    else begin
      sepOffset:=0;
      baseOffset:=2;
    end;
    right:=baseOffset;
    cnty:=0;
    cntx:=0;

    for i:=0 to FTabs.Count-1 do begin

      left:=right;

      if FTabWidth>0 then tmpWidth := FTabWidth
      else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;


      if left + tmpWidth + sepOffset > Self.Width then begin
        if cntx=0 then begin
          cntx:=1;
        end
        else begin
          Inc(cnty);
          cntx:=1;
          left:=baseOffset;
        end;
      end
      else begin
        Inc(cntx);
      end;

      right:=left + tmpWidth + sepOffset;

    end;

    Result:=cnty+1;

  end;
end;

procedure TTabbedToolBar.Resize;
begin
  CheckHeight;
  inherited Resize;

end;

procedure TTabbedToolBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  ActiveTabRect:TRect;
//  baseOffset:Integer;
begin
  inherited MouseDown(Button, Shift, X, Y);
  FLastClickedPos:=Self.IndexOfTabAt(X,Y);

  {if FTabStyle = btsFlatButtons then begin
    baseOffset:=0;
  end
  else begin
    baseOffset:=2;
  end;  }

  if (Button=mbLeft) and (FLastClickedPos>=0) then begin

    {if not FMultiLine then begin
      ActiveTabRect := Self.TabRect(FLastClickedPos);
      if ActiveTabRect.Right>=Self.Width then begin
        FOffsetX := FOffsetX + ActiveTabRect.Right - Self.Width + baseOffset;
      end
      else if ActiveTabRect.Left<=0 then begin
        FOffsetX := FOffsetX - (0-ActiveTabRect.Left) - baseOffset;
      end;
    end;}
    Self.TabIndex:=FLastClickedPos;
    if Assigned(FOnChange) then FOnChange(Self);
  end;

end;

procedure TTabbedToolBar.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  FHotIndex := Self.IndexOfTabAt(X,Y);
  Invalidate;
end;

function TTabbedToolBar.TabRect(Index:Integer):TRect;
var
  left,right:Integer;
  i:Integer;
//  ARect:TRect;
//  sep:Integer;
//  row:Integer;
  cntx,cnty:Integer;
  tmpwidth:Integer;
  sepOffset:Integer;
  baseOffset:Integer;
begin

  //Result:=-1;
  Result.Top:=0;
  Result.Left:=0;
  Result.Bottom:=0;
  Result.Right:=0;

  if FTabStyle = btsFlatButtons then begin
    sepOffset:=4;
    baseOffset:=0;
  end
  else begin
    sepOffset:=0;
    baseOffset:=2;
  end;

  if FMultiLine then begin
    //row:=y div FTabHeight;
    cnty:=0;
    cntx:=0;
    right:=baseOffset;

    for i:=0 to FTabs.Count-1 do begin

      left:=right;
      if FTabWidth>0 then tmpWidth := FTabWidth
      else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;

      if left + tmpWidth +sepOffset > Self.Width then begin
        if cntx=0 then begin
          cntx:=1;
        end
        else begin
          Inc(cnty);
          cntx:=1;
          left:=baseOffset;
        end;
      end
      else begin
        Inc(cntx);
      end;

      right:=left + tmpWidth + sepOffset;

      {if (cnty = row) and (X>=left) and (X<=right) then begin
        Result:=i;
        Exit;
      end;}
      if i=Index then begin
        Result.Left:=left;
        Result.Top:=FTabHeight*cnty;
        Result.Right:=right;
        Result.Bottom:=Result.Top+FTabHeight;
        Exit;
      end;

    end;

  end
  else begin
    right:=-FOffsetX+baseOffset;
    for i:=0 to FTabs.Count-1 do begin

      left:=right;

      if FTabWidth>0 then tmpWidth := FTabWidth
      else tmpWidth := Self.Canvas.TextWidth(FTabs.Strings[i])+10;

      right := right + tmpWidth + sepOffset;

      {if (X>=left) and (X<=right) then begin
        Result:=i;
        Exit;
      end;}
      if i=Index then begin
        Result.Left:=left;
        Result.Top:=0;
        Result.Right:=right;
        Result.Bottom:=Result.Top+FTabHeight;
        Exit;
      end;

    end;
  end;
end;

procedure TTabbedToolBar.WndProc(var Message: TMessage);
begin
  if Message.Msg = CM_MOUSELEAVE then begin
    FHotIndex:=-1;
    Invalidate;
  end;
  
	inherited WndProc(Message);
end;

constructor TTabbedToolBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TabStop := True;
  TabHeight := 18;
  MultiLine := true;
  TabStyle := btsFlatButtons;

  FOffsetX:=0;
  FOffsetY:=0;
  FTabs := TBagelTabStrings.Create;
  TBagelTabStrings(FTabs).FTabControl := Self;
end;

destructor TTabbedToolBar.Destroy;
begin
  FTabs.Free;
  inherited Destroy;
end;

procedure TTabbedToolBar.CreateWnd;
begin
	inherited CreateWnd;
end;

procedure TTabbedToolBar.DestroyWnd;
begin
	inherited DestroyWnd;
end;

procedure TBagelTabStrings.UpdateTabs(ACount: Integer);
begin
  //if Count = ACount then
  //begin
    //FTabControl.AdjustTabs;
  //end
  //else
  //begin   CheckHeight;
  if GetCount=1 then FTabControl.FTabIndex:=0;
  FTabControl.CheckHeight;
  FTabControl.Invalidate;
  //end;
end;

function TBagelTabStrings.Add(const S: string): Integer;
begin
  Result := inherited Add(S);
  UpdateTabs(1);
end;

function TBagelTabStrings.AddObject(const S: string; AObject: TObject): Integer;
begin
  Result := inherited AddObject(S,AObject);
  UpdateTabs(1);
end;

procedure TBagelTabStrings.InsertObject(Index: Integer; const S: string; AObject: TObject);
begin
  inherited InsertObject(Index,S,AObject);
  UpdateTabs(1);
end;

procedure TBagelTabStrings.Move(CurIndex, NewIndex: Integer);
var
  tmpTabIndex:Integer;
begin
  tmpTabIndex:=FTabControl.TabIndex;
  inherited Move(CurIndex,NewIndex);
    if CurIndex = tmpTabIndex then FTabControl.TabIndex:=NewIndex;
  UpdateTabs(1);
end;


procedure TBagelTabStrings.Insert(Index: Integer; const S: string);
begin
  inherited Insert(Index, S);
  if Index <= FTabControl.FTabIndex then
  begin
    Inc(FTabControl.FTabIndex);
  end;
  UpdateTabs(1);
end;

procedure TBagelTabStrings.Delete(Index: Integer);
var
  OldIndex: Integer;
begin
  OldIndex := FTabControl.TabIndex;
  inherited Delete(Index);
  if Index <= OldIndex then
  begin
    Dec(FTabControl.FTabIndex);
  end;
  FTabControl.FTabIndex := Min(Max(0, FTabControl.TabIndex), Count - 1);
  UpdateTabs(0);
  if (OldIndex = Index) then
  begin
    FTabControl.Click;
  end;
//  FTabControl.ResetAutoMove;
end;

procedure TBagelTabStrings.Put(Index: Integer; const S: string);
begin
  inherited Put(Index, S);
  UpdateTabs(0);
//  FTabControl.Invalidate;
end;

procedure TBagelTabStrings.Clear;
begin
  inherited Clear;
  FTabControl.FTabIndex := -1;
//  FTabControl.ResetAutoMove;
  FTabControl.Invalidate;
end;
end.
