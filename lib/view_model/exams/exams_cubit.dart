import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/model/exams_model.dart';
import 'package:workshop_app/view_model/exams/exams_states.dart';

import '../database/network/dio_helper.dart';
import '../database/network/end_points.dart';

class ExamsCubit extends Cubit<ExamsStates>{
  ExamsCubit():super(InitialState());

  static ExamsCubit get(context)=>BlocProvider.of(context);

ExamsModel? examModel;

void getExams()async{
  emit((ExamsloadingState()));

 await DioHelper.getData(url:'exams',
 token: TOKEN
  ).then((value){
//print(value.data);
examModel=ExamsModel.fromJson(value.data);
emit((ExamsSuccessfulState()));
  }).catchError((error){
    print(error.toString());
    emit((ExamsErorrState(error.toString())));
  });

}


  
}