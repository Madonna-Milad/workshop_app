import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/splach_screen/splach_screen_states.dart';

class SplachScreenCubit extends Cubit<SplachScreenStates>{
  SplachScreenCubit():super(InitialState());

  static SplachScreenCubit get(context)=>BlocProvider.of(context);

  void startTimer(BuildContext context,Widget screen){
     Timer(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => screen));
        });
  }
}