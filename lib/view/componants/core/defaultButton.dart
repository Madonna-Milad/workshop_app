import 'package:flutter/material.dart';

import '../../../core/resourses/colors.dart';

Widget defaultButton({
  double height=0,
  double width=0,
  String buttonName='',
  bool toggle=false,
  required Function onButtonPressed,
}){
  return  Center(
              child: Container(
                width: width * .8,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5),
                     border: Border.all(
                      color: defaultColor,
                      width: 2,
                    ),
                    ),
                child: MaterialButton(
                  height: height * .06,
                  onPressed: () {
                    onButtonPressed();
                  },
                  child: Text(
                    buttonName,
                    style: TextStyle(color:toggle?defaultColor: Colors.white),
                  ),
                  color:toggle?Colors.white: defaultColor,
                ),
              ),
            ); 
}
