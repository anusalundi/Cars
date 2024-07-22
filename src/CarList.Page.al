page 78926 "Car List"
{
    PageType = List;
    SourceTable = "Car Register";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Car Card";
    ModifyAllowed = false;
    Editable = false;

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
                field("Employee ID"; Rec."Employee ID")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Assign Employee")
            {
                Caption = 'Assign Employee';
                ApplicationArea = All;
                trigger OnAction()
                var
                    EmployeeRec: Record Employee;
                begin
                    if Page.RunModal(Page::"Employee List", EmployeeRec) = Action::LookupOK then begin
                        Rec."Employee ID" := EmployeeRec."No.";
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Print PDF")
            {
                Caption = 'Print PDF';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    REPORT.RUNMODAL(REPORT::"Car List Report", true, false);
                end;
            }
        }
    }
}
