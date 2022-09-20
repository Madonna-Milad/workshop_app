import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/news_screen.dart';
import 'package:workshop_app/view/screens/sign_up_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/authentication/authentication_cubit.dart';
import 'package:workshop_app/view_model/authentication/authentication_states.dart';

import '../componants/authentication/or_row.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildScreenTitle(),
            SizedBox(
              height: height * .1,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * .04,
            ),
            BlocProvider(
              create: (context) => AuthenticationCubit(),
              child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  AuthenticationCubit cubit = AuthenticationCubit.get(context);
                  return Column(
                    children: [
                      defaultTextFormField(
                          controller: emailController, label: 'E-Mail'),
                      SizedBox(
                        height: height * .04,
                      ),
                      defaultTextFormField(
                          controller: passwordController,
                          label: 'Password',
                          avaliableSuffix: true,
                          isVisible: cubit.isVisible ? true : false,
                          onIconPressed: () {
                            cubit.toggleEyeIcon();
                          }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: defaultColor,
                      decoration: TextDecoration.underline),
                )),
            SizedBox(
              height: height * .06,
            ),
            defaultButton(
                height: height,
                width: width,
                buttonName: 'Login',
                onButtonPressed: () {
                  navigateTo(context, layoutScreen(0));
                }),
            SizedBox(
              height: height * .02,
            ),
            buildSeparatedRow(height: height, width: width),
            SizedBox(
              height: height * .02,
            ),
            defaultButton(
                height: height,
                width: width,
                buttonName: 'Sign up',
                toggle: true,
                onButtonPressed: () {
                  navigateTo(context, SignUpScreen());
                }),
          ],
        ),
      ),
    );
  }
}
