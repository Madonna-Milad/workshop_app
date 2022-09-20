import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/settings_screen.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
navigateTo(context,layoutScreen(2));

        }, icon:Icon(Icons.arrow_back_ios)),
        title: Text('Our Partners'),
        elevation: 8,

      ),

      body: Padding(
        padding:  EdgeInsets.all(width*.05),
        child: Container(
          child: Stack(
            
            children: [
           ColorFiltered(colorFilter: ColorFilter.mode(Color.fromARGB(255, 218, 214, 214), BlendMode.modulate,),
                     child:  Image(image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E1BAQENDMK0ZgaW8g/company-background_10000/0/1642165538816?e=2147483647&v=beta&t=hhcgn1wfutOU_v8SU6O0mvJEP_IoLULCtSNP3pl7tgc',)
                     ,fit: BoxFit.cover,
                      width:width*.9 ,
                      height: height*.3,
                     
                      ) ,
                     ),
                     Padding(
                       padding:  EdgeInsets.all(width*.02),
                       child: Text('ODC',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                     )
          ]),
        ),
      ),

    );
    
  }
}