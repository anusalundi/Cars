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
                    ApplicationArea = All;
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
                        if PAGE.RunModal(PAGE::"Car Manufacturer List", ManufacturerRec) = ACTION::LookupOK then begin
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
                        ModelRec.SetRange("Manufacturer Code", Rec."Manufacturer");
                        if PAGE.RunModal(PAGE::"Car Model List", ModelRec) = ACTION::LookupOK then begin
                            Rec."Model" := ModelRec."Model Code";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
                field("Year"; Rec."Year")
                {
                    trigger OnValidate()
                    begin
                        if Rec."Year" > Date2DMY(Today, 3) then
                            Error('Year cannot be greater than the current year.');
                    end;
                }
                field("Mileage"; Rec."Mileage")
                {
                    trigger OnValidate()
                    begin
                        if Rec."Mileage" < 0 then
                            Error('Mileage cannot be negative.');
                    end;
                }
                field("Category"; Rec."Category")
                {
                }
                field("Employee ID"; Rec."Employee ID") // Uus töötaja väli
                {
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        EmployeeRec: Record Employee;
                    begin
                        if PAGE.RunModal(PAGE::"Employee List", EmployeeRec) = ACTION::LookupOK then begin
                            Rec."Employee ID" := EmployeeRec."No.";
                            exit(true);
                        end;
                        exit(false);
                    end;
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
