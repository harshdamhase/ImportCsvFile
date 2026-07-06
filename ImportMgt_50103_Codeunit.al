codeunit 50103 "Import Vendor Ledger History"
{
    procedure ImportVendorLedgerHistory()
    var
        FileName: Text;
        InS: InStream;
        VendorLedgerHistory: Record "Vendor Ledger History";
        LineText: Text;
        Coloums: List of [Text];
        IsFirstLine: Boolean;
        EntryNo: Integer;
        Value: Text;
    begin
        IsFirstLine := true;

        UploadIntoStream(
            'Select CSV File',
            '',
            '',
            FileName,
            InS);

        while not InS.EOS do begin
            InS.ReadText(LineText);

            if LineText = '' then
                continue;

            // Skip Header
            if IsFirstLine then begin
                IsFirstLine := false;
                continue;
            end;

            Coloums := LineText.Split(',');

            if Coloums.Count <> 9 then
                Error(
                    'Expected 9 columns but found %1. Line: %2',
                    Coloums.Count,
                    LineText);

            // Entry No
            Coloums.Get(1, Value);
            Evaluate(EntryNo, Value);

            if VendorLedgerHistory.Get(EntryNo) then
                Error('Entry No %1 already exists.', EntryNo);

            VendorLedgerHistory.Init();
            VendorLedgerHistory."Entry No" := EntryNo;

            // Vendor No
            Coloums.Get(2, Value);
            VendorLedgerHistory."Vendor No" :=
                CopyStr(Value, 1, MaxStrLen(VendorLedgerHistory."Vendor No"));

            // Vendor Name
            Coloums.Get(3, Value);
            VendorLedgerHistory."Vendor Name" :=
                CopyStr(Value, 1, MaxStrLen(VendorLedgerHistory."Vendor Name"));

            // Posting Date
            Coloums.Get(4, Value);
            Evaluate(VendorLedgerHistory."Posting Date", Value);

            // Due Date
            Coloums.Get(5, Value);
            Evaluate(VendorLedgerHistory."Due Date", Value);

            // Document No
            Coloums.Get(6, Value);
            VendorLedgerHistory."Document No" :=
                CopyStr(Value, 1, MaxStrLen(VendorLedgerHistory."Document No"));

            // Document Type
            Coloums.Get(7, Value);
            Evaluate(VendorLedgerHistory."Document Type", Value);

            // Total Amount
            Coloums.Get(8, Value);
            Evaluate(VendorLedgerHistory."Total Amount", Value);

            // Remaining Amount
            Coloums.Get(9, Value);
            Evaluate(VendorLedgerHistory."Remaining Amount", Value);

            VendorLedgerHistory.Insert(true);
        end;

        Message('Vendor Ledger History Imported Successfully.');
    end;
}