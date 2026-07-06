table 50104 "Credit Memo History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Customer No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Name"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "posting Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Documemt Type"; option)
        {
            OptionMembers = "Invoice","Credit Memo","Payment","Refund";
        }
        field(6; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Applied Invoice No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Applied Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Credit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Bal. Account.No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(111; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; "Customer No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}