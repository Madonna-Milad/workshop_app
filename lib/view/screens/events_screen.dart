import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';

import '../componants/core/navigation.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          navigateTo(context, layoutScreen(0));
        }, icon: Icon(Icons.arrow_back_ios,),), 
        title: Text('Events'),elevation: 7,),
      body:SfCalendar(

          view: CalendarView.month,
         // dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              
              ),

    ));
    
  }
}