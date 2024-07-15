// codeunit 78950 "Car Validation1"
// {
//     procedure ValidateRegistrationNo(RegistrationNo: Code[20]): Boolean
//     var
//         RegExp: Text;
//         RegEx: Codeunit Regex;
//     begin
//         RegExp := '^[0-9]{3}[A-Z]{3}$';
//         RegEx.
//         RegularExpression.Compile(RegExp);
//         exit(RegEx.IsMatch(RegistrationNo));
//     end;
// }
