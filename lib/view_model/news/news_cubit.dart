import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/news/news_states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  


  
}