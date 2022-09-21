import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/events_screen.dart';
import 'package:workshop_app/view/screens/finals_screen.dart';
import 'package:workshop_app/view/screens/lectures_screen.dart';
import 'package:workshop_app/view/screens/midterms_screen.dart';
import 'package:workshop_app/view/screens/notes_screen.dart';
import 'package:workshop_app/view/screens/sections_screen.dart';

import '../componants/home/grid_view_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       ScreenSize.initScreenSize(context);


List <VoidCallback> destinations=[
  (){navigateTo(context,LecturesScreen());},
  (){ navigateTo(context, SectionsScreen());},
  (){ navigateTo(context, MidtermsScreen());},
  (){ navigateTo(context,FinalsScreen());},
  (){navigateTo(context,EventsScreen());},
  (){navigateTo(context,NotesScreen());},
];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildScreenTitle(),
              SizedBox(
                height:ScreenSize.height * .06,
              ),
              Container(
                height:ScreenSize.height*.6,
                width: double.infinity,
                child: GridView.count(
                  childAspectRatio: 1/.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenSize.width * .02,
                  mainAxisSpacing: ScreenSize.height * .008,
                  children: [
                    BuildGridViewItem(columnIcon: Icons.menu_book, text: 'Lectures',width: ScreenSize.width,height:ScreenSize. height, onPressed:destinations[0],),
                    BuildGridViewItem(columnIcon: Icons.people_alt_rounded, text: 'Sections',width: ScreenSize.width,height: ScreenSize.height,onPressed:destinations[1]),
                    BuildGridViewItem(columnIcon: Icons.contact_page_outlined, text: 'Midtrems',width:ScreenSize. width,height: ScreenSize.height,onPressed:destinations[2]),
                    BuildGridViewItem(columnIcon: Icons.quiz_outlined, text: 'Finals',width: ScreenSize.width,height:ScreenSize. height,onPressed:destinations[3]),
                    BuildGridViewItem(columnIcon: Icons.calendar_month,text: 'Events',width: ScreenSize.width,height: ScreenSize.height,onPressed:destinations[4]),
                    BuildGridViewItem(columnIcon: Icons.note_alt_sharp, text: 'Notes',width: ScreenSize.width,height: ScreenSize.height,onPressed:destinations[5]),
          
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


