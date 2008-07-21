  nsWriteSegmentFun = function (aInStream: nsIInputStream; 
                                aClosure: Pointer;
                                const aFromSegment: Pointer;
                                aToOffset: PRUint32;
                                aCount: PRUint32;
                                out aWriteCount: PRUint32): nsresult; stdcall;

