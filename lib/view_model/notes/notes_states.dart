abstract class NotesStates{}

class InitialState extends NotesStates{}

 class CreateDatabaseState extends NotesStates {}
class GetDatabaseLoadingState extends NotesStates {}
class InsertDataState extends NotesStates{}
class GetDataState extends NotesStates{}
class AppUpdateDatabaseState extends NotesStates {}

class AppDeleteDatabaseState extends NotesStates {}