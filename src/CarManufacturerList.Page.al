page 78910 "Car Manufacturer List"
{
    PageType = List;
    SourceTable = "Car Manufacturer";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                }
                field("Manufacturer Name"; Rec."Manufacturer Name")
                {
                }
            }
        }
    }
}
