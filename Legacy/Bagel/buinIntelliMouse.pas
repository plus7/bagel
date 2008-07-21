unit buinIntelliMouse;
 
interface
 
uses
  Windows, Messages, SysUtils, Variants, Classes,Controls;
 
const
 WM_XBUTTONDOWN  = $020B;
 WM_XBUTTONUP    = $020C;
 WM_XBUTTONDBLCLK= $020D;
 MK_XBUTTON1 = $0001;
 MK_XBUTTON2 = $0002;
 {

Windows 2000/XP： 1番目の X ボタンが押されています。
0x0040 (MK_XBUTTON2)

Windows 2000/XP： 2番目の X ボタンが押されています。 }
implementation
 
end.
