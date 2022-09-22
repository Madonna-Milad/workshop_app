import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/screens/home_screen.dart';
import 'package:workshop_app/view/screens/layout_screen.dart';
import 'package:workshop_app/view/screens/news_screen.dart';
import 'package:workshop_app/view/screens/sign_up_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/authentication/authentication_cubit.dart';
import 'package:workshop_app/view_model/authentication/authentication_states.dart';

import '../../model/size_model.dart';
import '../componants/authentication/or_row.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationCubit(),
        child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
          listener: (context, state) {
             AnimationController localAnimationController;
            if (state is LoginSuccessfulState) {
             
              
               showTopSnackBar(
                
            context,
            CustomSnackBar.success(
            
              message: "Welcome back",
            ),
           
            persistent: false,
            onAnimationControllerInit: (controller) =>
              localAnimationController = controller,
        );
              navigateTo(context, layoutScreen(0));
            } else if (state is LoginErorrState) {
              
               showTopSnackBar(
                
            context,
            CustomSnackBar.error(
             // backgroundColor: Colors.red,
              message: "E-mail or Password is incorrect",
            ),
           
            persistent: false,
            onAnimationControllerInit: (controller) =>
              localAnimationController = controller,
        );
             
            }
          },
          builder: (context, state) {
            AuthenticationCubit cubit = AuthenticationCubit.get(context);
            return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildScreenTitle(),
                          SizedBox(
                            height: ScreenSize.height * .1,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: ScreenSize.height * .04,
                          ),
                          Column(children: [
                            defaultTextFormField(
                              
                                controller: cubit.emailController, label: 'E-Mail'),
                            SizedBox(
                              height: ScreenSize.height * .04,
                            ),
                            defaultTextFormField(
                              
                                controller: cubit.passwordController,
                                label: 'Password',
                                avaliableSuffix: true,
                                isVisible: cubit.isVisible ? true : false,
                                onIconPressed: () {
                                  cubit.toggleEyeIcon();
                                }),
                            SizedBox(
                              height: ScreenSize.height * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: defaultColor,
                                          decoration: TextDecoration.underline),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: ScreenSize.height * .06,
                            ),
                            defaultButton(
                                height: ScreenSize.height,
                                width: ScreenSize.width,
                                buttonName: 'Login',
                                onButtonPressed: () {
                                  cubit.login();
                                }),
                            SizedBox(
                              height: ScreenSize.height * .02,
                            ),
                            buildSeparatedRow(
                                height: ScreenSize.height, width: ScreenSize.width),
                            SizedBox(
                              height: ScreenSize.height * .02,
                            ),
                            defaultButton(
                                height: ScreenSize.height,
                                width: ScreenSize.width,
                                buttonName: 'Sign up',
                                toggle: true,
                                onButtonPressed: () {
                                  navigateTo(context, SignUpScreen());
                                }),
                          ])
                        ]),
                  )),
            );
          },
        ),
      ),
    );
  }
}
