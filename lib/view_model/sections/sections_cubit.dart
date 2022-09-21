import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/sections/sections_states.dart';

class SectionsCubit extends Cubit<SectionsStates>{
  SectionsCubit():super(InitialState());

  static SectionsCubit get(context)=>BlocProvider.of(context);

  


  
}