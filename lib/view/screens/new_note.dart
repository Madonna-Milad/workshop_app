import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/notes_screen.dart';

import '../../model/size_model.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';

class NewNoteScreen extends StatelessWidget {
   NewNoteScreen({Key? key}) : super(key: key);
var titleController=TextEditingController();
var dateController=TextEditingController();
var noteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   ScreenSize.initScreenSize(context);

    return Scaffold(
appBar: AppBar(leading:IconButton(onPressed: (){
  navigateTo(context,NotesScreen());
},
 icon:  Icon(Icons.arrow_back_ios,),),
title: Text('Add Note'),
),
body: Padding(
  padding:  EdgeInsets.all(ScreenSize.width*.03),
   child:   Column(children: [
  
    defaultTextFormField(controller: titleController, label: 'Title',isNote: true),
  
     SizedBox(height:ScreenSize.height*.04,),
  
     defaultTextFormField(controller: dateController, label: 'Date',isNote: true),
  
       SizedBox(height:ScreenSize.height*.04,),
  
  defaultTextFormField(controller: noteController, label: 'Note',isNote: true,maxNumberOfLines: 5),
  

  
         SizedBox(height:ScreenSize.height*.04,),

  defaultButton(onButtonPressed: (){},
  buttonName: '+ Add ',
  height: ScreenSize.height,
  width: ScreenSize.width/4,

  )
  
  
   ],),
 ),
    );
    
  }
}