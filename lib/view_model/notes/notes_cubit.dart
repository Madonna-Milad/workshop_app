import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshop_app/view_model/notes/notes_states.dart';

class NotesCubit extends Cubit<NotesStates>{
  NotesCubit():super(InitialState());
List<Map> notes=[];
  static NotesCubit get(context)=> BlocProvider.of(context);
late Database database;
  void createDatabase() {
    openDatabase(
      'ODC.db',
      version: 1,
      onCreate: (database, version) {
        print('Database created');
        database
            .execute(
                'CREATE TABLE Note (id INTEGER PRIMARY KEY, title TEXT , date TEXT ,description TEXT)')
            .then((value) {
          print('Tables created');
        }).catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);

        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String description,
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO Note(title, date, description) VALUES("$title","$date", "$description")');
      print('data inserted');
      emit(InsertDataState());
      getDataFromDatabase(database);
       emit(GetDataState());
    });
  }

  Future<void> getDataFromDatabase(database) async {
    

   emit(GetDatabaseLoadingState());
 
  await  database.rawQuery('SELECT * FROM Note').then((value) {
     
     notes=value;
  
    });

    emit(GetDataState());
  }



  
  void updateData({
  
    required int id,
    required String title,
    required String date,
    required String description,
  }) async {
    database.rawUpdate('UPDATE Note SET title=? date=? description =? WHERE id = ?',
        ['$title','$date','$description', id]).then((value) {
      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);
      emit(GetDataState());
    });
  }


  void deleteData({
   
    required int id,
  }) async {
    database.rawDelete('DELETE FROM Note WHERE id = ?',
        [ id]).then((value) {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
      emit(GetDataState());
    });
  }

}