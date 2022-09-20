import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/authentication/authentication_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates>{
  AuthenticationCubit():super(InitialState());

  static AuthenticationCubit get(context)=> BlocProvider.of(context);
 
bool isVisible=true;

 void toggleEyeIcon(){
  isVisible =! isVisible;
  emit(ToggleIconState());

 }

 

}