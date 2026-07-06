codeunit 50104 "Credit Memo Codeunit"
{
    procedure CreditMemoFunction()
    var
        FileName: Text;
        InS: InStream;
        LineText: Text;
        RecCreditMemo: Record "Credit Memo History";
        Columns: List of [Text];
        IsFirstLine: Boolean;
        Value: Text;
    begin
        UploadIntoStream(
            'Select CSV File',
            '',
            '',
            FileName,
            InS);

        IsFirstLine := true;

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
            if Columns.Count <> 9 then
                Error(
                    'Expected 9 columns but found %1. Line: %2',
                    Columns.Count,
                    LineText);

            RecCreditMemo.Init();

            Columns.Get(1, Value);
            RecCreditMemo."Customer No" := Value;

            Columns.Get(2, Value);
            RecCreditMemo."Customer Name" := Value;

            Columns.Get(3, Value);
            Evaluate(RecCreditMemo."Posting Date", Value);

            Columns.Get(4, Value);
            Evaluate(RecCreditMemo."Documemt Type", Value);

            Columns.Get(5, Value);
            RecCreditMemo."Document No" := Value;

            Columns.Get(6, Value);
            Evaluate(RecCreditMemo."Amount", Value);

            Columns.Get(7, Value);
            Evaluate(RecCreditMemo."Remaining Amount", Value);

            Columns.Get(8, Value);
            RecCreditMemo."Applied Invoice No" := Value;

            Columns.Get(9, Value);
            Evaluate(RecCreditMemo."Applied Amount", Value);

            RecCreditMemo.Insert(true);
        end;

        Message('Import Completed Successfully');
    end;
}