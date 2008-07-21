unit splitjoin;

interface

uses
  Classes, StrUtils;
  
const
  // アプリケーション共通で使う
  btCrLf = #13#10;
  btTab  = #09;

  // Split関数
  function btSplitToStringList(const AString: string;
    const Delimiter : string = btCrLf): TStringList;
  type TStrArray = array of string;
  function btSplitToArray(const AString: string;
    const Delimiter : string = btCrLf): TStrArray;

  // Join関数
  function btJoin(const AStringList: TStringList;
    const Delimiter : string = ''): string; Overload;
  function btJoin(const AStringArray: TStrArray;
    const Delimiter : string = ''): string; Overload;
  function btJoin(const AStringArray: array of string;
    const Delimiter : string = ''): string; Overload;

implementation

{
**************************************************************
    Split関数（簡略型、制限あり）

◎動作
　AStringをDelimiterで分割し、TStringList形式で戻す

◎制限
　文字列途中に改行があると、そこでも分割される

◎使い方
var SplittedStringList: TStringList;
SplittedStringList := btSplitToStringList(AString, Delimiter);
SplittedStringList.Free     <== これを忘れないこと！
**************************************************************
}
function btSplitToStringList(const AString: string;
  const Delimiter : string = btCrLf): TStringList;
begin
  Result := TStringList.Create;
  Result.Text := AnsiReplaceStr(AString, Delimiter, btCrLf);
end;


{
**************************************************************
    Split関数（簡略型、制限あり）

◎動作
　AStringをDelimiterで分割し、TStrArray形式（文字列の動的配列）で戻す

◎制限
　文字列途中に改行があると、そこでも分割される

◎使い方
var   SplittedStr: TStrArray;
SplittedStr := btSplitToArray(AString, Delimiter);
**************************************************************
}
function btSplitToArray(const AString: string;
  const Delimiter : string = btCrLf): TStrArray;
var
  SplittedStrs : TStringList;
  i: integer;
begin
  SplittedStrs := btSplitToStringList(AString, Delimiter);
  SetLength(Result, SplittedStrs.Count);
  try
    for i := 0 to SplittedStrs.Count - 1 do begin
      Result[i] := SplittedStrs.Strings[i];
    end;
  finally
    SplittedStrs.Free;
  end;
end;

{
**************************************************************
    Join関数（簡略型、制限あり）

◎動作
　AStringListをDelimiterで連結し、Stringで戻す

◎制限
　渡されたリストに空白項目があるとDelimiterが並ぶ

◎使い方
JoinedStr := btJoin(AStringList, Delimiter);
AStringListは、TStringLise, TStrArray, string配列をとれる
**************************************************************
}
function btJoin(const AStringList: TStringList;
    const Delimiter : string = ''): string;
var
  i: integer;
begin
  if AStringList.Count = 0 then begin
    Result := '';
  end else begin
    Result := AStringList[0];
  end;
  for i:= 1 to AStringList.Count - 1 do begin
    Result := Result + Delimiter + AStringList[i];
  end;
end;
{---------------------------------------------------------------}
function btJoin(const AStringArray: TStrArray;
    const Delimiter : string = ''): string;
var
  i: integer;
begin
  if High(AStringArray) < 0 then begin
    Result := '';
  end else begin
    Result := AStringArray[Low(AStringArray)];
  end;
  for i:= Low(AStringArray) + 1 to High(AStringArray) do begin
    Result := Result + Delimiter + AStringArray[i];
  end;
end;
{---------------------------------------------------------------}
function btJoin(const AStringArray: array of string;
    const Delimiter : string = ''): string;
var
  i: integer;
begin
  if High(AStringArray) < 0 then begin
    Result := '';
  end else begin
    Result := AStringArray[Low(AStringArray)];
  end;
  for i:= Low(AStringArray) + 1 to High(AStringArray) do begin
    Result := Result + Delimiter + AStringArray[i];
  end;
end;

end.
