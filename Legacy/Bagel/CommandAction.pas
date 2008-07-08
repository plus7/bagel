unit CommandAction;

interface

uses
  Windows, Messages, SysUtils, Classes, ActnList, nsXPCOM, BagelPref;

type
  TGeckoPrefType = (gpInt, gpStr, gpBool);
  //TGeckoPrefToggleType = (gptToggle, gptOn);
  TCommandAction = class(TAction)
  private
    { Private éŒ¾ }
    FCommand:String;
    FOption:String;
  protected
    { Protected éŒ¾ }
  public
    { Public éŒ¾ }
  published
    { Published éŒ¾ }
    property Command: String read FCommand write FCommand;
    property Option: String read FOption write FOption;
  end;

  TGeckoPrefAction = class(TAction)
  private
    FPrefName:String;
    FPrefType:TGeckoPrefType;
    //FToggleType:TGeckoPrefToggleType;
    FOnVal:String;
    FOffVal:String;
  public
    function Execute:Boolean; override;
    function Update:Boolean; override;
    procedure SetPrefType(Value:TGeckoPrefType);
    property PrefName:String read FPrefName write FPrefName;
    property PrefType:TGeckoPrefType read FPrefType write SetPrefType;
    property OnVal:String read FOnVal write FOnVal;
    property OffVal:String read FOffVal write FOffVal;
    //property ToggleType:TGeckoPrefType read FToggleType write FToggleType;
  end;

implementation

procedure TGeckoPrefAction.SetPrefType(Value:TGeckoPrefType);
begin
  FPrefType := Value;
  if FPrefType = gpBool then Self.AutoCheck := True
  else Self.AutoCheck := False;
  
end;

function TGeckoPrefAction.Execute:Boolean;
var
  gp:TGeckoPref;
begin
  gp := TGeckoPref.Create;
  inherited Execute;
  try
    if AutoCheck then begin
      if Checked then begin
        //On
        if FPrefType = gpInt then begin
          gp.SetIntPref(FPrefName, StrToInt(FOnVal));
        end
        else if FPrefType = gpBool then begin
          gp.SetBoolPref(FPrefName, (FOnVal='True'));
        end
        else if FPrefType = gpStr then begin
          gp.SetStrPref(FPrefName, FOnVal);
        end;
      end
      else begin
        if FPrefType = gpInt then begin
          gp.SetIntPref(FPrefName, StrToInt(FOffVal));
        end
        else if FPrefType = gpBool then begin
          gp.SetBoolPref(FPrefName, (FOnVal='False'));
        end
        else if FPrefType = gpStr then begin
          gp.SetStrPref(FPrefName, FOffVal);
        end;
      end;
    end
    else begin
      if FPrefType = gpInt then begin
        gp.SetIntPref(FPrefName, StrToInt(FOnVal));
      end
      else if FPrefType = gpBool then begin
        gp.SetBoolPref(FPrefName, (FOnVal='True'));
      end
      else if FPrefType = gpStr then begin
        gp.SetStrPref(FPrefName, FOnVal);
      end;
      Self.Checked := True;
    end;
    //end;
  finally
    gp.Free;
  end;
  Result := True;
end;

function TGeckoPrefAction.Update:Boolean;
var
  PrefValStr:String;
  gp:TGeckoPref;
begin
  inherited Update;
  gp := TGeckoPref.Create;
  try
    if FPrefType = gpInt then begin
      PrefValStr := IntToStr(gp.GetIntPref(FPrefName));
    end
    else if FPrefType = gpBool then begin
      if gp.GetBoolPref(FPrefName) then PrefValStr := 'True'
      else PrefValStr := 'False'; 
    end
    else if FPrefType = gpStr then begin
      PrefValStr := gp.GetStrPref(FPrefName);
    end;
  finally
    gp.Free;
  end;
  Self.Checked := PrefValStr = FOnVal;
  Result := True;
end;

end.
