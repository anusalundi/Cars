table 78900 "Car Register"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Manufacturer"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Model"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Mileage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Category"; Option)
        {
            OptionMembers = "Car,Motorcycle,Van";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Registration No.")
        {
            Clustered = true;
        }
    }
}
