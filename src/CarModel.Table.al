table 78902 "Car Model"
{
    Caption = 'Car Model';
    TableType = Normal;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Model Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Manufacturer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Car Manufacturer"."Manufacturer Code";
        }
        field(3; "Model Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Model Code")
        {
            Clustered = true;
        }
    }

    // fieldgroups
    // {
    //     fieldgroup(DropDown; "Model Code", "Model Name")
    //     {
    //     }
    // }
}
