unit nsDownload;

interface

uses
  nsTypes,nsXPCOM,nsGeckoStrings,nsDownload;
  
type
	TDownloadProgressListener = class(TInterfacedObject, nsIDownloadProgressListener)
	    function GetDocument(): nsIDOMDocument; safecall;
	    procedure SetDocument(aDocument: nsIDOMDocument); safecall;
	    property Document: nsIDOMDocument read GetDocument write SetDocument;
	    procedure OnDownloadStateChange(aState: PRInt16; aDownload: nsIDownload); safecall;
	    procedure OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64; aDownload: nsIDownload); safecall;
		procedure OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult; aDownload: nsIDownload); safecall;
	    procedure OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar; aDownload: nsIDownload); safecall;
	    procedure OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aLocation: nsIURI; aDownload: nsIDownload); safecall;
	    procedure OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aState: PRUint32; aDownload: nsIDownload); safecall;
	end;

	TDownloadManagerUI = class(TInterfacedObject, nsIDownloadManagerUI)
	    procedure Show(aWindowContext: nsIInterfaceRequestor; aID: PRUint32); safecall;
	    function GetVisible(): PRBool; safecall;
	    property Visible: PRBool read GetVisible;
	    procedure GetAttention(); safecall;
	private
		FOnShow: TNotify;
	public
		property OnGetVisible:THoge read FOnGetVisible write FOnGetVisible;
		property OnShow:TNotify read FOnShow write FOnShow;
	end;
	
	TDownloadManagerListView = class(TCustomListView)
	private
		FOnShow: TNotify;
		FFilter: String;
	published
	public
		constructor Create(AOwner:TComponent);
		destructor Destroy; override;
		property Filter: String read FFilter write SetFilter;
		property OnShow: TNotify read FOnShow write FOnShow;
	end;
	
implementation

procedure TDownloadProgressListener.OnDownloadStateChange(aState: PRInt16; aDownload: nsIDownload); safecall;
begin
  let state = aDownload.state;
    switch (state) {
      case nsIDM.DOWNLOAD_QUEUED:
        prependList(aDownload);
        break;
      case nsIDM.DOWNLOAD_FAILED:
      case nsIDM.DOWNLOAD_CANCELED:
      case nsIDM.DOWNLOAD_BLOCKED:
      case nsIDM.DOWNLOAD_DIRTY:
      case nsIDM.DOWNLOAD_FINISHED:
        downloadCompleted(aDownload);
        if (state == nsIDM.DOWNLOAD_FINISHED)
          autoRemoveAndClose(aDownload);
        break;
    }

    // autoRemoveAndClose could have already closed our window...
    try {
      let dl = getDownload(aDownload.id);

      // We should eventually know the referrer at some point
      let referrer = aDownload.referrer;
      if (referrer)
        dl.setAttribute("referrer", referrer.spec);

      // Update to the new state
      dl.setAttribute("state", state);
      updateStatus(dl);
      gDownloadViewController.onCommandUpdate();
    } catch (e) { }
end;

procedure TDownloadProgressListener.OnProgressChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aCurSelfProgress: PRInt64; aMaxSelfProgress: PRInt64; aCurTotalProgress: PRInt64; aMaxTotalProgress: PRInt64; aDownload: nsIDownload); safecall;
begin
	//Get the corresponding ListItem
	
    // Update this download's progressmeter
	 if (aDownload.percentComplete == -1) {
		download.setAttribute("progressmode", "undetermined");
	    } else {
		download.setAttribute("progressmode", "normal");
		download.setAttribute("progress", aDownload.percentComplete);
	    }
end;	

procedure TDownloadProgressListener.OnStateChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStateFlags: PRUint32; aStatus: nsresult; aDownload: nsIDownload); safecall;
begin
	//
end;

procedure TDownloadProgressListener.OnStatusChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aStatus: nsresult; const aMessage: PWideChar; aDownload: nsIDownload); safecall;
begin
	//
end;

procedure TDownloadProgressListener.OnLocationChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aLocation: nsIURI; aDownload: nsIDownload); safecall;
begin
	//
end;

procedure TDownloadProgressListener.OnSecurityChange(aWebProgress: nsIWebProgress; aRequest: nsIRequest; aState: PRUint32; aDownload: nsIDownload); safecall;
begin
	//
end;


end.