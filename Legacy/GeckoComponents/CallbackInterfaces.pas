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
unit CallbackInterfaces;

interface

uses
  nsXPCOM, nsTypes;

type
  IGeckoCreateWindowTarget = interface
  ['{934D4785-B78A-43D0-ABAD-1CC71AC06E24}']
    function GetWebBrowserChrome: nsIWebBrowserChrome;
    function DoCreateChromeWindow(chromeFlags: Longword): nsIWebBrowserChrome;
  end;

procedure AddCreateWindowTarget(target: IGeckoCreateWindowTarget);
procedure RemoveCreateWindowTarget(target: IGeckoCreateWindowTarget);
function InitWindowCreator: Boolean;

implementation

uses
  Classes, SysUtils, nsError, nsXPCOMGlue, GeckoChromeWindow;

type
  TWindowCreator = class(TInterfacedObject,
                         nsIWindowCreator)
    function CreateChromeWindow(parent: nsIWebBrowserChrome;
                                chromeFlags: PRUint32):
                                nsIWebBrowserChrome; safecall;
    function SafeCallException(Obj: TObject; Addr: Pointer): HResult; override;
  end;

var
  sTargets: TInterfaceList;
  sTargetInitialized: Boolean = False;

function GetTargetList: TInterfaceList;
begin
  Result := sTargets;
  if not Assigned(Result) and not sTargetInitialized then
  try
    sTargets := TInterfaceList.Create;
    Result := sTargets;
  except
    Result := nil;
  end;
end;

procedure AddCreateWindowTarget(target: IGeckoCreateWindowTarget);
var
  list: TInterfaceList;
begin
  list := GetTargetList;
  if not Assigned(list) then Exit;
  list.Add(target);
end;

procedure RemoveCreateWindowTarget(target: IGeckoCreateWindowTarget);
var
  list: TInterfaceList;
begin
  list := GetTargetList;
  if not Assigned(list) then Exit;
  list.Remove(target);
end;

function FindTarget(chrome: nsIWebBrowserChrome): IGeckoCreateWindowTarget;
var
  list: TInterfaceList;
  target: IGeckoCreateWindowTarget;
  i, cnt: Integer;
begin
  Result := nil;
  list := GetTargetList;
  if not Assigned(list) then Exit;
  cnt := list.Count;
  for i:=0 to cnt-1 do
  begin
    Supports(list.Items[i], IGeckoCreateWindowTarget, target);
    if Assigned(target) and (target.GetWebBrowserChrome=chrome) then
    begin
      Result := target;
      Exit;
    end;
  end;
end;

var
  sWindowCreatorInitialized: Boolean = False;
  sWindowCreator: TWindowCreator = nil;

function InitWindowCreator: Boolean;
const
  NS_WINDOWWATCHER_CONTRACTID = '@mozilla.org/embedcomp/window-watcher;1';
var
  creator: TWindowCreator;
  wwatch: nsIWindowWatcher;
begin
  try
    Result := False;
    if not sWindowCreatorInitialized then
    begin
      sWindowCreatorInitialized := True;
      creator := TWindowCreator.Create;
      sWindowCreator := creator;
    end;
    if not Assigned(sWindowCreator) then Exit;

    NS_GetService(NS_WINDOWWATCHER_CONTRACTID, nsIWindowWatcher, wwatch);

    wwatch.SetWindowCreator(sWindowCreator);

    Result := True;
  except
    Result := False;
  end;
end;

function TWindowCreator.CreateChromeWindow(parent: nsIWebBrowserChrome;
                                           chromeFlags: PRUint32):
                                           nsIWebBrowserChrome;
var
  target: IGeckoCreateWindowTarget;
  chrome: TGeckoChromeForm;
begin
  if (chromeFlags and CHROME_OPENAS_CHROME)<>0 then
  begin
    chrome := TGeckoChromeForm.CreateWithChromeFlags(nil, chromeFlags);
    try
      target := IGeckoCreateWindowTarget(chrome);
      Result := target.GetWebBrowserChrome;
    except
      chrome.Close;
      raise;
    end;
  end else
  begin
    target := FindTarget(parent);
    if Assigned(target) then
      Result := target.DoCreateChromeWindow(chromeFlags);
    if not Assigned(Result) then
      raise EGeckoError.Create('新しいブラウザを開くことが出来ません。');
  end;
end;

function TWindowCreator.SafeCallException(Obj: TObject; Addr: Pointer): HResult;
begin
  Result := HRESULT(NS_ERROR_FAILURE);
end;

initialization

finalization
  if Assigned(sTargets) then
    sTargets.Free;

end.
