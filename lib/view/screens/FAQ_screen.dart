import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/model/size_model.dart';
import 'package:workshop_app/view/componants/core/navigation.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view_model/FAQ/FAQ_cubit.dart';

import '../../view_model/FAQ/FAQ_states.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text('FAQ'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => FAQCubit()..getQuestionAndAnswer(),
        child: BlocConsumer<FAQCubit, FAQStates>(
          listener: (context, state) {},
          builder: (context, state) {

            FAQCubit cubit = FAQCubit.get(context);
            final TextSpan questionSpan = HTML.toTextSpan(
      context,
      cubit.question,
      
      
      defaultTextStyle: TextStyle(color: Colors.white,fontSize: 15),
     
    );
     
            final TextSpan answerSpan = HTML.toTextSpan(
      context,
      cubit.answer,
      
      
      defaultTextStyle: TextStyle(color: Colors.white,fontSize: 18),
     
    );
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: defaultColor,
                    ),
                   
                    child: ListTile(
                      title:RichText(text: questionSpan),
                   
                      trailing: IconButton(
                        icon: cubit.isShown
                            ? Icon(Icons.keyboard_arrow_up,size: 25,)
                            : Icon(Icons.keyboard_arrow_down,size: 25,),
                        onPressed: () {
                          cubit.toggleAnswerSheet();
                        },
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: cubit.isShown
                        ? ScreenSize.width * .94
                        : ScreenSize.width * .94,
                    height: cubit.isShown ? ScreenSize.height * .07 : 0,
                    decoration: BoxDecoration(
                      
                        color: Colors.grey,
                        borderRadius: cubit.isShown
                            ? BorderRadius.circular(0): BorderRadius.vertical(bottom: Radius.circular(20))
                            ),
                         
                    child: Align(
                      
                        alignment: Alignment.bottomCenter,
                        child:RichText(text: answerSpan)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
