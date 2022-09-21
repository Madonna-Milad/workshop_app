import 'package:flutter/material.dart';

class ScreenSize{
static late  double width;
 static late double height;
BuildContext context;

  ScreenSize(this.context);


static void initScreenSize(context){
 height= MediaQuery.of(context).size.height;
  width= MediaQuery.of(context).size.width;
}
}