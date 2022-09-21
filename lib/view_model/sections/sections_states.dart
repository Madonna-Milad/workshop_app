abstract class SectionsStates{}

class InitialState extends SectionsStates{}
class SectionsloadingState extends SectionsStates{}
class SectionsSuccessfulState extends SectionsStates{}
class SectionsErorrState extends SectionsStates{
  final String error;
  SectionsErorrState(this.error);
}