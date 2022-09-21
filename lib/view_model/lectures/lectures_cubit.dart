import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/lectures/lectures_states.dart';

class LecturesCubit extends Cubit<LecturesStates>{
  LecturesCubit():super(InitialState());

  static LecturesCubit get(context)=>BlocProvider.of(context);

  


  
}