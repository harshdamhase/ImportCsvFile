codeunit 50101 "Import Customer Management"
{
    procedure ImportCustomerLedgerHistory()
    var
        FileName: Text;
        InS: InStream;
        LineText: Text;
        CustLedgHistory: Record "Customer Ledger History";
        Columns: List of [Text];
        Value: Text;
        IsFirstLine: Boolean;
        EntryNo: Integer;
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

            // Skip Header Row
            if IsFirstLine then begin
                IsFirstLine := false;
                continue;
            end;

            Columns := LineText.Split(',');

            if Columns.Count < 8 then
                Error(
                    'Expected at least 8 columns but found %1 in line: %2',
                    Columns.Count,
                    LineText);

            CustLedgHistory.Init();

            // Entry No
            Columns.Get(1, Value);
            Evaluate(EntryNo, Value);

            if CustLedgHistory.Get(EntryNo) then
                Error('Entry No %1 already exists.', EntryNo);

            CustLedgHistory."Entry No" := EntryNo;

            // Customer No
            Columns.Get(2, Value);
            CustLedgHistory."Customer No" :=
                CopyStr(Value, 1, MaxStrLen(CustLedgHistory."Customer No"));

            // Customer Name
            Columns.Get(3, Value);
            CustLedgHistory."Customer Name" :=
                CopyStr(Value, 1, MaxStrLen(CustLedgHistory."Customer Name"));

            // Document Date
            Columns.Get(4, Value);
            Evaluate(CustLedgHistory."Document Date", Value);

            // Due Date
            Columns.Get(5, Value);
            Evaluate(CustLedgHistory."Due Date", Value);

            // Invoice No
            Columns.Get(6, Value);
            CustLedgHistory."Invoice No" :=
                CopyStr(Value, 1, MaxStrLen(CustLedgHistory."Invoice No"));

            // Originating Amount
            Columns.Get(7, Value);
            Evaluate(CustLedgHistory."Originating Amount", Value);

            // Current Amount
            Columns.Get(8, Value);
            Evaluate(CustLedgHistory."Current Amount", Value);

            // Status (if CSV contains 9th column)
            if Columns.Count >= 9 then begin
                Columns.Get(9, Value);
                // CustLedgHistory.Status := Value;
            end;

            CustLedgHistory.Insert(true);
        end;

        Message('Customer Ledger History imported successfully.');
    end;
}