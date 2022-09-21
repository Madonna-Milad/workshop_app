import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/events/events_states.dart';

class EventsCubit extends Cubit<EventsStates>{
  EventsCubit():super(InitialState());

  static EventsCubit get(context)=>BlocProvider.of(context);

  


  
}