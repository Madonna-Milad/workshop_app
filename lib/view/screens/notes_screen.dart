import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/componants/core/defaultButton.dart';
import 'package:workshop_app/view/componants/core/defaultTextFormField.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/new_note.dart';

class NotesScreen extends StatelessWidget {
   NotesScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(leading:IconButton(onPressed: (){
  navigateTo(context,layoutScreen(0));
},
 icon:  Icon(Icons.arrow_back_ios,),),
title: Text('Notes'),
),
body: Center(child: Text('There\'s No Data To Show',style: TextStyle(fontSize: 22,fontWeight:FontWeight.w600,)),),
floatingActionButton: FloatingActionButton(onPressed: () {
  navigateTo(context,NewNoteScreen());
},child: Icon(Icons.add),),
    );
    
      
    
    
  }
}