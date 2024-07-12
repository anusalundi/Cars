table 78901 "Car Manufacturer"
{
    Caption = 'Car Manufacturer';
    TableType = Normal;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Manufacturer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Manufacturer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Manufacturer Code")
        {
            Clustered = true;
        }
    }
}
