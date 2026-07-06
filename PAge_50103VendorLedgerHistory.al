page 50103 "Vendor Ledger History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vendor Ledger History";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Entry No"; Rec."Entry No")
                {

                }
                field("Vendor No"; Rec."Vendor No")
                {

                }
                field("Vendor Name"; Rec."Vendor Name")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Due Date"; Rec."Due Date")
                {

                }
                field("Document No"; Rec."Document No")
                {

                }
                field("Document Type"; Rec."Document Type")
                {

                }
                field("Total Amount"; Rec."Total Amount")
                {

                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {

                }
                field("Entry Status"; Rec."Entry Status")
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
                Image = Import;
                ApplicationArea = All;
                Caption = 'Import CSV File';
                trigger OnAction()

                var
                    ImportMgt: Codeunit "Import vendor ledger History";
                //codeunit 
                begin
                    ImportMgt.ImportVendorLedgerHistory();
                    //procedure call :codeunit.procedure Name
                end;
            }
        }
    }
}