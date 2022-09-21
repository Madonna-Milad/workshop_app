import 'package:flutter/material.dart';
import 'package:workshop_app/view/screens/splach_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';



void main() async{
await DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:defaultColor,
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color:defaultColor,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,
        )
        ),
        scaffoldBackgroundColor: Colors.white
      ),
     debugShowCheckedModeBanner: false,
      home:SplachScreen(),
    );
  }
}

