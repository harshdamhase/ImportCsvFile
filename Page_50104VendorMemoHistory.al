page 50104 "Vendor Memo History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor Memo History";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Vendor No"; Rec."Vendor No")
                {

                }
                field("Vendor Name"; Rec."Vendor Name")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Document No"; Rec."Document No")
                {

                }
                field("Document Type"; Rec."Document Type")
                {

                }
                field("GL Account No."; Rec."GL Account No.")
                {

                }
                field(" GL Account Name"; Rec." GL Account Name")
                {

                }
                field("Credit Amount"; Rec."Credit Amount")
                {

                }
                field("Debit Amount"; Rec."Debit Amount")
                {

                }
                field("Applied Invoice No"; Rec."Applied Invoice No")
                {

                }
                field("Applied Amount"; Rec."Applied Amount")
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportCSV)
            {
                ApplicationArea = All;
                Caption = 'Import CSV File';
                Image = Import;

                trigger OnAction()
                var
                    VendorMemoCode: Codeunit "Vendor Memo Code";
                begin
                    VendorMemoCode.VendorMemoMgt();
                end;
            }
        }
    }
}