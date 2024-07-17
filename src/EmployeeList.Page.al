pageextension 78909 EmployeeListExtension extends "Employee List"
{
    layout
    {
        addlast(content)
        {
            field("Car Count"; CountEmployeeCars(Rec."No."))
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

    local procedure CountEmployeeCars(EmployeeID: Code[20]): Integer
    var
        CarRec: Record "Car Register";
    begin
        CarRec.SetRange("Employee ID", EmployeeID);
        exit(CarRec.Count);
    end;
}
