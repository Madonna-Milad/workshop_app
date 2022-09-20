import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view_model/box/box_cubit.dart';

import '../../view_model/box/box_states.dart';

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoxCubit(),
      child: BlocConsumer<BoxCubit,BoxStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          BoxCubit cubit= BoxCubit.get(context);
          return  Scaffold(
            body: Center(
              child: Column(
                children: [
                  Container(
                    width: cubit.width,
                    height: cubit.height,
                    color: Colors.green,
                  ),

                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: (){
cubit.toggleSize();
                  }, child: Text('Change Size'))
                ],
              ),
            ),
          
        );

        },
        
      ),
    );
    
  }
}