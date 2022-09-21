import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/model/sections_model.dart';
import 'package:workshop_app/view_model/sections/sections_states.dart';

import '../database/network/dio_helper.dart';
import '../database/network/end_points.dart';

class SectionsCubit extends Cubit<SectionsStates>{
  SectionsCubit():super(InitialState());

  static SectionsCubit get(context)=>BlocProvider.of(context);

  
 SectionsModel? sectionsModel;

void getSections()async{
  emit((SectionsloadingState()));

 await DioHelper.getData(url:userSectionsEndPoint,
 token: TOKEN, 
  ).then((value){
print(value.data);
sectionsModel=SectionsModel.fromJson(value.data);
//print(sectionsModel.data![0].);

emit((SectionsSuccessfulState()));
  }).catchError((error){
    print(error.toString());
    emit((SectionsErorrState(error.toString())));
  });

}

  
}