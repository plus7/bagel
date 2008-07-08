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
 * The Initial Developer of the Original Code is Takanori Ito.
 * Portions created by the Initial Developer are Copyright (C) 2003
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
unit BrowserSupports;

interface

uses
  nsConsts, nsGeckoStrings, nsTypes, nsXPCOM;

const
  GFXIFORMATS_IID: TGUID = '{96d086e6-1dd1-11b2-b6b2-b77b59390247}';
  GFXIFORMATS_RGB = 0;
  GFXIFORMATS_BGR = 1;
  GFXIFORMATS_RGB_A1 = 2;
  GFXIFORMATS_BGR_A1 = 3;
  GFXIFORMATS_RGB_A8 = 4;
  GFXIFORMATS_BGR_A8 = 5;
  GFXIFORMATS_RGBA = 6;
  GFXIFORMATS_BGRA = 7;

  GFXIIMAGEFRAME_IID: TGUID = '{51cc27a8-1dd2-11b2-a1aa-dad33ab193b4}';

  IMGICONTAINER_IID: TGUID = '{5e8405a4-1dd2-11b2-8385-bc8e3446cad3}';
  IMGICONTAINER_kNormalAnimMode = 0;
  IMGICONTAINER_kDontAnimMode = 1;
  IMGICONTAINER_kLoopOnceAnimMode = 2;

  IMGICONTAINEROBSERVER_IID: TGUID = '{153f1518-1dd2-11b2-b9cd-b16eb63e0471}';

  NS_IBASEWINDOW_IID: TGUID = '{046bc8a0-8015-11d3-af70-00a024ffc08c}';

  NS_ICONTEXTMENULISTENER2_IID: TGUID = '{7fb719b3-d804-4964-9596-77cf924ee314}';
  NS_ICONTEXTMENULISTENER2_CONTEXT_NONE = 0;
  NS_ICONTEXTMENULISTENER2_CONTEXT_LINK = 1;
  NS_ICONTEXTMENULISTENER2_CONTEXT_IMAGE = 2;
  NS_ICONTEXTMENULISTENER2_CONTEXT_DOCUMENT = 4;
  NS_ICONTEXTMENULISTENER2_CONTEXT_TEXT = 8;
  NS_ICONTEXTMENULISTENER2_CONTEXT_INPUT = 16;
  NS_ICONTEXTMENULISTENER2_CONTEXT_BACKGROUND_IMAGE = 32;

  NS_ICONTEXTMENUINFO_IID: TGUID = '{2f977d56-5485-11d4-87e2-0010a4e75ef2}';

  NS_IWEBNAVIGATION_IID: TGUID = '{f5d9e7b0-d930-11d3-b057-00a024ffc08c}';
  NS_IWEBNAVIGATION_LOAD_FLAGS_MASK = 65535;
  NS_IWEBNAVIGATION_LOAD_FLAGS_NONE = 0;
  NS_IWEBNAVIGATION_LOAD_FLAGS_IS_REFRESH = 16;
  NS_IWEBNAVIGATION_LOAD_FLAGS_IS_LINK = 32;
  NS_IWEBNAVIGATION_LOAD_FLAGS_BYPASS_HISTORY = 64;
  NS_IWEBNAVIGATION_LOAD_FLAGS_REPLACE_HISTORY = 128;
  NS_IWEBNAVIGATION_LOAD_FLAGS_BYPASS_CACHE = 256;
  NS_IWEBNAVIGATION_LOAD_FLAGS_BYPASS_PROXY = 512;
  NS_IWEBNAVIGATION_LOAD_FLAGS_CHARSET_CHANGE = 1024;
  NS_IWEBNAVIGATION_LOAD_FLAGS_STOP_CONTENT = 2048;
  NS_IWEBNAVIGATION_LOAD_FLAGS_FROM_EXTERNAL = 4096;
  NS_IWEBNAVIGATION_LOAD_FLAGS_ALLOW_THIRD_PARTY_FIXUP = 8192;
  NS_IWEBNAVIGATION_LOAD_FLAGS_FIRST_LOAD = 16384;
  NS_IWEBNAVIGATION_LOAD_FLAGS_ALLOW_POPUPS = 32768;
  NS_IWEBNAVIGATION_LOAD_FLAGS_BYPASS_CLASSIFIER = 65536;
  NS_IWEBNAVIGATION_STOP_NETWORK = 1;
  NS_IWEBNAVIGATION_STOP_CONTENT = 2;
  NS_IWEBNAVIGATION_STOP_ALL = 3;

type
  gfxIFormats = interface;
  gfxIImageFrame = interface;
  imgIContainer = interface;
  imgIContainerObserver = interface;
  nsIBaseWindow = interface;
  nsIContextMenuListener2 = interface;
  nsIContextMenuInfo = interface;
  nsIWebNavigation = interface;
(***
 * A color is a 32 bit unsigned integer with
 * four components: R, G, B and A.
 *
 * @var typedef PRUint32 gfx_color
 *)
  gfx_color = PRUint32;
(***
 * typedef that should be used for bit depths
 * @var typedef unsigned short gfx_depth
 *)
  gfx_depth = PRUint16;
(***
 * typedef that should be used for image formats
 * @var typedef long gfx_format
 * @see gfxIFormats
 *)
  gfx_format = PRInt32;
  nscoord = PRInt32;
  nativeWindow = Pointer;
  gfxIFormats = interface
  ['{96d086e6-1dd1-11b2-b6b2-b77b59390247}']
  end;

  gfxIImageFrame = interface(nsISupports)
  ['{51cc27a8-1dd2-11b2-a1aa-dad33ab193b4}']
    procedure Init(aX: nscoord; aY: nscoord; aWidth: nscoord; aHeight: nscoord; aFormat: gfx_format; aDepth: gfx_depth); safecall;
    function GetMutable(): PRBool; safecall;
    procedure SetMutable(aMutable: PRBool); safecall;
    property Mutable: PRBool read GetMutable write SetMutable;
    function GetX(): nscoord; safecall;
    property X: nscoord read GetX;
    function GetY(): nscoord; safecall;
    property Y: nscoord read GetY;
    function GetWidth(): nscoord; safecall;
    property Width: nscoord read GetWidth;
    function GetHeight(): nscoord; safecall;
    property Height: nscoord read GetHeight;
    procedure GetRect(rect: nsRect); safecall;
    function GetFormat(): gfx_format; safecall;
    property Format: gfx_format read GetFormat;
    function GetImageBytesPerRow(): PRUint32; safecall;
    property ImageBytesPerRow: PRUint32 read GetImageBytesPerRow;
    function GetImageDataLength(): PRUint32; safecall;
    property ImageDataLength: PRUint32 read GetImageDataLength;
    procedure GetImageData(out bits: PRUint8Array; out length: PRUint32); safecall;
    procedure SetImageData(data: PRUint8Array; length: PRUint32; offset: PRInt32); safecall;
    procedure LockImageData(); safecall;
    procedure UnlockImageData(); safecall;
    function GetAlphaBytesPerRow(): PRUint32; safecall;
    property AlphaBytesPerRow: PRUint32 read GetAlphaBytesPerRow;
    function GetAlphaDataLength(): PRUint32; safecall;
    property AlphaDataLength: PRUint32 read GetAlphaDataLength;
    procedure GetAlphaData(out bits: PRUint8Array; out length: PRUint32); safecall;
    procedure SetAlphaData(data: PRUint8Array; length: PRUint32; offset: PRInt32); safecall;
    procedure LockAlphaData(); safecall;
    procedure UnlockAlphaData(); safecall;
    procedure DrawTo(aDst: gfxIImageFrame; aDX: nscoord; aDY: nscoord; aDWidth: nscoord; aDHeight: nscoord); safecall;
    function GetTimeout(): PRInt32; safecall;
    procedure SetTimeout(aTimeout: PRInt32); safecall;
    property Timeout: PRInt32 read GetTimeout write SetTimeout;
    function GetFrameDisposalMethod(): PRInt32; safecall;
    procedure SetFrameDisposalMethod(aFrameDisposalMethod: PRInt32); safecall;
    property FrameDisposalMethod: PRInt32 read GetFrameDisposalMethod write SetFrameDisposalMethod;
    function GetBackgroundColor(): gfx_color; safecall;
    procedure SetBackgroundColor(aBackgroundColor: gfx_color); safecall;
    property BackgroundColor: gfx_color read GetBackgroundColor write SetBackgroundColor;
  end;

  imgIContainer = interface(nsISupports)
  ['{5e8405a4-1dd2-11b2-8385-bc8e3446cad3}']
    procedure Init(aWidth: nscoord; aHeight: nscoord; aObserver: imgIContainerObserver); safecall;
    function GetPreferredAlphaChannelFormat(): gfx_format; safecall;
    property PreferredAlphaChannelFormat: gfx_format read GetPreferredAlphaChannelFormat;
    function GetWidth(): nscoord; safecall;
    property Width: nscoord read GetWidth;
    function GetHeight(): nscoord; safecall;
    property Height: nscoord read GetHeight;
    function GetCurrentFrame(): gfxIImageFrame; safecall;
    property CurrentFrame: gfxIImageFrame read GetCurrentFrame;
    function GetNumFrames(): PRUint32; safecall;
    property NumFrames: PRUint32 read GetNumFrames;
    function GetAnimationMode(): PRUint16; safecall;
    procedure SetAnimationMode(aAnimationMode: PRUint16); safecall;
    property AnimationMode: PRUint16 read GetAnimationMode write SetAnimationMode;
    function GetFrameAt(index: PRUint32): gfxIImageFrame; safecall;
    procedure AppendFrame(item: gfxIImageFrame); safecall;
    procedure RemoveFrame(item: gfxIImageFrame); safecall;
    procedure EndFrameDecode(framenumber: PRUint32; timeout: PRUint32); safecall;
    procedure DecodingComplete(); safecall;
    procedure Clear(); safecall;
    procedure StartAnimation(); safecall;
    procedure StopAnimation(); safecall;
    procedure ResetAnimation(); safecall;
    function GetLoopCount(): PRInt32; safecall;
    procedure SetLoopCount(aLoopCount: PRInt32); safecall;
    property LoopCount: PRInt32 read GetLoopCount write SetLoopCount;
  end;

  imgIContainerObserver = interface(nsISupports)
  ['{153f1518-1dd2-11b2-b9cd-b16eb63e0471}']
    procedure FrameChanged(aContainer: imgIContainer; aFrame: gfxIImageFrame; const aDirtyRect: nsRect); safecall;
  end;

  nsIBaseWindow = interface(nsISupports)
  ['{046bc8a0-8015-11d3-af70-00a024ffc08c}']
    procedure InitWindow(parentNativeWindow: nativeWindow; parentWidget: nsIWidget; x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32); safecall;
    procedure Create(); safecall;
    procedure Destroy(); safecall;
    procedure SetPosition(x: PRInt32; y: PRInt32); safecall;
    procedure GetPosition(out x: PRInt32; out y: PRInt32); safecall;
    procedure SetSize(cx: PRInt32; cy: PRInt32; fRepaint: PRBool); safecall;
    procedure GetSize(out cx: PRInt32; out cy: PRInt32); safecall;
    procedure SetPositionAndSize(x: PRInt32; y: PRInt32; cx: PRInt32; cy: PRInt32; fRepaint: PRBool); safecall;
    procedure GetPositionAndSize(out x: PRInt32; out y: PRInt32; out cx: PRInt32; out cy: PRInt32); safecall;
    procedure Repaint(force: PRBool); safecall;
    function GetParentWidget(): nsIWidget; safecall;
    procedure SetParentWidget(aParentWidget: nsIWidget); safecall;
    property ParentWidget: nsIWidget read GetParentWidget write SetParentWidget;
    function GetParentNativeWindow(): nativeWindow; safecall;
    procedure SetParentNativeWindow(aParentNativeWindow: nativeWindow); safecall;
    property ParentNativeWindow: nativeWindow read GetParentNativeWindow write SetParentNativeWindow;
    function GetVisibility(): PRBool; safecall;
    procedure SetVisibility(aVisibility: PRBool); safecall;
    property Visibility: PRBool read GetVisibility write SetVisibility;
    function GetEnabled(): PRBool; safecall;
    procedure SetEnabled(aEnabled: PRBool); safecall;
    property Enabled: PRBool read GetEnabled write SetEnabled;
    function GetBlurSuppression(): PRBool; safecall;
    procedure SetBlurSuppression(aBlurSuppression: PRBool); safecall;
    property BlurSuppression: PRBool read GetBlurSuppression write SetBlurSuppression;
    function GetMainWidget(): nsIWidget; safecall;
    property MainWidget: nsIWidget read GetMainWidget;
    procedure SetFocus(); safecall;
    function GetTitle(): PWideChar; safecall;
    procedure SetTitle(const aTitle: PWideChar); safecall;
    property Title: PWideChar read GetTitle write SetTitle;
  end;

  nsIContextMenuListener2 = interface(nsISupports)
  ['{7fb719b3-d804-4964-9596-77cf924ee314}']
    procedure OnShowContextMenu(aContextFlags: PRUint32; aUtils: nsIContextMenuInfo); safecall;
  end;

  nsIContextMenuInfo = interface(nsISupports)
  ['{2f977d56-5485-11d4-87e2-0010a4e75ef2}']
    function GetMouseEvent(): nsIDOMEvent; safecall;
    property MouseEvent: nsIDOMEvent read GetMouseEvent;
    function GetTargetNode(): nsIDOMNode; safecall;
    property TargetNode: nsIDOMNode read GetTargetNode;
    procedure GetAssociatedLink(aAssociatedLink: nsAString); safecall;
    function GetImageContainer(): imgIContainer; safecall;
    property ImageContainer: imgIContainer read GetImageContainer;
    function GetImageSrc(): nsIURI; safecall;
    property ImageSrc: nsIURI read GetImageSrc;
    function GetBackgroundImageContainer(): imgIContainer; safecall;
    property BackgroundImageContainer: imgIContainer read GetBackgroundImageContainer;
    function GetBackgroundImageSrc(): nsIURI; safecall;
    property BackgroundImageSrc: nsIURI read GetBackgroundImageSrc;
  end;

  nsIWebNavigation = interface(nsISupports)
  ['{f5d9e7b0-d930-11d3-b057-00a024ffc08c}']
    function GetCanGoBack(): PRBool; safecall;
    property CanGoBack: PRBool read GetCanGoBack;
    function GetCanGoForward(): PRBool; safecall;
    property CanGoForward: PRBool read GetCanGoForward;
    procedure GoBack(); safecall;
    procedure GoForward(); safecall;
    procedure GotoIndex(index: PRInt32); safecall;
    procedure LoadURI(const aURI: PWideChar; aLoadFlags: PRUint32; aReferrer: nsIURI; aPostData: nsIInputStream; aHeaders: nsIInputStream); safecall;
    procedure Reload(aReloadFlags: PRUint32); safecall;
    procedure Stop(aStopFlags: PRUint32); safecall;
    function GetDocument(): nsIDOMDocument; safecall;
    property Document: nsIDOMDocument read GetDocument;
    function GetCurrentURI(): nsIURI; safecall;
    property CurrentURI: nsIURI read GetCurrentURI;
    function GetReferringURI(): nsIURI; safecall;
    property ReferringURI: nsIURI read GetReferringURI;
    function GetSessionHistory(): nsISHistory; safecall;
    procedure SetSessionHistory(aSessionHistory: nsISHistory); safecall;
    property SessionHistory: nsISHistory read GetSessionHistory write SetSessionHistory;
  end;

implementation

end.
