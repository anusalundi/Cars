pageextension 78909 EmployeeListExtension extends "Employee List"
{
    layout
    {
        addafter("Last Name")
        {
            field("Car Count"; Rec."Car Count")
            {
                ApplicationArea = All;
                trigger OnDrillDown()
                var
                    CarRec: Record "Car Register";
                    CarPage: Page "Car List";
                begin
                    CarRec.SetRange("Employee ID", Rec."No.");
                    CarPage.SetTableView(CarRec);
                    CarPage.Run();
                end;
            }
        }
    }
}
