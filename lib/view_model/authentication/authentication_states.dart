abstract class AuthenticationStates{}

class InitialState extends AuthenticationStates{}
class ToggleIconState extends AuthenticationStates{}

class LoginloadingState extends AuthenticationStates{}
class LoginSuccessfulState extends AuthenticationStates{}
class LoginErorrState extends AuthenticationStates{
  final String error;
  LoginErorrState(this.error);
}
