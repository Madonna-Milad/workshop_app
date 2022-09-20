import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/core/resourses/colors.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

List <VoidCallback> destinations=[
  (){navigateTo(context,LecturesScreen());},
  (){ navigateTo(context, SectionsScreen());},
  (){ navigateTo(context, MidtermsScreen());},
  (){ navigateTo(context,FinalsScreen());},
  (){navigateTo(context,EventsScreen());},
  (){navigateTo(context,NotesScreen());},
];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildScreenTitle(),
            SizedBox(
              height: height * .08,
            ),
            Container(
              height:height*.6,
              width: double.infinity,
              child: GridView.count(
                childAspectRatio: 1/.6,
                crossAxisCount: 2,
                crossAxisSpacing: width * .04,
                mainAxisSpacing: height * .01,
                children: [
                  BuildGridViewItem(columnIcon: Icons.menu_book, text: 'Lectures',width: width,height: height, onPressed:destinations[0],),
                  BuildGridViewItem(columnIcon: Icons.people_alt_rounded, text: 'Sections',width: width,height: height,onPressed:destinations[1]),
                  BuildGridViewItem(columnIcon: Icons.contact_page_outlined, text: 'Midtrems',width: width,height: height,onPressed:destinations[2]),
                  BuildGridViewItem(columnIcon: Icons.quiz_outlined, text: 'Finals',width: width,height: height,onPressed:destinations[3]),
                  BuildGridViewItem(columnIcon: Icons.calendar_month,text: 'Events',width: width,height: height,onPressed:destinations[4]),
                  BuildGridViewItem(columnIcon: Icons.note_alt_sharp, text: 'Notes',width: width,height: height,onPressed:destinations[5]),
        
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


