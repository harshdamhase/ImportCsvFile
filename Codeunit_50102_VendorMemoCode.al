codeunit 50102 "Vendor Memo Code"
{
    procedure VendorMemoMgt()
    var
        FileName: Text;
        InS: InStream;
        VendorMemo: Record "Vendor Memo History";
        LineText: Text;
        Columns: List of [Text];
        Value: Text;
        IsHeader: Boolean;
    begin
        IsHeader := true;


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


            if IsHeader then begin
                IsHeader := false;
                continue;
            end;

            Columns := LineText.Split(',');

            VendorMemo.Init();

            Columns.Get(1, Value);
            Evaluate(VendorMemo."Entry NO", Value);

            Columns.Get(2, Value);
            VendorMemo."Vendor No" := Value;

            Columns.Get(3, Value);
            VendorMemo."Vendor Name" := Value;

            Columns.Get(4, Value);
            Evaluate(VendorMemo."Posting Date", Value);

            Columns.Get(5, Value);
            VendorMemo."Document No" := Value;

            Columns.Get(6, Value);
            Evaluate(VendorMemo."Document Type", Value);

            Columns.Get(7, Value);
            VendorMemo."GL Account No." := Value;

            Columns.Get(8, Value);
            VendorMemo." GL Account Name" := Value;

            Columns.Get(9, Value);
            Evaluate(VendorMemo."Credit Amount", Value);

            Columns.Get(10, Value);
            Evaluate(VendorMemo."Debit Amount", Value);

            Columns.Get(11, Value);
            VendorMemo."Applied Invoice No" := Value;

            Columns.Get(12, Value);
            Evaluate(VendorMemo."Applied Amount", Value);

            VendorMemo.Insert();
        end;

        Message('Import Completed Successfully');
    end;

}
