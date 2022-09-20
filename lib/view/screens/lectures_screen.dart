import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';

import '../componants/core/navigation.dart';
import '../componants/sections/card_component.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateTo(context, layoutScreen(0));
        }, 
        icon: Icon(Icons.arrow_back_ios),
        
      ),
      title: Text('Lectures',style: TextStyle(color: Colors.black),),
      centerTitle: true,
      actions: [IconButton(onPressed: (){},
       icon: Icon(Icons.filter_alt))],
       backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
          buildCardItem('Lecture Day','Flutter','Wednesday','12:00pm','2:00pm'),
          SizedBox(height: 20,),
          buildCardItem('Lecture Day','React','Thursday','12:00pm','2:00pm'),
          SizedBox(height: 20,),

          buildCardItem('Lecture Day','Vue','Thursday','2:00pm','4:00pm'),

        ],),
      ),
      
    );
    
  }
}