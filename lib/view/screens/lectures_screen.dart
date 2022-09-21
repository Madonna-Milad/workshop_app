import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view_model/lectures/lectures_cubit.dart';
import 'package:workshop_app/view_model/lectures/lectures_states.dart';

import '../componants/core/navigation.dart';
import '../componants/core/card_component.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateTo(context, layoutScreen(0));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Lectures',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          lazy: true,
          create: (context) => LecturesCubit()..getLectures(),
          child: BlocConsumer<LecturesCubit, LecturesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              LecturesCubit cubit = LecturesCubit.get(context);
              return cubit.lecturesModel == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (context, index) => buildCardItem(
                          'Lecture Day',
                          cubit.lecturesModel!.data![index].lectureSubject.toString(),
                          cubit.lecturesModel!.data![index].lectureDate.toString(),
                          cubit.lecturesModel!.data![index].lectureStartTime.toString(),
                          cubit.lecturesModel!.data![index].lectureEndTime.toString(),
),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: cubit.lecturesModel!.data!.length,
                    );
              //   return Column(
              //   children: [
              //   buildCardItem('Lecture Day','Flutter','Wednesday','12:00pm','2:00pm'),
              //   SizedBox(height: 20,),
              //   buildCardItem('Lecture Day','React','Thursday','12:00pm','2:00pm'),
              //   SizedBox(height: 20,),

              //   buildCardItem('Lecture Day','Vue','Thursday','2:00pm','4:00pm'),

              // ],);
            },
          ),
        ),
      ),
    );
  }
}
