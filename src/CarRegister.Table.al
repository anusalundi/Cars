table 78900 "Car Register"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "VIN Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Manufacturer"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Model"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Mileage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Category"; Enum "Car Category")
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "VIN Code")
        {
            Clustered = true;
        }
    }
}
