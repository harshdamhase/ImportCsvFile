table 50103 "Customer Ledger History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Name"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Invoice No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Originating Amount"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Current Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; status; code[10])
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
        if Status = '' then
            Status := 'closed';
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