table 50102 "Vendor Memo History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry NO"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor Name"; text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Posting Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document No"; code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document Type"; Enum "History Document Type")
        {
            Caption = 'Document Type';

            DataClassification = ToBeClassified;
        }
        field(7; "GL Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; " GL Account Name"; text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Credit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Debit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Applied Invoice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Applied Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
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