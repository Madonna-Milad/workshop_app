

import 'package:flutter/material.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';

import '../componants/core/navigation.dart';
import '../componants/sections/card_component.dart';

class FinalsScreen extends StatelessWidget {
  const FinalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateTo(context, layoutScreen(0));
        }, 
        icon: Icon(Icons.arrow_back_ios),
        
      ),
      title: Text('Finals'),
    
      actions: [IconButton(onPressed: (){},
       icon: Icon(Icons.filter_alt))],
       backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
            buildCardItem('Exam Day','Flutter','Wednesday','12:00pm','2:00pm'),
            SizedBox(height: 20,),
            buildCardItem('Exam Day','React','Thursday','12:00pm','2:00pm'),
            SizedBox(height: 20,),
        
            buildCardItem('Exam Day','Vue','Thursday','2:00pm','4:00pm'),
            SizedBox(height: 20,),
        
             buildCardItem('Exam Day','Flutter','Wednesday','12:00pm','2:00pm'),
            SizedBox(height: 20,),
            buildCardItem('Exam Day','React','Thursday','12:00pm','2:00pm'),
            SizedBox(height: 20,),
        
            buildCardItem('Exam Day','Vue','Thursday','2:00pm','4:00pm'),
        
          ],),
        ),
      ),
      
    );
   
    
  }
}