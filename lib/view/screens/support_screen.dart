import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/settings_screen.dart';
import '../../model/size_model.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';

class SupportScreen extends StatelessWidget {
   SupportScreen({Key? key}) : super(key: key);
var nameController = TextEditingController();
  
   var emailController = TextEditingController();
   var supportController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:IconButton(icon:Icon(Icons.arrow_back_ios)
         ,onPressed: (){
       navigateTo(context, layoutScreen(2));
        },), 
        title: Text('Support',style:TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          defaultTextFormField(controller: nameController, label: 'Name', fieldColor:Colors.grey,avaliablePrefix: true,prefixFieldIcon: Icons.person),
            SizedBox(height: ScreenSize.height*.03,),
            defaultTextFormField(controller: emailController, label: 'E-Mail', fieldColor:Colors.grey,avaliablePrefix: true,prefixFieldIcon: Icons.email),
            SizedBox(height:ScreenSize.height*.03),
            defaultTextFormField(controller: supportController, label: 'What\'s making you unhappy?', fieldColor:Colors.grey,maxNumberOfLines: 5),
            SizedBox(height: ScreenSize.height*.04,),
            defaultButton(onButtonPressed: (){},
            buttonName: 'Submit',
            height:ScreenSize. height,
            width: ScreenSize.width,
           
            )


        ],),
      ),
    );
    
  }
}