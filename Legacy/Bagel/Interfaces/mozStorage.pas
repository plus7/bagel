unit mozStorage;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsArray;

const
  MOZISTORAGEAGGREGATEFUNCTION_IID: TGUID = '{763217b7-3123-11da-918d-000347412e16}';

  MOZISTORAGECONNECTION_IID: TGUID = '{e42f0655-cdc3-47c6-824a-cdb88c731cb9}';
  MOZISTORAGECONNECTION_TRANSACTION_DEFERRED = 0;
  MOZISTORAGECONNECTION_TRANSACTION_IMMEDIATE = 1;
  MOZISTORAGECONNECTION_TRANSACTION_EXCLUSIVE = 2;

  MOZISTORAGEDATASET_IID: TGUID = '{57826606-3c8a-4243-9f2f-cb3fe6e91148}';

  MOZISTORAGEFUNCTION_IID: TGUID = '{9ff02465-21cb-49f3-b975-7d5b38ceec73}';

  MOZISTORAGEPROGRESSHANDLER_IID: TGUID = '{a3a6fcd4-bf89-4208-a837-bf2a73afd30c}';

  MOZISTORAGESERVICE_IID: TGUID = '{a4a0cad9-e0da-4379-bee4-2feef3dddc7e}';

  MOZISTORAGEVALUEARRAY_IID: TGUID = '{07b5b93e-113c-4150-863c-d247b003a55d}';
  MOZISTORAGEVALUEARRAY_VALUE_TYPE_NULL = 0;
  MOZISTORAGEVALUEARRAY_VALUE_TYPE_INTEGER = 1;
  MOZISTORAGEVALUEARRAY_VALUE_TYPE_FLOAT = 2;
  MOZISTORAGEVALUEARRAY_VALUE_TYPE_TEXT = 3;
  MOZISTORAGEVALUEARRAY_VALUE_TYPE_BLOB = 4;

  MOZISTORAGESTATEMENT_IID: TGUID = '{42fad13e-c67d-4b2c-bd61-2c5b17186772}';
  MOZISTORAGESTATEMENT_MOZ_STORAGE_STATEMENT_INVALID = 0;
  MOZISTORAGESTATEMENT_MOZ_STORAGE_STATEMENT_READY = 1;
  MOZISTORAGESTATEMENT_MOZ_STORAGE_STATEMENT_EXECUTING = 2;

  MOZISTORAGESTATEMENTROW_IID: TGUID = '{02eeaf95-c3db-4182-9340-222c29f68f02}';

  MOZISTORAGESTATEMENTPARAMS_IID: TGUID = '{e65fe6e2-2643-463c-97e2-27665efe2386}';

  MOZISTORAGESTATEMENTWRAPPER_IID: TGUID = '{eee6f7c9-5586-4eaf-b35c-dca987c4ffd1}';

type
  mozIStorageAggregateFunction = interface;
  mozIStorageConnection = interface;
  mozIStorageDataSet = interface;
  mozIStorageFunction = interface;
  mozIStorageProgressHandler = interface;
  mozIStorageService = interface;
  mozIStorageValueArray = interface;
  mozIStorageStatement = interface;
  mozIStorageStatementRow = interface;
  mozIStorageStatementParams = interface;
  mozIStorageStatementWrapper = interface;
  mozIStorageAggregateFunction = interface(nsISupports)
  ['{763217b7-3123-11da-918d-000347412e16}']
    procedure OnStep(aFunctionArguments: mozIStorageValueArray); safecall;
    function OnFinal(): nsIVariant; safecall;
  end;

  mozIStorageConnection = interface(nsISupports)
  ['{e42f0655-cdc3-47c6-824a-cdb88c731cb9}']
    procedure Close(); safecall;
    function GetConnectionReady(): PRBool; safecall;
    property ConnectionReady: PRBool read GetConnectionReady;
    function GetDatabaseFile(): nsIFile; safecall;
    property DatabaseFile: nsIFile read GetDatabaseFile;
    function GetLastInsertRowID(): PRInt64; safecall;
    property LastInsertRowID: PRInt64 read GetLastInsertRowID;
    function GetLastError(): PRInt32; safecall;
    property LastError: PRInt32 read GetLastError;
    procedure GetLastErrorString(aLastErrorString: nsACString); safecall;
    function GetSchemaVersion(): PRInt32; safecall;
    procedure SetSchemaVersion(aSchemaVersion: PRInt32); safecall;
    property SchemaVersion: PRInt32 read GetSchemaVersion write SetSchemaVersion;
    function CreateStatement(const aSQLStatement: nsACString): mozIStorageStatement; safecall;
    procedure ExecuteSimpleSQL(const aSQLStatement: nsACString); safecall;
    function TableExists(const aTableName: nsACString): PRBool; safecall;
    function IndexExists(const aIndexName: nsACString): PRBool; safecall;
    function GetTransactionInProgress(): PRBool; safecall;
    property TransactionInProgress: PRBool read GetTransactionInProgress;
    procedure BeginTransaction(); safecall;
    procedure BeginTransactionAs(transactionType: PRInt32); safecall;
    procedure CommitTransaction(); safecall;
    procedure RollbackTransaction(); safecall;
    procedure CreateTable(const aTableName: PAnsiChar; const aTableSchema: PAnsiChar); safecall;
    procedure CreateFunction(const aFunctionName: nsACString; aNumArguments: PRInt32; aFunction: mozIStorageFunction); safecall;
    procedure CreateAggregateFunction(const aFunctionName: nsACString; aNumArguments: PRInt32; aFunction: mozIStorageAggregateFunction); safecall;
    procedure RemoveFunction(const aFunctionName: nsACString); safecall;
    function SetProgressHandler(aGranularity: PRInt32; aHandler: mozIStorageProgressHandler): mozIStorageProgressHandler; safecall;
    function RemoveProgressHandler(): mozIStorageProgressHandler; safecall;
    function BackupDB(const aFileName: nsAString; aParentDirectory: nsIFile): nsIFile; safecall;
    procedure Preload(); safecall;
  end;

  mozIStorageDataSet = interface(nsISupports)
  ['{57826606-3c8a-4243-9f2f-cb3fe6e91148}']
    function GetDataRows(): nsIArray; safecall;
    property DataRows: nsIArray read GetDataRows;
    function GetRowEnumerator(): nsISimpleEnumerator; safecall;
  end;

  mozIStorageFunction = interface(nsISupports)
  ['{9ff02465-21cb-49f3-b975-7d5b38ceec73}']
    function OnFunctionCall(aFunctionArguments: mozIStorageValueArray): nsIVariant; safecall;
  end;

  mozIStorageProgressHandler = interface(nsISupports)
  ['{a3a6fcd4-bf89-4208-a837-bf2a73afd30c}']
    function OnProgress(aConnection: mozIStorageConnection): PRBool; safecall;
  end;

  mozIStorageService = interface(nsISupports)
  ['{a4a0cad9-e0da-4379-bee4-2feef3dddc7e}']
    function OpenSpecialDatabase(const aStorageKey: PAnsiChar): mozIStorageConnection; safecall;
    function OpenDatabase(aDatabaseFile: nsIFile): mozIStorageConnection; safecall;
  end;

  mozIStorageValueArray = interface(nsISupports)
  ['{07b5b93e-113c-4150-863c-d247b003a55d}']
    function GetNumEntries(): PRUint32; safecall;
    property NumEntries: PRUint32 read GetNumEntries;
    function GetTypeOfIndex(aIndex: PRUint32): PRInt32; safecall;
    function GetInt32(aIndex: PRUint32): PRInt32; safecall;
    function GetInt64(aIndex: PRUint32): PRInt64; safecall;
    function GetDouble(aIndex: PRUint32): Double; safecall;
    procedure GetUTF8String(aIndex: PRUint32; _retval: nsACString); safecall;
    procedure GetString(aIndex: PRUint32; _retval: nsAString); safecall;
    procedure GetBlob(aIndex: PRUint32; out aDataSize: PRUint32; out aData_array); safecall;
    function GetIsNull(aIndex: PRUint32): PRBool; safecall;
    procedure GetSharedUTF8String(aIndex: PRUint32; out aLength: PRUint32; out aResult: PAnsiChar); safecall;
    procedure GetSharedString(aIndex: PRUint32; out aLength: PRUint32; out aResult: PWideChar); safecall;
    procedure GetSharedBlob(aIndex: PRUint32; out aLength: PRUint32; out aResult: PPRUint8); safecall;
  end;

  mozIStorageStatement = interface(mozIStorageValueArray)
  ['{42fad13e-c67d-4b2c-bd61-2c5b17186772}']
    procedure Initialize(aDBConnection: mozIStorageConnection; const aSQLStatement: nsACString); safecall;
    procedure Finalize(); safecall;
    function Clone(): mozIStorageStatement; safecall;
    function GetParameterCount(): PRUint32; safecall;
    property ParameterCount: PRUint32 read GetParameterCount;
    procedure GetParameterName(aParamIndex: PRUint32; _retval: nsACString); safecall;
    function GetParameterIndex(const aName: nsACString): PRUint32; safecall;
    function GetColumnCount(): PRUint32; safecall;
    property ColumnCount: PRUint32 read GetColumnCount;
    procedure GetColumnName(aColumnIndex: PRUint32; _retval: nsACString); safecall;
    function GetColumnIndex(const aName: nsACString): PRUint32; safecall;
    procedure GetColumnDecltype(aParamIndex: PRUint32; _retval: nsACString); safecall;
    procedure Reset(); safecall;
    procedure BindUTF8StringParameter(aParamIndex: PRUint32; const aValue: nsACString); safecall;
    procedure BindStringParameter(aParamIndex: PRUint32; const aValue: nsAString); safecall;
    procedure BindDoubleParameter(aParamIndex: PRUint32; aValue: Double); safecall;
    procedure BindInt32Parameter(aParamIndex: PRUint32; aValue: PRInt32); safecall;
    procedure BindInt64Parameter(aParamIndex: PRUint32; aValue: PRInt64); safecall;
    procedure BindNullParameter(aParamIndex: PRUint32); safecall;
    procedure BindBlobParameter(aParamIndex: PRUint32; const aValue_array; aValueSize: PRUint32); safecall;
    procedure Execute(); safecall;
    function ExecuteStep(): PRBool; safecall;
    function GetState(): PRInt32; safecall;
    property State: PRInt32 read GetState;
    function GetNativeStatementPointer(): Pointer {Pstruct sqlite3_stmt}; stdcall;
    procedure EscapeStringForLIKE(const aValue: nsAString; aEscapeChar: WideChar; _retval: nsAString); safecall;
  end;

  mozIStorageStatementRow = interface(nsISupports)
  ['{02eeaf95-c3db-4182-9340-222c29f68f02}']
  end;

  mozIStorageStatementParams = interface(nsISupports)
  ['{e65fe6e2-2643-463c-97e2-27665efe2386}']
  end;

  mozIStorageStatementWrapper = interface(nsISupports)
  ['{eee6f7c9-5586-4eaf-b35c-dca987c4ffd1}']
    procedure Initialize(aStatement: mozIStorageStatement); safecall;
    function GetStatement(): mozIStorageStatement; safecall;
    property Statement: mozIStorageStatement read GetStatement;
    procedure Reset(); safecall;
    function Step(): PRBool; safecall;
    procedure Execute(); safecall;
    function GetRow(): mozIStorageStatementRow; safecall;
    property Row: mozIStorageStatementRow read GetRow;
    function GetParams(): mozIStorageStatementParams; safecall;
    property Params: mozIStorageStatementParams read GetParams;
  end;

implementation

end.
