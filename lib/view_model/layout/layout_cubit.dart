import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/news_screen.dart';
import 'package:workshop_app/view/screens/settings_screen.dart';
import 'package:workshop_app/view_model/layout/layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(InitialState());

  static LayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget>screens=[
      HomeScreen(),
      NewsScreen(),
      SettingsScreen(),
    ];


  void changeBottomNavBarIndex(int index){
    currentIndex=index;

    
    emit(ChangeBottomNavigationBarIndexState());
  }

}