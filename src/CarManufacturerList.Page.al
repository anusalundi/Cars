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
                field("Manufacturer Code"; "Manufacturer Code")
                {
                }
                field("Manufacturer Name"; "Manufacturer Name")
                {
                }
            }
        }
    }
}
