import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/screens/login_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/splach_screen/splach_screen_cubit.dart';

import '../../view_model/splach_screen/splach_screen_states.dart';

class SplachScreen extends StatelessWidget {
 
 
 
  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);
    return BlocProvider(
      create: (context) => SplachScreenCubit()..startTimer(context, LoginScreen()),
      child: BlocConsumer<SplachScreenCubit,SplachScreenStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return  Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 buildScreenTitle(),
                  SizedBox(height: ScreenSize.height*.08,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearPercentIndicator(
                        width:ScreenSize.width*.8,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2500,
                        percent: 1,
                  
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
        },
       
      ),
    );
  }
}
