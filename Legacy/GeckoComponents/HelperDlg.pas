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
 * The Initial Developer of the Original Code is NOSE Takafumi.
 * Portions created by the Initial Developer are Copyright (C) 2008
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
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
unit HelperDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, nsXPCOM,nsXPCOMGlue, nsTypes, StdCtrls, nsMIMEInfo,nsHelperApp
  ,nsGeckoStrings,nsNetUtil,nsError,nsDownload, ExtCtrls, ShellAPI, ImgList,
  nsInit;

type
  THelperDlg = class(TForm)
    btnSave: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    SaveDialog1: TSaveDialog;
    btnExecute: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    lblName: TLabel;
    lblMime: TLabel;
    lblSource: TLabel;
    chkRememberThisPref: TCheckBox;
    edtURI: TEdit;
  private
    { Private 宣言 }
  public
    procedure DrawIconByExt(Extension:String);
    procedure Show(aLauncher: nsIHelperAppLauncher; aContext: nsISupports; aReason: PRUint32); safecall;
    function PromptForSaveToFile(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; const aDefaultFile: PWideChar; const aSuggestedFileExtension: PWideChar): nsILocalFile; safecall;
  end;

{var
  HelperDlgForm: THelperDlg;}

implementation

{$R *.dfm}

procedure THelperDlg.DrawIconByExt(Extension:String);
var
  SHFileInfo:TShFileInfo;
  IconHandle:HICON;
  icon:TIcon;
begin
  SHGetFileInfo(
    PChar('.'+Extension),
    0, SHFileInfo, Sizeof(TSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES or
    SHGFI_ICON or SHGFI_TYPENAME);
  IconHandle := SHFileInfo.hIcon;
  DrawIconEx(
    Image1.Canvas.Handle,
    0,0,
    IconHandle, 32, 32, 0, 0,
    DI_NORMAL);
  DestroyIcon(IconHandle);
end;

procedure THelperDlg.Show(aLauncher: nsIHelperAppLauncher; aContext: nsISupports; aReason: PRUint32);
var
  spec:IInterfacedCString;
  filename:IInterfacedString;
  host:IInterfacedCString;
  ContentType:IInterfacedCString;
  Desc:IInterfacedString;
  AppDesc:IInterfacedString;
  ext:IInterfacedCString;
  openWith:nsILocalFile;
  modalResult:Integer;
begin
  spec:=NewCString;
  aLauncher.Source.GetSpec(spec.ACString);
  edtURI.Text:=spec.ToString;

  host:=NewCString;
  aLauncher.Source.GetHost(host.ACString);
  lblSource.Caption := host.ToString;

  ContentType:=NewCString;
  Desc:=NewString;
  aLauncher.MIMEInfo.GetMIMEType(ContentType.ACString);
  aLauncher.MIMEInfo.GetDescription(Desc.AString);
  lblMime.Caption := Desc.ToString + '(' + ContentType.ToString + ')';

  filename:=NewString;
  aLauncher.GetSuggestedFileName(filename.AString);
  lblName.Caption := filename.ToString ;

  ext:=NewCString;
  aLauncher.MIMEInfo.GetPrimaryExtension(ext.ACString);
  DrawIconByExt(ext.ToString);

  modalResult:=ShowModal;

  if modalResult = mrOk then  begin
    aLauncher.SaveToDisk(nil,chkRememberThisPref.Checked);
  end
  else if ModalResult=mrYes then begin // 便宜的にmrYesを「実行」と解釈する。良くないな。
    AppDesc:=NewString;
    aLauncher.MIMEInfo.GetDefaultDescription(Appdesc.AString);
    NS_NewLocalFile(AppDesc.AString,false,openWith);
    aLauncher.LaunchWithApplication(openWith,chkRememberThisPref.Checked);
  end
  else aLauncher.Cancel(NS_ERROR_ABORT);
end;

function THelperDlg.PromptForSaveToFile(aLauncher: nsIHelperAppLauncher; aWindowContext: nsISupports; const aDefaultFile: PWideChar; const aSuggestedFileExtension: PWideChar): nsILocalFile;
var
  thefile:nsILocalFile;
begin
  SaveDialog1.Filter:='全てのファイル (*.*)|*.*';
  SaveDialog1.FileName := String(aDefaultFile);
  SaveDialog1.Execute;
  if SaveDialog1.FileName<>'' then
  begin
    NS_NewNativeLocalFile(NewCString(SaveDialog1.FileName).ACString,false,thefile);
    Result:=thefile;
  end;
end;


end.
