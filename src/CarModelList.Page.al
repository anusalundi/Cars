page 78911 "Car Model List"
{
    PageType = List;
    SourceTable = "Car Model";
    ApplicationArea = All;

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
                }
                field("Model Name"; Rec."Model Name")
                {
                }
            }
        }
    }
}
