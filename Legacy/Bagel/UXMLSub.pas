unit UXMLSub;
(* Copyright (c) 2001,2002 Twiddle <hetareprog@hotmail.com> *)
(* 自分が書いたのを読むだけなので、あくまで簡易 *)

{↑From OpenJane}

interface

uses
  Classes, StrUtils,
  UUngetStream;

type
  (*-------------------------------------------------------*)
  TXMLElementType = (xmleELEMENT, xmleTEXT, xmleENTITY);
  TXMLElement = class(TList)
  protected
    function GetItems(index: integer): TXMLElement;
    procedure SetItems(index: integer; elem: TXMLElement);
  public
    elementType: TXMLElementType;
    text: string;
    attrib: TStringList;
    constructor Create(elmType: TXMLElementType; name: string);
    destructor Destroy; override;
    procedure Clear; override;
    property Items[index:integer]: TXMLElement read GetItems write SetItems; default;
  end;

  (*-------------------------------------------------------*)
  TXMLDoc = class(TXMLElement)
  protected
//    FElements: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; override;
    procedure LoadFromStream(stream: TStream);
  end;

function XMLQuoteEncode(const str: string): string;

(*=======================================================*)
implementation
(*=======================================================*)

const
  TokenChars = ['0'..'9','A'..'Z',':','a'..'z','_','!','-'];


function XMLQuoteEncode(const str: string): string;
var
  i: integer;
begin
  result := '';
  for i := 1 to length(str) do
  begin
    case str[i] of
    '"': result := result + '&quot;';
    '&': result := result + '&amp;';
    else
      result := result + str[i];
    end;
  end;
end;

(*=======================================================*)
constructor TXMLElement.Create(elmType: TXMLElementType; name: string);
begin
  inherited Create;
  elementType := elmType;
  text := name;
  attrib := TStringList.Create;
end;

destructor TXMLElement.Destroy;
begin
  Clear;
  attrib.Free;
  inherited;
end;

procedure TXMLElement.Clear;
var
  i: Integer;
begin
  for i := 0 to Count -1 do
    TXMLElement(Items[i]).Free;
  inherited;
end;

function TXMLELement.GetItems(index: integer): TXMLElement;
begin
  result := inherited Items[index];
end;

procedure TXMLELement.SetItems(index: integer; elem: TXMLElement);
begin
  inherited Items[index] := elem;
end;


(*=======================================================*)
constructor TXMLDoc.Create;
begin
  inherited Create(xmleELEMENT, '');
//  FElements := TList.Create;
end;

destructor TXMLDoc.Destroy;
begin
  Clear;
  inherited;
end;

procedure TXMLDoc.Clear;
begin
//  FElements.Clear;
  inherited;
end;

procedure TXMLDoc.LoadFromStream(stream: TStream);
var
  input: TUngetStream;
  text: string;
  el: TXMLElement;
  c: Char;

  function GetChar: Char;
  var
    buf: Char;
  begin
    input.ReadBuffer(buf, 1);
    result := buf;
  end;

  procedure FlushText(elem: TXMLElement);
  begin
    if (0 < length(text)) then
    begin
      elem.Add(TXMLElement.Create(xmleTEXT, text));
      text := '';
    end;
  end;

  function GetName: string;
  begin
    result := '';
    while true do
    begin
      c := GetChar;
      if c in TokenChars then
        result := result + c
      else begin
        input.Unget(c);
        break;
      end;
//      case c of
//      '0'..'9','A'..'Z',':','a'..'z','_','!','-': result := result + c;
//      else begin input.Unget(c);  break; end;
//      end;
    end;
  end;

  procedure SkipSpaces;
  begin
    while true do
    begin
      c := GetChar;
      if not (c in [#0..#$20]) then
      begin
        input.Unget(c);
        break;
      end;
    end;
  end;

  procedure SkipComment;
  var
    s: string;
  begin
    s := '';
    while length(s) < 3 do
      s := s + GetChar;
    while true do
    begin
      if s = '-->' then
        exit;
      s := Copy(s, 1, 2) + GetChar;
    end;
  end;

  function GetEntity: string;
  begin
    result := '';
    while true do
    begin
      c := GetChar;
      case c of
      #$0..#$20,';': break;
      else result := result + c;
      end;
    end;
    if result = 'quot' then
      result := '"'
    else if result = 'amp' then
      result := '&'
    else
      result := '&' + result + c;
  end;

  function GetValue: string;
  begin
    result := '';
    c := GetChar;
    if c = '"' then
    begin
      while true do
      begin
        c := GetChar;
        case c of
        '"': break;
        '&': result := result + GetEntity;
        else result := result + c;
        end;
      end;
    end
    else begin
      result := c;
      while true do
      begin
        c := GetChar;
        case c of
        #0..#$20: break;
        '>': begin input.Unget(c); break; end;
        else result := result + c;
        end;
      end;
    end;
  end;

  procedure GetAttribute(elem: TXMLElement);
  var
    name, value: string;
  begin
    name := GetName;
    SkipSpaces;
    c := GetChar;
    if c <> '=' then
    begin
      input.Unget(c);
      exit;
    end;
    value := GetValue;
    elem.attrib.Add(name + '=' + value);
  end;

  procedure Parse(elem: TXMLElement); forward;
  function ParseTag(elem: TXMLElement): boolean;
  var
    return: boolean;
  begin
    result := false;
    (* 終了タグ？ *)
    c := GetChar;
    if c = '/' then
      result := true
    else
      input.Unget(c);
    return := result;
    text := GetName;
    if AnsiStartsStr('!--', text) then
    begin
      text := '';
      SkipComment;
      exit;
    end;
    if not result then
    begin
      el := TXMLElement.Create(xmleELEMENT, text);
      elem.Add(el);
    end;
    text := '';
    (* タグ内の処理 *)
    while true do
    begin
      SkipSpaces;
      c := GetChar;
      case c of
      '/': return := true;
      '>': break;
      else
        if c in TokenChars then
        begin
          input.Unget(c);
          GetAttribute(el);
        end;
      end;
    end;
    if not return then
      Parse(el);
  end;

  procedure ParseEntity(elem: TXMLElement);
  var
    name: String;
  begin
    while true do
    begin
      try
        c := GetChar;
      except
        break;
      end;
      case c of
      #$0..#$20,';': break;
      else name := name + c;
      end;
    end;
    if (0 < length(name)) then
    begin
      elem.Add(TXMLElement.Create(xmleENTITY, name));
    end;
  end;

  procedure Parse(elem: TXMLElement);
  begin
    while true do
    begin
      try

        c := GetChar;
      except
        FlushText(elem);
        break;
      end;
      case c of
      '<':
        begin
          FlushText(elem);
          if ParseTag(elem) then
            exit;
        end;
      '&':
        begin
          FlushText(elem);
          ParseEntity(elem);
        end;
      else
        begin
          text := text + c;
        end;
      end;
    end;
  end;

begin
  input := TUngetStream.Create(stream);
  Parse(self);
  input.Free;
end;


end.
