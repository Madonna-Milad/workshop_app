import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/FAQ/FAQ_states.dart';

class FAQCubit extends Cubit<FAQStates>{
  FAQCubit():super(InitialState());

  static FAQCubit get(context)=> BlocProvider.of(context);

  bool isShown=false;

  void toggleAnswerSheet(){
    if(isShown){
      isShown=false;

    }else{
      isShown=true;
    }

    emit(ToggleAnswerSheetState());
  } 
}