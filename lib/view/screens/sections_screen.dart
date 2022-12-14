import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/settings_screen.dart';
import 'package:workshop_app/view_model/sections/sections_cubit.dart';
import 'package:workshop_app/view_model/sections/sections_states.dart';

import '../componants/core/navigation.dart';
import '../componants/core/card_component.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

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
          'Sections',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        lazy: true,
        create: (context) => SectionsCubit()..getSections(),
        child: BlocConsumer<SectionsCubit, SectionsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SectionsCubit cubit = SectionsCubit.get(context);
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child:cubit.sectionsModel!=null? ListView.separated(
                    itemBuilder: (context, index) => buildCardItem(
                        'Section Day',
                        cubit.sectionsModel!.data![index].sectionSubject.toString(),
                        cubit.sectionsModel!.data![index].sectionDate.toString(),
                        cubit.sectionsModel!.data![index].sectionStartTime.toString(),
                        cubit.sectionsModel!.data![index].sectionEndTime.toString(),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: ScreenSize.height * .02,
                        ),
                    itemCount: cubit.sectionsModel!.data!.length
                    ):Center(child: CircularProgressIndicator(),)

                // Column(
                //   children: [
                //     buildCardItem('Section Day', 'Flutter', 'Wednesday',
                //         '12:00pm', '2:00pm'),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     buildCardItem(
                //         'Section Day', 'React', 'Thursday', '12:00pm', '2:00pm'),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     buildCardItem(
                //         'Section Day', 'Vue', 'Thursday', '2:00pm', '4:00pm'),
                //   ],
                // ),
                );
          },
        ),
      ),
    );
  }
}
