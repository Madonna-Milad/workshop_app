
// import 'package:sqflite/sqflite.dart';

// class SQLHelper{
//   late Database database;

// //   void createDataBase()async{

// //   await openDatabase(
// //       'ODC.db',
// //       version: 1,
// //       onCreate: ((database, version) async{
// //         await database.execute(
// //          'CREATE TABLE Note (id INTEGER PRIMARY KEY , title TEXT , date TEXT , description TEXT)'
// //         );
// //       })
// //     );
// //   }

// //   void insertData(String title, String date, String description)async{
// //      await database.transaction((txn)async {
// // int id1= await txn.insert('Note', {'title':title,'date':date,'description':description});
// //      });
// //   }

// //   void updateData(int id,String title, String date, String description)async{
// //     await database.update('Note', {
// // 'title':title,'date':date,'description':description
// //     });

// //   }

// //  Future< List<Map<String,dynamic>>> getAllNotes(database)async{
// //     return await database!.rawQuery('SELECT * FROM Note');
// //   }

// //   Future< List<dynamic>> getNote()async{
// //     return await database.rawQuery('SELECT * FROM Note');
// //   }

// //   void deleteNote(int id)async{
// //     await database.rawDelete('DELETE FROM Note WHERE id = ?', [id]);


// //   }
// void createDatabase() {
//     openDatabase(
//       'ODC.db',
//       version: 1,
//       onCreate: (database, version) {
//         print('Database created');
//         database
//             .execute(
//                 'CREATE TABLE Note (id INTEGER PRIMARY KEY, title TEXT , date TEXT ,description TEXT)')
//             .then((value) {
//           print('Tables created');
//         }).catchError((error) {
//           print('Error when creating table ${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         getDataFromDatabase(database);

//         print('database opened');
//       },
//     ).then((value) {
//       database = value;
//      // emit(CreateDatabaseState());
//     });
//   }

//   Future insertToDatabase({
//     required String title,
//     required String date,
//     required String description,
//   }) async {
//     await database.transaction((txn) async {
//       txn.rawInsert(
//           'INSERT INTO Note(title, date, description) VALUES("$title","$date", "$description")');
//       print('data inserted');
//      // emit(InsertDataState());
//       getDataFromDatabase(database);
//      //  emit(GetDataState());
//     });
//   }

//   void getDataFromDatabase(database) {
//     // newTasks = [];
//     // doneTasks = [];
//     // archivedTasks = [];

//  //   emit(GetDatabaseLoadingState());
 
//     database.rawQuery('SELECT * FROM tasks').then((value) {
      
//     });

//   //  emit(GetDataState());
//   }


  
//   void updateData({
  
//     required int id,
//     required String title,
//     required String date,
//     required String description,
//   }) async {
//     database.rawUpdate('UPDATE Note SET title=? date=? description =? WHERE id = ?',
//         ['$title','$date','$description', id]).then((value) {
//      // emit(AppUpdateDatabaseState());
//       getDataFromDatabase(database);
//     //  emit(GetDataState());
//     });
//   }


//   void deleteData({
   
//     required int id,
//   }) async {
//     database.rawDelete('DELETE FROM Note WHERE id = ?',
//         [ id]).then((value) {
//      // emit(AppDeleteDatabaseState());
//       getDataFromDatabase(database);
//      // emit(GetDataState());
//     });
//   }

  
// }

