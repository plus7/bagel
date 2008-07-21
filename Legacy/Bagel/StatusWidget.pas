unit StatusWidget;

interface

uses Controls, Windows, Graphics, Types, Classes,
     ActnList, ComCtrls, StdCtrls, Themes, ImgList,
     Messages;

const
  swsButton = 0;
  swsDropdown = 1;

type

  TStatusWidget = class;

  TStatusWidgetActionLink = class(TControlActionLink)
  protected
    FClient: TStatusWidget;
    FImageIndex: Integer;
    procedure AssignClient(AClient: TObject); override;
    function IsCheckedLinked: Boolean; override;
    function IsGroupIndexLinked: Boolean; override;
    function IsImageIndexLinked: Boolean; override;
    function IsAutoCheckLinked: Boolean; virtual;
    procedure SetGroupIndex(Value: Integer); override;
    procedure SetChecked(Value: Boolean); override;
    procedure SetImageIndex(Value: Integer); override;
  public
    constructor Create(AClient: TObject); override;
  end;

  TStatusWidgetActionLinkClass = class of TStatusWidgetActionLink;

  TStatusWidget = class(TGraphicControl)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
//    FLayout: TTextLayout;

    FImageIndex:Integer;
    FActionLink: TStatusWidgetActionLink;
    FShowCaption:Boolean;
    FCaption:String;
    FChecked:Boolean;
    FAutoCheck:Boolean;
    FEnabled:Boolean;
    FHint:String;
    //FBitmap:TBitmap;

    procedure SetAlignment(Value: TAlignment);

    function GetActionLinkClass: TStatusWidgetActionLinkClass; dynamic;
    function GetAction: TBasicAction; override;
    procedure SetAction(Value: TBasicAction);
    procedure SetCaption(Value: String);
    procedure SetLayout(Value: TTextLayout);
    procedure SetChecked(Value: Boolean);
    procedure SetImageIndex(Value: Integer);
//    procedure SetBitmap(Value: TBitmap);
    procedure DoActionChange(Sender: TObject);
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  protected
    procedure Loaded; override;
    procedure AdjustBounds;
    function DrawBackGround(Rect: TRect):TRect;
    procedure DoDrawText(var Rect: TRect; Flags: Longint);
    procedure DoDrawIcon(Rect: TRect);
    procedure SetAutoSize(Value: Boolean); override;
    procedure Paint; override;

    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;

    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    property Canvas;

  published
    property Action: TBasicAction read GetAction write SetAction;
    property ActionLink: TStatusWidgetActionLink read FActionLink write FActionLink;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property Caption: String read FCaption write SetCaption;
    property ShowCaption: Boolean read FShowCaption write FShowCaption;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;
//    property Layout: TTextLayout read FLayout write SetLayout default tlCenter;
    property Checked: Boolean read FChecked write SetChecked;
    property AutoCheck:Boolean read FAutoCheck write FAutoCheck;
    property Enabled:Boolean read FEnabled write FEnabled;
    property Hint:String read FHint write FHint;
  end;

implementation

function Max(i1:Integer; i2:Integer):Integer;
begin
  Result:=i1;
  if i2>i1 then Result:=i2;
end;

function min(i1:Integer; i2:Integer):Integer;
begin
  Result:=i1;
  if i2<i1 then Result:=i2;
end;

procedure TStatusWidgetActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TStatusWidget;
end;

constructor TStatusWidgetActionLink.Create(AClient: TObject);
begin
  inherited Create(AClient);
  FImageIndex := -1;
end;

function TStatusWidgetActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked {and (FClient.GroupIndex <> 0)} {and
    FClient.AllowAllUp and (FClient.Checked = (Action as TCustomAction).Checked)};
end;

function TStatusWidgetActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := False{(FClient is TStatusWidget) and
    (TStatusWidget(FClient).GroupIndex = (Action as TCustomAction).GroupIndex)};
end;

function TStatusWidgetActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FImageIndex = (Action as TCustomAction).ImageIndex);
end;

procedure TStatusWidgetActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then begin
    TStatusWidget(FClient).Checked := Value;
  end;
end;

procedure TStatusWidgetActionLink.SetGroupIndex(Value: Integer);
begin
  //if IsGroupIndexLinked then TStatusWidget(FClient).GroupIndex := Value;
end;

procedure TStatusWidgetActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then
  begin
    FImageIndex := Value;{
    with (Action as TCustomAction) do
      if (ActionList <> nil) and (ActionList.Images <> nil) then
        if (FImageIndex >= 0) and (FImageIndex < ActionList.Images.Count) then
          FClient.CopyImage(ActionList.Images, Value)
        else
          FClient.Bitmap := nil;}
  end;
end;

procedure TStatusWidget.SetCaption(Value: String);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    AdjustBounds;
  end;
end;

procedure TStatusWidget.SetAction(Value: TBasicAction);
begin
  if Value = nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    ActionChange(Value, csLoading in Value.ComponentState);
    Value.FreeNotification(Self);
  end;
end;

function TStatusWidget.GetActionLinkClass: TStatusWidgetActionLinkClass;
begin
  Result := TStatusWidgetActionLink;
end;

function TStatusWidgetActionLink.IsAutoCheckLinked: Boolean;
begin
  Result := FClient.AutoCheck = (Action as TCustomAction).AutoCheck;
end;

function TStatusWidget.GetAction: TBasicAction;
begin
  if FActionLink <> nil then
    Result := FActionLink.Action else
    Result := nil;
end;

procedure TStatusWidget.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if not CheckDefaults or (Self.AutoCheck = False) then
        Self.AutoCheck := AutoCheck;
      if not CheckDefaults or (Self.Caption = '') then
        Self.Caption := Caption;
      if not CheckDefaults or (Self.Checked = False) then
        Self.Checked := Checked;
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      //if not CheckDefaults or (Self.HelpContext = 0) then
      //  Self.HelpContext := HelpContext;
      if not CheckDefaults or (Self.Hint = '') then
        Self.Hint := Hint;
      //if RadioItem and (not CheckDefaults or (Self.GroupIndex = 0)) then
      //  Self.GroupIndex := GroupIndex;
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
      //if not CheckDefaults or (Self.ShortCut = scNone) then
      //  Self.ShortCut := ShortCut;
      if not CheckDefaults or (Self.Visible = True) then
        Self.Visible := Visible;
      if not CheckDefaults or not Assigned(Self.OnClick) then
        Self.OnClick := OnExecute;
      Invalidate;
    end;
end;

procedure TStatusWidget.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

procedure TStatusWidget.Click;
begin
  if Enabled then
  begin
    if (not Assigned(ActionLink) and AutoCheck) or (Assigned(ActionLink) and
        not (ActionLink.IsAutoCheckLinked) and AutoCheck) then
      Checked := not Checked;
    if Assigned(Self.OnClick) and (Action <> nil) and (@Self.OnClick <> @Action.OnExecute) then
      Self.OnClick(Self)
    else if not (csDesigning in ComponentState) and (ActionLink <> nil) then
      FActionLink.Execute(Self)
    else if Assigned(Self.OnClick) then
      Self.OnClick(Self);
  end;
end;

constructor TStatusWidget.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable] - [csOpaque];
  Width := 65;
  Height := 17;
  FAutoSize := True;
end;

destructor TStatusWidget.Destroy;
begin
  //FBitmap.Free;
  //FBitmap := nil;
end;

procedure TStatusWidget.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;

procedure TStatusWidget.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    AdjustBounds;
  end;
end;

procedure DrawChecker(Canvas:TCanvas;Rect:TRect);
var
bmp:TBitmap;
bmprect:TRect;
i,j:Integer;
begin
  bmp := TBitmap.Create;
  try
    bmp.Width:=8;
    bmp.Height:=8;
    bmprect.Left:=0;
    bmprect.Top:=0;
    bmprect.Right:=8;
    bmprect.Bottom:=8;
    bmp.Canvas.Brush.Color:=clBtnHighlight;
    bmp.Canvas.FillRect(bmprect);
    for i:=0 to 7 do begin
      for j:=0 to 7 do begin
        if (i+j) mod 2 =0 then
        bmp.Canvas.Pixels[j,i]:=clBtnFace;
      end;
    end;
    Canvas.Brush.Bitmap := bmp;
    Canvas.FillRect(Rect);
  finally
    Canvas.Brush.Bitmap := nil;
    bmp.Free;
  end;
end;

function TStatusWidget.DrawBackGround(Rect: TRect):TRect;
var
  ToolButton: TThemedToolBar;
  Details: TThemedElementDetails;
begin
  if Checked then begin
    if ThemeServices.ThemesEnabled then begin
      Toolbutton := ttbButtonPressed;
      Details := ThemeServices.GetElementDetails(ToolButton);
      ThemeServices.DrawElement(Canvas.Handle, Details, Rect);
      Result := ThemeServices.ContentRect(Canvas.Handle, Details, Rect);
    end
    else begin
      DrawChecker(Canvas,Rect);
      Result := Rect;
    end;
  end
  else begin
    if ThemeServices.ThemesEnabled then begin
      PerformEraseBackground(Self, Canvas.Handle);
      Result := Rect;
    end
    else begin
      Canvas.Brush.Style := bsClear;
      Canvas.FillRect(Rect);
      Result := Rect;
    end;
  end;
end;

procedure TStatusWidget.DoDrawText(var Rect: TRect; Flags: Longint);
{const
  EllipsisStr = '...';
  Ellipsis: array[TEllipsisPosition] of Longint = (0, DT_PATH_ELLIPSIS,
    DT_END_ELLIPSIS, DT_WORD_ELLIPSIS);}
var
  Text, DText: string;
  NewRect: TRect;
  Height, Delim: Integer;
begin
  Text := Caption;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') {or FShowAccelChar} and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  //if not FShowAccelChar then Flags := Flags or DT_NOPREFIX;
  Flags := DrawTextBiDiModeFlags(Flags);
  Canvas.Font := Font;
  (*
  if {(FEllipsisPosition <> epNone) and }not FAutoSize then
  begin
    DText := Text;
    Flags := Flags and not DT_EXPANDTABS;
    //Flags := Flags or Ellipsis[FEllipsisPosition];
    {if FWordWrap and (FEllipsisPosition in [epEndEllipsis, epWordEllipsis]) then
    begin
      repeat
        NewRect := Rect;
        Dec(NewRect.Right, Canvas.TextWidth(EllipsisStr));
        DrawText(Canvas.Handle, PChar(DText), Length(DText), NewRect, Flags or DT_CALCRECT);
        Height := NewRect.Bottom - NewRect.Top;
        if (Height > ClientHeight) and (Height > Canvas.Font.Height) then
        begin
          Delim := LastDelimiter(' '#9, Text);
          if Delim = 0 then
            Delim := Length(Text);
          Dec(Delim);
          if ByteType(Text, Delim) = mbLeadByte then
            Dec(Delim);
          Text := Copy(Text, 1, Delim);
          DText := Text + EllipsisStr;
          if Text = '' then
            Break;
        end else
          Break;
      until False;
    end;}
    if Text <> '' then
      Text := DText;
  end;*)
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
  end
  else
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
end;

procedure TStatusWidget.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

procedure TStatusWidget.AdjustBounds;
var
  DC: HDC;
  IconWidth, IconHeight, X: Integer;
  TextRect: TRect;
  AAlignment: TAlignment;
begin
  if not (csReading in ComponentState) and FAutoSize then
  begin
    IconWidth := 0;
    IconHeight := 0;
    if Action <> nil then with (Action as TCustomAction) do
      if (ActionList <> nil) and (ActionList.Images <> nil) then
        if (FImageIndex >= 0) and (FImageIndex < ActionList.Images.Count) then begin
          IconWidth := ActionList.Images.Width;
          IconHeight := ActionList.Images.Height;
        end;
    TextRect := Rect(0,0,0,0);
    if ShowCaption then begin
      TextRect := ClientRect;
      DC := GetDC(0);
      Canvas.Handle := DC;
      DoDrawText(TextRect, (DT_EXPANDTABS or DT_CALCRECT));
      Canvas.Handle := 0;
      ReleaseDC(0, DC);
      //X := Left;
    end;
    {AAlignment := FAlignment;
    if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
    if AAlignment = taRightJustify then Inc(X, Width - Rect.Right);}
    SetBounds(Left, Top, TextRect.Right + IconWidth + 2, Height{Max(TextRect.Bottom,IconHeight)});
  end;
end;

procedure TStatusWidget.DoDrawIcon(Rect: TRect);
var
  imglist:TCustomImageList;
begin
  if Action<>nil then
    with (Action as TCustomAction) do
      if (ActionList <> nil) and (ActionList.Images <> nil) then
        if (FImageIndex >= 0) and (FImageIndex < ActionList.Images.Count) then begin
          ActionList.Images.Draw(Canvas,Rect.Left,Rect.Top,FImageIndex);
        end;
end;

procedure TStatusWidget.Paint;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  ContentRect, CalcRect, IconRect: TRect;
  DrawStyle: Longint;
  imglist:TCustomImageList;
begin
  //”wŒi‚ð•`‰æ
  //ContentRect :=
  DrawBackGround(ClientRect);
  ContentRect := ClientRect;
  //ƒAƒCƒRƒ“‚ð•`‰æ
  //ƒeƒLƒXƒg‚ð•`‰æ


  with Canvas do
  begin
    Brush.Style := bsClear;
    DrawStyle := DT_EXPANDTABS or Alignments[FAlignment];
    CalcRect := ContentRect;
    IconRect := ContentRect;
    DoDrawText(CalcRect, DrawStyle or DT_CALCRECT);
    OffsetRect(ContentRect, 0, (Height - CalcRect.Bottom) div 2);

    if Action <> nil then with (Action as TCustomAction) do
      if (ActionList <> nil) and (ActionList.Images <> nil) then
        if (FImageIndex >= 0) and (FImageIndex < ActionList.Images.Count) then begin
          imglist := ActionList.Images;
          OffsetRect(IconRect, 0, (Height - Imglist.Height) div 2);
        end;

    if Checked then begin
      OffsetRect(ContentRect, 1, 1);
      OffsetRect(IconRect, 1, 1);
    end;

    if ImageIndex >= 0 then OffsetRect(ContentRect, 16, 0);

    if ShowCaption then DoDrawText(ContentRect, DrawStyle);
    DoDrawIcon(IconRect);
  end;
end;

procedure TStatusWidget.SetLayout(Value: TTextLayout);
begin
  {if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;}
end;

procedure TStatusWidget.SetChecked(Value: Boolean);
begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    Invalidate;
  end;
end;

procedure TStatusWidget.SetImageIndex(Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    Invalidate;
  end;
end;

procedure TStatusWidget.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
  AdjustBounds;
end;

procedure TStatusWidget.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
end;

end.
