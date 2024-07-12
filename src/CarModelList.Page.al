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
                field("Model Code"; "Model Code")
                {
                }
                field("Manufacturer Code"; "Manufacturer Code")
                {
                }
                field("Model Name"; "Model Name")
                {
                }
            }
        }
    }
}
