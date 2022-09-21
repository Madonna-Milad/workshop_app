import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/constants.dart';
import 'package:workshop_app/model/news_model.dart';
import 'package:workshop_app/view_model/database/network/dio_helper.dart';
import 'package:workshop_app/view_model/news/news_states.dart';

import '../database/network/end_points.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

   NewsModel? newsModel;

  void getNews()async{
emit(NewsloadingState());

await DioHelper.getData(url: newsEndPoint,
token: TOKEN,
).then((value){
  newsModel=NewsModel.fromJson(value.data);
  

emit(NewsSuccessfulState());
} ).catchError((error){
  print(error.toString());
  emit(NewsErorrState(error));
});

  }


  
}