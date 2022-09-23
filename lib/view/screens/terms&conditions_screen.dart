import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view_model/terms_conditions/terms&conditions_cubit.dart';

import '../../view_model/terms_conditions/terms&condition_states.dart';
import '../componants/core/navigation.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              navigateTo(context, layoutScreen(2));
            },
          ),
          title: Text('Terms & Conditions'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) =>
              TermsAndConditionsCubit()..getTermsAndConditions(),
          child:
              BlocConsumer<TermsAndConditionsCubit, TermsAndConditionsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              TermsAndConditionsCubit cubit =
                  TermsAndConditionsCubit.get(context);

              final TextSpan textSpan = HTML.toTextSpan(
                context,
                cubit.htmlData,
                defaultTextStyle: TextStyle(color: Colors.black),
              );
              return SingleChildScrollView(
                  child: cubit.htmlData == ''
                      ? Container(
                          height: ScreenSize.height * .9,
                          child: Center(child: CircularProgressIndicator()))
                      : Padding(
                        padding: const EdgeInsets.all(20),
                        child: RichText(text: textSpan),
                      ));
            },
          ),
        ));
  }
}
