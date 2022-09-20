import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/authentication/signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialState());

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

  var dropDownValue ;

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
}
