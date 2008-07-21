unit nsLocale;

interface

uses nsTypes,nsXPCOM,nsGeckoStrings;

const
  NS_ILOCALE_IID: TGUID = '{21035ee0-4556-11d3-91cd-00105aa3f7dc}';

  NS_ILOCALESERVICE_IID: TGUID = '{c2edc848-4219-4440-abbf-98119882c83f}';

type
  nsILocale = interface;
  nsILocaleService = interface;
  nsILocale = interface(nsISupports)
  ['{21035ee0-4556-11d3-91cd-00105aa3f7dc}']
    procedure GetCategory(const category: nsAString; _retval: nsAString); safecall;
  end;

  nsILocaleService = interface(nsISupports)
  ['{c2edc848-4219-4440-abbf-98119882c83f}']
    function NewLocale(const aLocale: nsAString): nsILocale; safecall;
    function GetSystemLocale(): nsILocale; safecall;
    function GetApplicationLocale(): nsILocale; safecall;
    function GetLocaleFromAcceptLanguage(const acceptLanguage: PAnsiChar): nsILocale; safecall;
    procedure GetLocaleComponentForUserAgent(_retval: nsAString); safecall;
  end;

implementation

end.
