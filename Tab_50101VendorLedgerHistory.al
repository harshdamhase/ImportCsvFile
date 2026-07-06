table 50101 "Vendor Ledger History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Posting Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Due Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Type"; Enum "Vendor Ledger DocType")
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Total Amount"; decimal)
        {
            Dataclassification = ToBeClassified;
        }
        field(9; "Remaining Amount"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Entry Status"; Code[20])
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

    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        if "Entry Status" = '' then
            "Entry Status" := 'closed';
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