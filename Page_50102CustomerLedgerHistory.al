page 50102 "Customer Ledger History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Ledger History";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Customer No"; Rec."Customer No")
                {

                }
                field("Customer Name"; Rec."Customer Name")
                {

                }
                field("Document Date"; Rec."Document Date")
                {

                }
                field("Due Date"; Rec."Due Date")
                {

                }
                field("Invoice No"; Rec."Invoice No")
                {

                }
                field("Originating Amount"; Rec."Originating Amount")
                {

                }
                field("Current Amount"; Rec."Current Amount")
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
                Caption = 'Import CSV File';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ImportCustomermgt: Codeunit "Import Customer Management";
                begin
                    ImportCustomermgt.ImportCustomerLedgerHistory();
                end;
            }
        }
    }
}