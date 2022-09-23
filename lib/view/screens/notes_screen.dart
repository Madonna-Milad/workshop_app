import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/defaultButton.dart';
import 'package:workshop_app/view/componants/core/defaultTextFormField.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/new_note.dart';
import 'package:workshop_app/view_model/news/news_cubit.dart';
import 'package:workshop_app/view_model/notes/notes_cubit.dart';
import 'package:workshop_app/view_model/notes/notes_states.dart';

import '../componants/notes/notes_card.dart';

class NotesScreen extends StatelessWidget {
  // NotesScreen({Key? key}) : super(key: key);
  List<Map> addedNotes = [];
  NotesScreen(this.addedNotes);
  

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
      body:
      
         BlocConsumer<NotesCubit, NotesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              NotesCubit noteCubit = NotesCubit.get(context);
          
             return noteCubit.notes.length == 0
                  ? Center(
                      child: Text('There\'s No Data To Show',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) => buildNoteCard(
                              noteCubit.notes[index]['title'],
                              noteCubit.notes[index]['date'],
                              noteCubit.notes[index]['description']),
                          separatorBuilder: (context, index) => SizedBox(
                                height: ScreenSize.height * .02,
                              ),
                          itemCount:noteCubit.notes.length
                          ));
            }
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
