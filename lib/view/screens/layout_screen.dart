import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/layout/layout_cubit.dart';
import 'package:workshop_app/view_model/layout/layout_states.dart';

class layoutScreen extends StatelessWidget {
  int index=2;
 

layoutScreen(this.index);



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LayoutCubit()..changeBottomNavBarIndex(index),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit =LayoutCubit.get(context);
          return  Scaffold(
            body: cubit.screens[cubit.currentIndex],
        
          bottomNavigationBar: BottomNavyBar(
            selectedIndex:cubit.currentIndex,
           
            items: [
            BottomNavyBarItem(icon: Icon(Icons.home_sharp),title:Text('Home'),activeColor: defaultColor,inactiveColor: Colors.black), 

            BottomNavyBarItem(icon: Icon(Icons.newspaper_rounded),title:Text('News'),activeColor: defaultColor,inactiveColor: Colors.black), 

            BottomNavyBarItem(icon: Icon(Icons.settings),title:Text('Settings'),activeColor: defaultColor,inactiveColor: Colors.black), 
          ],
          onItemSelected: (index){
                 cubit.changeBottomNavBarIndex(index);
             },
             )
         
        );
        },
        
      ),
    );
    
  }
}