import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:workshop_app/main.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/sections_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
        title: Text('News'),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
             
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10),
              ),
              width: width * .9,
              height: height * .3,
              child: Stack(
                children: [
                 ColorFiltered(colorFilter: ColorFilter.mode(Color.fromARGB(255, 214, 213, 213), BlendMode.modulate,),
                 child:  Image(image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E1BAQENDMK0ZgaW8g/company-background_10000/0/1642165538816?e=2147483647&v=beta&t=hhcgn1wfutOU_v8SU6O0mvJEP_IoLULCtSNP3pl7tgc',)
                 ,fit: BoxFit.cover,
                  width:width*.9 ,
                  height: height*.3,
                 
                  ) ,
                 ),
                
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('ODCs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  color: defaultColor,
                                
                              ),
                              height: height*.05,
                              width: width*.2,
                            child: Row(children: [
                              Expanded(child: Icon(Icons.share_outlined,color: Colors.white,size: 16,)),
                              Container(width: 1,height: height*.03,color: Colors.white,),
                            Expanded(child: Icon(Icons.copy,color: Colors.white,size :16))  
                            ],),
                            ),


                          ],
                          
                        ),
                         Spacer(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('ODC Supports All Universities',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500,),textAlign: TextAlign.start,),
                           ],
                         )
                      ],
                      
                    ),
                  ),
                 

                ],
              ),
            ),

           
          ],
        ),
      ),
      
    );
  }
}
