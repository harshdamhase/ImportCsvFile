page 50101 "Credit Memo History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Credit Memo History";

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
                field("posting Date"; Rec."posting Date")
                {

                }

                field("Documemt Type"; Rec."Documemt Type")
                {

                }
                field("Document No"; Rec."Document No")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
                field("Remaining Amount"; Rec."Remaining Amount")
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
                Caption = 'Import CSV';
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    CreditMemoCode: Codeunit "Credit Memo Codeunit";
                begin
                    CreditMemoCode.CreditMemoFunction()
                end;
            }
        }
    }
}