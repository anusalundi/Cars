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
                field("VIN Code"; Rec."VIN Code")
                {
                }
                field("Registration No."; Rec."Registration No.")
                {
                    trigger OnValidate()
                    begin
                        if Rec."Category" = Rec."Category"::Car then begin
                            if not ValidateRegistrationNo(Rec."Registration No.") then
                                Error('Invalid registration number for car category. It should be in format 123ABC.');
                        end;
                    end;
                }
                field("Manufacturer"; Rec."Manufacturer")
                {
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ManufacturerRec: Record "Car Manufacturer";
                    begin
                        if Page.RunModal(Page::"Car Manufacturer List", ManufacturerRec) = Action::LookupOK then begin
                            Rec."Manufacturer" := ManufacturerRec."Manufacturer Code";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
                field("Model"; Rec."Model")
                {
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ModelRec: Record "Car Model";
                    begin
                        if Page.RunModal(Page::"Car Model List", ModelRec) = Action::LookupOK then begin
                            Rec."Model" := ModelRec."Model Code";
                            exit(true);
                        end;
                        exit(false);
                    end;
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

    local procedure ValidateRegistrationNo(RegistrationNo: Code[20]): Boolean
    var
        Numbers: Text[3];
        Letters: Text[3];
    begin
        if StrLen(RegistrationNo) <> 6 then
            exit(false);

        Numbers := CopyStr(RegistrationNo, 1, 3);
        Letters := CopyStr(RegistrationNo, 4, 3);

        exit(IsNumeric(Numbers) and IsAlpha(Letters));
    end;

    local procedure IsNumeric(Value: Text): Boolean
    var
        i: Integer;
    begin
        for i := 1 to StrLen(Value) do begin
            if not (Value[i] in ['0' .. '9']) then
                exit(false);
        end;
        exit(true);
    end;

    local procedure IsAlpha(Value: Text): Boolean
    var
        i: Integer;
    begin
        for i := 1 to StrLen(Value) do begin
            if not (Value[i] in ['A' .. 'Z']) then
                exit(false);
        end;
        exit(true);
    end;
}
