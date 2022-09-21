abstract class LecturesStates{}

class InitialState extends LecturesStates{}
class LectuersloadingState extends LecturesStates{}
class LectuersSuccessfulState extends LecturesStates{}
class LectuersErorrState extends LecturesStates{
  final String error;
  LectuersErorrState(this.error);
}
