import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/box/box_states.dart';

class BoxCubit extends Cubit<BoxStates>{
  BoxCubit():super(InitialState());

  static BoxCubit get(context)=> BlocProvider.of(context);

  double width=300;
  double height=300;
  bool isBig=false;

  void toggleSize(){
    if(isBig){
    width=300;
    height=300;
    isBig=false;
    }else{
      width=400;
      height=500;
isBig=true;

    }
   

    emit(BigSizeState());
    

  } 

 
}