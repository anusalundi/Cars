page 78920 "Car Card"
{
    PageType = Card;
    SourceTable = "Car Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Registration No."; "Registration No.")
                {
                    trigger OnValidate()
                    var
                        CarValidation: Codeunit "Car Validation";
                    begin
                        if Rec.Category = Rec.Category::Car then begin
                            if not CarValidation.ValidateRegistrationNo(Rec."Registration No.") then
                                Error('Invalid registration number for car category. It should be in format 123ABC.');
                        end;
                    end;
                }
                field("Manufacturer"; "Manufacturer")
                {
                    trigger OnLookup()
                    var
                        ManufacturerRec: Record "Car Manufacturer";
                    begin
                        if Page.RunModal(Page::"Car Manufacturer List", ManufacturerRec) = Action::LookupOK then begin
                            Rec."Manufacturer" := ManufacturerRec."Manufacturer Code";
                        end;
                    end;
                }
                field("Model"; "Model")
                {
                    trigger OnLookup()
                    var
                        ModelRec: Record "Car Model";
                    begin
                        if Page.RunModal(Page::"Car Model List", ModelRec) = Action::LookupOK then begin
                            Rec."Model" := ModelRec."Model Code";
                        end;
                    end;
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
