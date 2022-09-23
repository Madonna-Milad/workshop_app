import 'package:flutter/material.dart';
import 'package:workshop_app/core/resourses/colors.dart';

import '../../../model/size_model.dart';

Widget buildNoteCard(String title,String date,String details){
  return Container(
              height: ScreenSize.height*.2,
              width: double.infinity,
              child: Card(
                elevation:10,
                child:Padding(
                  padding:  EdgeInsets.all(ScreenSize.width*.04),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: ScreenSize.height*.01,),
                      Text(date,style: TextStyle(color: defaultColor),),
                       SizedBox(height: ScreenSize.height*.02,),
                        
                      Text(details,style: TextStyle(fontSize: 20)),

                    ],
                  ),
                )
              ));
}