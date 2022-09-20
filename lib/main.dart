import 'package:flutter/material.dart';
import 'package:workshop_app/view/screens/counter.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/midterms_screen.dart';
import 'package:workshop_app/view/screens/news_screen.dart';
import 'package:workshop_app/view/screens/partners_screen.dart';
import 'package:workshop_app/view/screens/sized_container.dart';
import 'package:workshop_app/view/screens/splach_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';

import 'view/screens/sections_screen.dart';
import 'view/screens/settings_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/support_screen.dart';

void main() {
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

