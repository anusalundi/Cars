tableextension 78910 "Employee Table Extension" extends Employee
{
    fields
    {
        field(70000; "Car Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Car Register" WHERE("Employee ID" = FIELD("No.")));
        }
    }
}
