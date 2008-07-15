program Bagel;

{%TogetherDiagram 'ModelSupport_Bagel\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UTabList\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\Bagel\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UPageInfo\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\Version\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UUngetStream\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UBagel\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\Unique\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UXMLSub\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\Unique\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\UXMLSub\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\Version\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\UUngetStream\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\UBagel\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\UPageInfo\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\UTabList\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\Bagel\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Bagel\AboutBagel\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BagelConst\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\USearchEdit\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\StatusWidget\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UCookieMan\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UImportNetscape\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UExtAppEditor\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UBookmark\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UBagelPref\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\bmRegExp\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UPassman\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\CommandAction\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\buinIntelliMouse\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\FileChangeWatcher\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UPageSetup\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UBagelMemo\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UCookieP3P\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BookmarkListView\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\HistoryTreeView\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\splitjoin\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UBookmarkEditor\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BagelToolbar\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BookmarkTreeView\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\SearchListItem\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UxThemeRT\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\PropertiesForm\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BufStream\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BookmarkUnit\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UGlobal\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\AutoExec\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\TKMigemo\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BrwsFldr\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BagelPref\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\ScriptAction\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\GeckoStringNG\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\ActnGen\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BagelBrowser\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UExtGoEdit\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\BagelActnMan\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\DownloadListView\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\TabbedToolBar\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UWebPanelEdit\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\Mutex\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\UMenuEdit\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Bagel\AboutBagel\default.txvpck'}

uses
  Forms,
  UBagel in 'UBagel.pas' {BagelMainForm},
  Version in 'Version.pas',
  UXMLSub in 'UXMLSub.pas',
  UUngetStream in 'UUngetStream.pas',
  UTabList in 'UTabList.pas',
  UPageInfo in 'UPageInfo.pas' {frmPageInfo},
  unique in 'unique.pas',
  AboutBagel in 'AboutBagel.pas' {AboutBagelForm},
  BagelConst in 'BagelConst.pas',
  UBagelMemo in 'UBagelMemo.pas',
  splitjoin in 'splitjoin.pas',
  buinIntelliMouse in 'buinIntelliMouse.pas',
  BufStream in 'BufStream.pas',
  USearchEdit in 'USearchEdit.pas' {frmSearchEdit},
  UExtGoEdit in 'UExtGoEdit.pas' {frmExtGoEditor},
  UBookmark in 'UBookmark.pas',
  UImportNetscape in 'UImportNetscape.pas' {frmImportNetscape},
  UGlobal in 'UGlobal.pas',
  CommandAction in 'CommandAction.pas',
  Mutex in 'Mutex.pas',
  UCookieP3P in 'UCookieP3P.pas' {frmCookieP3PCustom},
  BagelBrowser in 'BagelBrowser.pas',
  UPageSetup in 'UPageSetup.pas' {frmPageSetup},
  UWebPanelEdit in 'UWebPanelEdit.pas' {frmWebPanelEditor},
  TabbedToolBar in 'TabbedToolBar.pas',
  ScriptAction in 'ScriptAction.pas',
  PropertiesForm in 'PropertiesForm.pas',
  UCookieMan in 'UCookieMan.pas',
  UPassman in 'UPassman.pas',
  TKMigemo in 'TKMigemo.pas',
  BookmarkUnit in 'BookmarkUnit.pas' {BookmarkForm},
  BookmarkListView in 'BookmarkListView.pas',
  BookmarkTreeView in 'BookmarkTreeView.pas',
  UBookmarkEditor in 'UBookmarkEditor.pas' {frmBookmarkEditor},
  BagelPref in 'BagelPref.pas',
  UBagelPref in 'UBagelPref.pas' {BagelSettingForm},
  SearchListItem in 'SearchListItem.pas',
  BrwsFldr in 'BrwsFldr.pas',
  UExtAppEditor in 'UExtAppEditor.pas' {frmExtAppEditor},
  AutoExec in 'AutoExec.pas',
  FileChangeWatcher in 'FileChangeWatcher.pas',
  HistoryTreeView in 'HistoryTreeView.pas',
  DownloadListView in 'DownloadListView.pas',
  UImportIE in 'UImportIE.pas' {frmImportIE},
  StatusWidget in 'StatusWidget.pas',
  BagelActnMan in 'BagelActnMan.pas',
  BagelToolbar in 'BagelToolbar.pas',
  GeckoStringNG in 'GeckoStringNG.pas',
  NkDropTarget in 'NkDropTarget.pas',
  UMenuEdit in 'UMenuEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBagelMainForm, BagelMainForm);
  Application.Run;
end.
