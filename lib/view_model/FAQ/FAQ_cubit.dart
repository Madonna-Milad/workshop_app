import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/view_model/FAQ/FAQ_states.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';

import '../database/network/end_points.dart';

class FAQCubit extends Cubit<FAQStates>{
  FAQCubit():super(InitialState());

  static FAQCubit get(context)=> BlocProvider.of(context);
  var question='';
  var answer='';
  bool isShown=false;

  void toggleAnswerSheet(){
    if(isShown){
      isShown=false;

    }else{
      isShown=true;
    }

    emit(ToggleAnswerSheetState());
  } 

  void getQuestionAndAnswer(){
    emit(FAQloadingState());

    DioHelper.getData(url:faqEndPoint,
    token: TOKEN 
    ).then((value) {
    
question=value.data['data'][0]['question'];
answer =value.data['data'][0]['answer'];
      emit(FAQSuccessfulState());
    }).catchError((error){
emit(FAQErorrState(error.toString()));
    });
  }

}