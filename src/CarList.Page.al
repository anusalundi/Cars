page 78926 "Car List"
{
    PageType = List;
    SourceTable = "Car Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("VIN Code"; Rec."VIN Code")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                }
                field("Manufacturer"; Rec."Manufacturer")
                {
                }
                field("Model"; Rec."Model")
                {
                }
                field("Year"; Rec."Year")
                {
                }
                field("Mileage"; Rec."Mileage")
                {
                }
                field("Category"; Rec."Category")
                {
                }
            }
        }
    }
}
