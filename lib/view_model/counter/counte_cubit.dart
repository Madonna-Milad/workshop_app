import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/counter/counter_states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(InitialState());

  static CounterCubit get(context)=> BlocProvider.of(context);
  int counter=0;


  void increamentCounter(){
counter++;
emit(IncreamentCounterState());
  }

  void decrementCounter(){
counter--;
emit(DecrementCounterState());
  }

}