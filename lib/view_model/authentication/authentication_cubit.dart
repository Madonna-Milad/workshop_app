import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/authentication/authentication_states.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';

import '../database/network/end_points.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(InitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
 var emailController = TextEditingController();
 var passwordController = TextEditingController();
  bool isVisible = true;

  void toggleEyeIcon() {
    isVisible = !isVisible;
    emit(ToggleIconState());
  }

  void login() {
   // emit(LoginloadingState());

    DioHelper.postData(url: loginEndPoint, data: {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
    }).then((value) {
      print(value.data);
      emit(LoginSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorrState(error.toString()));
    });
  }
}
