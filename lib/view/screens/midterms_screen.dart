

import 'package:flutter/material.dart';
import 'package:workshop_app/view/componants/core/defaultButton.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';

import '../../model/size_model.dart';
import '../componants/core/navigation.dart';
import '../componants/sections/card_component.dart';

class MidtermsScreen extends StatelessWidget {
  const MidtermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateTo(context, layoutScreen(0));
        }, 
        icon: Icon(Icons.arrow_back_ios),
        
      ),
      title: Text('Midterms',style: TextStyle(color: Colors.black),),
      centerTitle: true,
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
        
        AlertDialog(title: Text('Logout'),
        content: Text('Are you sure ?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
 defaultButton(onButtonPressed: (){},buttonName: 'Cancel',toggle: true,height:ScreenSize.height,width: ScreenSize.width/5.5 ),
 SizedBox(width: ScreenSize.width*.06,),
          defaultButton(onButtonPressed: (){},buttonName: 'Sure',height:ScreenSize. height,width:ScreenSize.width/5.5),
          ],),
         
        ],
        )
          ],),
        ),
      ),
      
    );
   
    
  }
}