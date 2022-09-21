abstract class ExamsStates{}

class InitialState extends ExamsStates{}
class ExamsloadingState extends ExamsStates{}
class ExamsSuccessfulState extends ExamsStates{}
class ExamsErorrState extends ExamsStates{
  final String error;
  ExamsErorrState(this.error);
}