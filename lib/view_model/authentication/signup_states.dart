abstract class SignUpStates{}

class InitialState extends SignUpStates{}
class ToggleIconState extends SignUpStates{}
class ChangeDropDownButtonValueState extends SignUpStates{}
class SignuploadingState extends SignUpStates{}
class SignupSuccessfulState extends SignUpStates{}
class SignupErorrState extends SignUpStates{
  final String error;
  SignupErorrState(this.error);
}
class UniversityloadingState extends SignUpStates{}
class UniversitySuccessfulState extends SignUpStates{}
class UniversityErorrState extends SignUpStates{
  final String error;
  UniversityErorrState(this.error);
}

class GradeloadingState extends SignUpStates{}
class GradeSuccessfulState extends SignUpStates{}
class GradeErorrState extends SignUpStates{
  final String error;
  GradeErorrState(this.error);
}