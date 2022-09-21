import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view_model/exams/exams_cubit.dart';

import '../../view_model/exams/exams_states.dart';
import '../componants/core/navigation.dart';
import '../componants/core/card_component.dart';

class FinalsScreen extends StatelessWidget {
  const FinalsScreen({Key? key}) : super(key: key);

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
        title: Text('Finals'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        lazy: true,
        create: (context) => ExamsCubit()..getExams(),
        child: BlocConsumer<ExamsCubit, ExamsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ExamsCubit cubit = ExamsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child:cubit.examModel !=null? ListView.separated(
                  itemBuilder: (context, index) =>cubit.examModel!.data![index].isFinal??false? buildCardItem(
                     'Exam Day',
                            cubit.examModel!.data![index].examSubject.toString(),
                             cubit.examModel!.data![index].examDate.toString(),
                            cubit.examModel!.data![index].examStartTime.toString(),
                            cubit.examModel!.data![index].examEndTime.toString(),):SizedBox(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: ScreenSize.height * .02,
                      ),
                  itemCount: cubit.examModel!.data!.length
                  ):Center(child:CircularProgressIndicator() ),

             
            );
          },
        ),
      ),
    );
  }
}
