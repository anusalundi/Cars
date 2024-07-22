report 78940 "Car List Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem("Car Register"; "Car Register")
        {
            column(VINCode; "VIN Code")
            {

            }
            column(RegistrationNo; "Registration No.")
            {

            }
            column(Manufacturer; "Manufacturer")
            {

            }
            column(Model; "Model")
            {

            }
            column(Year; "Year")
            {

            }
            column(Mileage; "Mileage")
            {

            }
            column(Category; "Category")
            {

            }
            column(EmployeeID; "Employee ID")
            {

            }
        }
    }

    requestpage
    {
        AboutTitle = 'Car List Report';
        AboutText = 'This report shows a list of cars in the register.';
        layout
        {
            area(Content)
            {
                group("Car List Group")
                {
                    field("VIN Code"; "Car Register"."VIN Code")
                    {
                        ApplicationArea = All;
                    }
                    field("Registration No."; "Car Register"."Registration No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Manufacturer"; "Car Register"."Manufacturer")
                    {
                        ApplicationArea = All;
                    }
                    field("Model"; "Car Register"."Model")
                    {
                        ApplicationArea = All;
                    }
                    field("Year"; "Car Register"."Year")
                    {
                        ApplicationArea = All;
                    }
                    field("Mileage"; "Car Register"."Mileage")
                    {
                        ApplicationArea = All;
                    }
                    field("Category"; "Car Register"."Category")
                    {
                        ApplicationArea = All;
                    }
                    field("Employee ID"; "Car Register"."Employee ID")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action("Generate Word Report")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'Resources/CarListTemplate.docx';
        }
    }
}
