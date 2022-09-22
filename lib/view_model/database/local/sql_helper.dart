
import 'package:sqflite/sqflite.dart';

class SQLHelper{
  Database? database;

  void createDataBase()async{

  await openDatabase(
      'ODC.db',
      version: 1,
      onCreate: ((database, version) async{
        await database.execute(
         'CREATE TABLE Note (id INTEGER PRIMARY KEY , title TEXT , date TEXT , description TEXT)'
        );
      })
    );
  }

  void insertData(String title, String date, String description)async{
     await database!.transaction((txn)async {
int id1= await txn.insert('Note', {'title':title,'date':date,'description':description});
     });
  }

  void updateData(int id,String title, String date, String description)async{
    await database!.update('Note', {
'title':title,'date':date,'description':description
    });

  }

 Future< List<Map<String,dynamic>>> getAllNotes()async{
    return await database!.rawQuery('SELECT * FROM Note');
  }

  Future< List<dynamic>> getNote()async{
    return await database!.rawQuery('SELECT * FROM Note');
  }

  void deleteNote(int id)async{
    await database!.rawDelete('DELETE FROM Note WHERE id = ?', [id]);


  }
}