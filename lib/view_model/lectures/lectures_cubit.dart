import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/model/lectures_model.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';
import 'package:workshop_app/view_model/lectures/lectures_states.dart';

import '../database/network/end_points.dart';

class LecturesCubit extends Cubit<LecturesStates>{
  LecturesCubit():super(InitialState());

  static LecturesCubit get(context)=>BlocProvider.of(context);

 LecturesModel? lecturesModel;




void getLectures()async{
  emit(LectuersloadingState());

 await DioHelper.getData(url:userLecturesEndPoint ,
 token:TOKEN ,
  ).then((value){
lecturesModel=LecturesModel.fromJson(value.data);

emit(LectuersSuccessfulState());
  }).catchError((error){
    print(error.toString());
    emit(LectuersErorrState(error));
  });

}
  


  
}