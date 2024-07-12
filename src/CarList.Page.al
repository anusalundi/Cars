page 78925 "Vehicle List"
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
                field("Registration No."; "Registration No.")
                {
                }
                field("Manufacturer"; "Manufacturer")
                {
                }
                field("Model"; "Model")
                {
                }
                field("Year"; "Year")
                {
                }
                field("Mileage"; "Mileage")
                {
                }
                field("Category"; "Category")
                {
                }
            }
        }
    }
}
