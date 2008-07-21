unit GeckoStringNG;

interface


{type
  TGeckoString = class
  private
    FString:String;
  public
    class operator Add(a, b: TGeckoString): TGeckoString;
    class operator Implicit(Value : String) : TGeckoString;
    class operator Implicit(Value : WideString) : TGeckoString;
    class operator Implicit(Value : TGeckoString) : WideString;
  end;  }
//type


implementation

   {TMyClass = class
     class operator Add(a, b: TMyClass): TMyClass;      // TMyClass Œ^‚Ì 2 ‚Â‚ÌƒIƒyƒ‰ƒ“ƒh‚Ì‰ÁZ
     class operator Subtract(a, b: TMyClass): TMyclass; // TMyClass Œ^‚ÌœZ
     class operator Implicit(a: Integer): TMyClass;     // Integer ‚©‚ç TMyClass Œ^‚Ö‚ÌˆÃ–Ù‚Ì•ÏŠ·
     class operator Implicit(a: TMyClass): Integer;     // TMyClass Œ^‚©‚ç Integer ‚Ö‚ÌˆÃ–Ù‚Ì•ÏŠ·
     class operator Explicit(a: Double): TMyClass;      // Double ‚©‚ç TMyClass ‚Ö‚Ì–¾¦“I•ÏŠ·
   end;}

// Add ‚ÌÀ‘•‚Ì—á
{
class operator TMyClass.Add(a, b: TMyClass): TMyClass;
begin
   // ...
end;}
  {
var
x, y, b: TMyClass;
begin
   x := 12;      // Integer ‚©‚ç‚ÌˆÃ–Ù‚Ì•ÏŠ·
   y := x + x;   // TMyClass.Add(a, b: TMyClass) ‚ÌŒÄ‚Ño‚µFTMyClass
   b := b + 100; // TMyClass.Add(b, TMyClass.Implicit(100)) ‚ÌŒÄ‚Ño‚µ
end;}



end.
