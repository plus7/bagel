unit UCookieP3P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BagelPref;

type
  TfrmCookieP3PCustom = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  frmCookieP3PCustom: TfrmCookieP3PCustom;

implementation

{$R *.dfm}

function getPolicyByNumber(num:Integer):String;
var
  arr:Array[0..3] of String;
begin
  arr[0]:='a';
  arr[1]:='f';
  arr[2]:='d';
  arr[3]:='r';
  Result:=arr[num];
end;

function getNumberByPolicy(str:String):Integer;
begin
  if str='a' then Result:=0
  else if str='f' then Result:=1
  else if str='d' then Result:=2
  else if str='r' then Result:=3
  else Result := -1;
end;

procedure TfrmCookieP3PCustom.btnCancelClick(Sender: TObject);
begin
Self.Close;
end;

procedure TfrmCookieP3PCustom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCookieP3PCustom.FormCreate(Sender: TObject);
//var
//i:Integer;
begin
  if Length(Pref.CookieP3PCustom)<>8 then Pref.CookieP3PCustom:='ffffaaaa';
  ComboBox1.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[1]);
  ComboBox2.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[2]);
  ComboBox3.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[3]);
  ComboBox4.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[4]);
  ComboBox5.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[5]);
  ComboBox6.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[6]);
  ComboBox7.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[7]);
  ComboBox8.ItemIndex:=getNumberByPolicy(Pref.CookieP3PCustom[8]);
end;

procedure TfrmCookieP3PCustom.btnOkClick(Sender: TObject);
begin
  Pref.CookieP3PCustom:=getPolicyByNumber(ComboBox1.ItemIndex)+
                        getPolicyByNumber(ComboBox2.ItemIndex)+
                        getPolicyByNumber(ComboBox3.ItemIndex)+
                        getPolicyByNumber(ComboBox4.ItemIndex)+
                        getPolicyByNumber(ComboBox5.ItemIndex)+
                        getPolicyByNumber(ComboBox6.ItemIndex)+
                        getPolicyByNumber(ComboBox7.ItemIndex)+
                        getPolicyByNumber(ComboBox8.ItemIndex);
  Self.Close;
end;

end.
