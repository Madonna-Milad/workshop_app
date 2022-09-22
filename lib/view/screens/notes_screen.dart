import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/defaultButton.dart';
import 'package:workshop_app/view/componants/core/defaultTextFormField.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/new_note.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);

  bool availableData = false;

  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateTo(context, layoutScreen(0));
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text('Notes'),
      ),
      body: availableData
          ? Center(
              child: Text('There\'s No Data To Show',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
            )
          : Padding(
            padding: const EdgeInsets.all(15.0),
            child:  ListView.separated(itemBuilder: (context, index) => buildNoteCard('Note title','2022-8-15','I need to study for exams'),
               separatorBuilder: (context, index) => SizedBox(height: ScreenSize.height*.02,),
                itemCount: 3)
            ),
          
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, NewNoteScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
Widget buildNoteCard(String title,String date,String details){
  return Container(
              height: ScreenSize.height*.2,
              width: double.infinity,
              child: Card(
                elevation:5,
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: ScreenSize.height*.02,),
                      Text(date,style: TextStyle(color: defaultColor),),
                       SizedBox(height: ScreenSize.height*.02,),

                      Text(details,style: TextStyle(fontSize: 20)),

                    ],
                  ),
                )
              ));
}