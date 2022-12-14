import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/notes_screen.dart';
import 'package:workshop_app/view_model/notes/notes_cubit.dart';

import '../../model/size_model.dart';
import '../../view_model/notes/notes_states.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';

class NewNoteScreen extends StatelessWidget {
   NewNoteScreen({Key? key}) : super(key: key);
var formKey=GlobalKey<FormState>();
var titleController=TextEditingController();
var dateController=TextEditingController();
var noteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   ScreenSize.initScreenSize(context);

    return  BlocConsumer<NotesCubit,NotesStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          NotesCubit cubit=NotesCubit.get(context);
          return   Scaffold(
appBar: AppBar(leading:IconButton(onPressed: (){
  navigateTo(context,NotesScreen([]));
},
 icon:  Icon(Icons.arrow_back_ios,),),
title: Text('Add Note'),
),
body: Padding(
  padding:  EdgeInsets.all(ScreenSize.width*.03),
   child:   SingleChildScrollView(
     child: Form(
            key: formKey,
            child: Column(children: [
                   
            defaultTextFormField(controller: titleController, label: 'Title',isNote: true,validator: ((value) {
                                    if(value.isEmpty){
                                      return 'Please Enter The Title';
                                    }
                                     }),),
                   
             SizedBox(height:ScreenSize.height*.04,),
                   
             defaultTextFormField(controller: dateController, label: 'Date',isNote: true,validator: ((value) {
                                    if(value.isEmpty){
                                      return 'Please Enter The Date';
                                    }
                                     }),),
                   
               SizedBox(height:ScreenSize.height*.04,),
                   
                   defaultTextFormField(controller: noteController, label: 'Note',isNote: true,maxNumberOfLines: 5,validator: ((value) {
                                    if(value.isEmpty){
                                      return 'Please Enter Your Note';
                                    }
                                     }),),
                   
             
                   
                 SizedBox(height:ScreenSize.height*.04,),
            
                   defaultButton(onButtonPressed: ()async{
                    if(formKey.currentState!.validate()){
                       await cubit.insertToDatabase(title: titleController.text,date: dateController.text,description: noteController.text);
                     
                         navigateTo(context, NotesScreen(cubit.notes));
                     
                    }
                 
                     
          
                   },
                   buttonName: '+ Add ',
                   height: ScreenSize.height,
                   width: ScreenSize.width/3,
            
                   )
                   
                   
                   ],),
          )
        
         
       ),
     ),
        );}
 
    );
    
  }
}