(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
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
 * The Original Code is GeckoComponents for Delphi.
 *
 * The Initial Developer of the Original Code is .
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *  NOSE Takafumi <ahya365@gmail.com>
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** *)

unit PromptDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, nsXPCOM, nsTypes, StdCtrls;

type
  PWideCharArray = ^PWideChar;

  TPromptDlg = class(TForm)
    PromptText: TLabel;
    Button1: TButton;
    PromptValue: TEdit;
    Button2: TButton;
    Button3: TButton;
    PromptPassword: TEdit;
    PromptCheck: TCheckBox;
    PromptList: TComboBox;

    procedure Startup(const Title, Text: String);
    procedure ButtonSet(Button: TButton; Flags: Cardinal; const Text: String);
  private
    { Private 宣言 }
  public
    procedure Alert(const Title, Text: String);
    procedure AlertCheck(const Title, Text, CheckMsg: String; var Check: LongBool);
    function Confirm(const Title, Text: String): LongBool;
    function ConfirmCheck(const Title, Text, CheckMsg: String; var Check: LongBool): LongBool;
    function ConfirmEx(const Title, Text: String; ButtonFlags: Cardinal; const B1Text, B2Text, B3Text, CheckMsg: String; var Check: LongBool): Integer;
    function Prompt(const Title, Text, CheckMsg: String; var Value: String; var Check: LongBool): LongBool;
    function PromptUserAndPass(const Title, Text, CheckMsg: String; var Username, Password: String; var Check: LongBool): LongBool;
    function PromptPass(const Title, Text, CheckMsg: String; var Password: String; var Check: LongBool): LongBool;
    function Select(const Title, Text: String; Count: Longword; List: PWideCharArray; out OutSelection: Integer): LongBool;
  end;

var
  PromptForm: TPromptDlg;

implementation

{$R *.dfm}

procedure TPromptDlg.Startup(const Title, Text: String);
begin
  ClientWidth := 393;

  if Caption<>'' then
  Caption := Title
  else
  Caption := 'Bagel';

  with PromptText do
  begin
    Width := 377;
    Caption := Text;
  end;
  PromptValue.Visible := True;
  PromptPassword.Visible := False;
  //PromptCheck.Visible := False;
  Button2.Visible := True;
  Button3.Visible := False;
  PromptList.Visible := False;

  Button1.Caption := 'OK';
  Button1.ModalResult := mrOK;
  Button2.Caption := 'キャンセル';
  Button2.ModalResult := mrCancel;
end;

procedure TPromptDlg.ButtonSet(Button: TButton; Flags: Cardinal; const Text: String);
begin
  with Button do
  begin
    case Flags of
    1:
      Caption := 'OK';
    2:
      Caption := 'キャンセル';
    3:
      Caption := 'はい(&Y)';
    4:
      Caption := 'いいえ(&N)';
    5:
      Caption := '保存する(&S)';
    6:
      Caption := '保存しない(&D)';
    7:
      Caption := '戻す(&R)';
    127:
      Caption := Text;
    else
      Button.Visible := False;
    end;
  end;
end;

procedure TPromptDlg.Alert(const Title, Text: String);
var
  h: Integer;
begin
  Startup(Title, Text);

  PromptValue.Visible := False;
  //PromptPassword.Visible := False;
  PromptCheck.Visible := False;
  Button2.Visible := False;
  //Button3.Visible := False;

  h := PromptText.Height;

  Button1.Left := 160;
  Button1.Top := h + 16;
  ClientHeight := h + 41;

  ShowModal;
end;

procedure TPromptDlg.AlertCheck(const Title, Text, CheckMsg: String; var Check: LongBool);
var
  h: Integer;
begin
  Startup(Title, Text);
  PromptValue.Visible := False;
  //PromptPassword.Visible := False;
  Button2.Visible := False;
  //Button3.Visible := False;

  h := PromptText.Height;
  PromptCheck.Visible := true;
  PromptCheck.Caption := CheckMsg;
  PromptCheck.Checked := Check;
  PromptCheck.Top := h + 16;
  Button1.Left := 160;
  Button1.Top := h + 40;
  ClientHeight := h + 65 +8;

  ShowModal;

  Check := PromptCheck.Checked;
end;

function TPromptDlg.Confirm(const Title, Text: String): LongBool;
var
  h: Integer;
begin
  Startup(Title, Text);

  PromptValue.Visible := False;
  //PromptPassword.Visible := False;
  PromptCheck.Visible := False;
  //Button2.Visible := False;
  //Button3.Visible := False;

  h := PromptText.Height;

  Button1.Left := 120;
  Button1.Top := h + 16;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 16;
  ClientHeight := h + 41 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
end;

function TPromptDlg.ConfirmCheck(const Title, Text, CheckMsg: String; var Check: LongBool): LongBool;
var
  h: Integer;
begin
  Startup(Title, Text);
  PromptValue.Visible := False;
  //PromptPassword.Visible := False;
  //PromptCheck.Visible := False;
  //Button2.Visible := False;
  //Button3.Visible := False;

  h := PromptText.Height;

  PromptCheck.Caption := CheckMsg;
  PromptCheck.Top := h + 16;
  PromptCheck.Checked := Check;
  Button1.Left := 120;
  Button1.Top := h + 40;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 40;
  ClientHeight := h + 65 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
  Check := PromptCheck.Checked;
end;

function TPromptDlg.ConfirmEx(const Title, Text: String; ButtonFlags: Cardinal; const B1Text, B2Text, B3Text, CheckMsg: String; var Check: LongBool): Integer;
var
  h: Integer;
begin
  Startup(Title, Text);

  PromptValue.Visible := False;
  PromptCheck.Visible := True;
  Button3.Visible := True;

  h := PromptText.Height;

  PromptCheck.Caption := CheckMsg;
  PromptCheck.Top := h + 16;

  if @Check<>nil then
  PromptCheck.Checked := Boolean(Check);

  Button1.Left := 152;
  Button1.Top := h + 40;
  Button1.ModalResult := 129;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 40;
  Button2.ModalResult := 130;
  Button3.Left := Button2.Left + Button2.Width + 8;
  Button3.Top := h + 40;
  Button3.ModalResult := 131;
  ClientHeight := h + 65 +8;

  ButtonSet(Button1, ButtonFlags and 255, B1Text);
  ButtonSet(Button2, (ButtonFlags shr 8) and 255, B2Text);
  ButtonSet(Button3, (ButtonFlags shr 16) and 255, B3Text);

  case ShowModal of
  129:
    Result := 0;
  130:
    Result := 1;
  131:
    Result := 2;
  else
    Result := 3;
  end;
  if @Check<>nil then
  Check := LongBool(PromptCheck.Checked);
end;

function TPromptDlg.Prompt(const Title, Text, CheckMsg: String; var Value: String; var Check: LongBool): LongBool;
var
  h: Integer;
begin
  Startup(Title, Text);

  h := PromptText.Height;

  PromptValue.Text := Value;
  PromptValue.Top := h + 16;
  PromptCheck.Caption := CheckMsg;
  PromptCheck.Top := h + 40;
  if @Check<>nil then
  PromptCheck.Checked := Check;
  Button1.Left := 120;
  Button1.Top := h + 64;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 64;
  ClientHeight := h + 89 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
  Value := PromptValue.Text;
  if @Check<>nil then
  Check := PromptCheck.Checked;
end;

function TPromptDlg.PromptUserAndPass(const Title, Text, CheckMsg: String; var Username, Password: String; var Check: LongBool): LongBool;
var
  h: Integer;
begin
  Startup(Title, Text);
  PromptPassword.Visible := True;

  h := PromptText.Height;
  PromptCheck.Visible := true;
  PromptValue.Text := Username;
  PromptValue.Top := h + 16;
  PromptPassword.Text := Password;
  PromptPassword.Top := h + 40;
  PromptCheck.Caption := CheckMsg;
  PromptCheck.Top := h + 64;
  PromptCheck.Checked := Check;
  Button1.Left := 120;
  Button1.Top := h + 88;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 88;
  ClientHeight := h + 113 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
  Username := PromptValue.Text;
  Password := PromptPassword.Text;
  Check := PromptCheck.Checked;
end;

function TPromptDlg.PromptPass(const Title, Text, CheckMsg: String; var Password: String; var Check: LongBool): LongBool;
var
  h: Integer;
begin
  Startup(Title, Text);
  PromptPassword.Visible := True;

  h := PromptText.Height;
  PromptCHeck.Visible := true;
  PromptPassword.Text := Password;
  PromptPassword.Top := h + 16;
  PromptCheck.Caption := CheckMsg;
  PromptCheck.Top := h + 40;
  PromptCheck.Checked := Check;
  Button1.Left := 120;
  Button1.Top := h + 64;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 64;
  ClientHeight := h + 89 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
  Password := PromptPassword.Text;
  Check := PromptCheck.Checked;
end;

function TPromptDlg.Select(const Title, Text: String; count: Longword; List: PWideCharArray; out OutSelection: Integer): LongBool;
var
  h: Integer;
  I: Integer;
  ptr: PWideCharArray;
  str: String;
begin
  Startup(Title, Text);
  h := PromptText.Height;

  PromptValue.Visible := False;
  PromptList.Visible := True;
  PromptList.Items.Clear;
  ptr := List;
  for I:=0 to Count-1 do
  begin
    str := WideString(ptr^);
    PromptList.Items.Add(str);
    Inc(ptr);
  end;
  PromptList.ItemIndex := 0;

  Button1.Left := 120;
  Button1.Top := h + 40;
  Button2.Left := Button1.Left + Button1.Width + 8;
  Button2.Top := h + 40;
  ClientHeight := h + 65 +8;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;

  OutSelection := PromptList.ItemIndex;
end;

end.
