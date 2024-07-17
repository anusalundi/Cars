page 78911 "Car Model List"
{
    PageType = List;
    SourceTable = "Car Model";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Model Code"; Rec."Model Code")
                {
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ManufacturerRec: Record "Car Manufacturer";
                        ManufacturerLookup: Page "Car Manufacturer List";
                    begin
                        ManufacturerLookup.SetTableView(ManufacturerRec);
                        if ManufacturerLookup.RunModal = Action::LookupOK then begin
                            ManufacturerLookup.GetRecord(ManufacturerRec);
                            Rec."Manufacturer Code" := ManufacturerRec."Manufacturer Code";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
                field("Model Name"; Rec."Model Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(FilterByManufacturer)
            {
                Caption = 'Filter by Manufacturer';
                ApplicationArea = All;
                trigger OnAction()
                var
                    ManufacturerRec: Record "Car Manufacturer";
                begin
                    if Page.RunModal(Page::"Car Manufacturer List", ManufacturerRec) = Action::LookupOK then begin
                        Rec.SetRange("Manufacturer Code", ManufacturerRec."Manufacturer Code");
                    end;
                end;
            }
            action(Choose)
            {
                Caption = 'Choose';
                ApplicationArea = All;
                Promoted = true;
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }
}
