import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';
import 'package:workshop_app/view_model/terms_conditions/terms&condition_states.dart';

import '../database/network/end_points.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsStates>{
  TermsAndConditionsCubit():super(InitialState());

  static TermsAndConditionsCubit get(context) =>BlocProvider.of(context);

var htmlData='';
void getTermsAndConditions(){
emit(TermsloadingState());

DioHelper.getData(url:termsEndPoint ,
token: TOKEN,
).then((value) {
 // print(value.data['data']['Terms']);
  htmlData=value.data['data']['Terms'];
  emit(TermsSuccessfulState());

}).catchError((error){

  emit(TermsErorrState(error));
});

}

}