import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/model/grade_model.dart';
import 'package:workshop_app/model/university_model.dart';
import 'package:workshop_app/view_model/authentication/signup_states.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';

import '../database/network/end_points.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());

  UniversityModel? universityModel;
  GradeModel ?gradeModel;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();

  static SignUpCubit get(context) => BlocProvider.of(context);
  List<String> genderList = ['Male', 'Female'];
  List<String> universityList = ['AUC', 'Cairo', 'ELU', 'GUC', 'Helwan', 'HTI'];
  List<String> gradeList = [
    'Grade 1',
    'Grade 2',
    'Grade 3',
    'Grade 4',
    'Grade 5'
  ];

  bool isVisibleFirstIcon = true;
  bool isVisibleSecondIcon = true;

  var dropDownValue;

  void toggleEyeIcon({required bool isFirst}) {
    if (isFirst) {
      isVisibleFirstIcon = !isVisibleFirstIcon;
    } else {
      isVisibleSecondIcon = !isVisibleSecondIcon;
    }
    emit(ToggleIconState());
  }

  void changeDropDownValue(Object? value) {
    dropDownValue = value.toString();
    print(dropDownValue);
    emit(ChangeDropDownButtonValueState());
  }

  void signup() {
    emit(SignuploadingState());

    DioHelper.postData(url: registerEndPoint, data: {
      'name': nameController.text.toString(),
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'phoneNumber': phoneController.text.toString(),
      'gender': 'f',
      'universityId': 1,
      'gradeId': 4,
    }).then((value) {
      print(value.data);
      emit(SignupSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(SignupErorrState(error));
    });
  }

  void getUniversity()async {
    emit(UniversityloadingState());

    await DioHelper.getData(url: universityEndPoint).then((value) {
      //print(value.data);
      universityModel=UniversityModel.fromJson(value.data);
      emit(UniversitySuccessfulState());
    }).catchError((error) {
      emit(UniversityErorrState(error.toString()));
    });
  }

  void getGrade()async {
    emit(GradeloadingState());

    await DioHelper.getData(url: universityEndPoint).then((value) {
     // print(value.data);
     gradeModel=GradeModel.fromJson(value.data);
      emit(GradeSuccessfulState());
    }).catchError((error) {
      emit(GradeErorrState(error.toString()));
    });
  }
}
