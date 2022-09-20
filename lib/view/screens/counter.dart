import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/counter/counte_cubit.dart';

import '../../view_model/counter/counter_states.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CounterCubit cubit= CounterCubit.get(context);
return  Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(cubit.counter.toString(),style: TextStyle(fontSize: 25),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
 ElevatedButton(onPressed: (){
              cubit.increamentCounter();
            },
             child: Text('Increament')),
             SizedBox(width: 100,),
            ElevatedButton(onPressed: (){
              cubit.decrementCounter();
            },
             child: Text('Decrement')),
            ],)
           
          ],),
          
        );
        },
        
      ),
    );
    
  }
}