import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:workshop_app/view/screens/login_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Timer(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
        });
    
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Orange',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: defaultColor),
                  ),
                  Text(
                    ' Digital Center',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                    width:400,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: 1,
              //  center: Text("80.0%"),
               linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor:defaultColor,
                    barRadius: Radius.circular(10),
              ),
                  ],
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}
