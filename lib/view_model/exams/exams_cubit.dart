import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/exams/exams_states.dart';

class ExamsCubit extends Cubit<ExamsStates>{
  ExamsCubit():super(InitialState());

  static ExamsCubit get(context)=>BlocProvider.of(context);

  


  
}