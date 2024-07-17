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
            TableRelation = "Car Manufacturer"."Manufacturer Code";
        }
        field(4; "Model"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Car Model"."Model Code" WHERE("Manufacturer Code" = FIELD("Manufacturer"));
        }
        field(5; "Year"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Year" > DATE2DMY(TODAY, 3) then
                    Error('Invalid year!');
            end;
        }
        field(6; "Mileage"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Mileage" < 0 then
                    Error('Mileage cannot be negative.');
            end;
        }
        field(7; "Category"; Enum "Car Category")
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
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
