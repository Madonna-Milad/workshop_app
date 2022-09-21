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

import '../../model/size_model.dart';
import '../componants/authentication/or_row.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    ScreenSize.initScreenSize(context);

    return Scaffold(
      body: BlocProvider(
                create: (context) => AuthenticationCubit(),
        child:BlocConsumer<AuthenticationCubit, AuthenticationStates>(
                    listener: (context, state) {
                      if(state is LoginSuccessfulState){

                          navigateTo(context, layoutScreen(0));
                      }else if(state is LoginErorrState){
                        
                        // Fluttertoast.showToast(msg: 'E-mail or Password is incorrect',
                        // backgroundColor: Colors.red,
                        // textColor: Colors.white,
                        // toastLength: Toast.LENGTH_LONG,
                        // gravity: ToastGravity.TOP,
                        // fontSize: 16,
                        // );
                      }
                    },
                    builder: (context, state) {
                      AuthenticationCubit cubit = AuthenticationCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildScreenTitle(),
                SizedBox(
                  height: ScreenSize.height * .1,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: ScreenSize.height * .04,
                ),
                 
                    
                 
                     Column(
                      children: [
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
                  width:ScreenSize. width,
                  buttonName: 'Login',
                  onButtonPressed: () {
                  cubit.login();
                  
                  }),
                   
                SizedBox(
                height: ScreenSize.height * .02,
                ),
                buildSeparatedRow(height: ScreenSize.height, width:ScreenSize. width),
                SizedBox(
                height:ScreenSize. height * .02,
                ),
                defaultButton(
                  height: ScreenSize.height,
                  width: ScreenSize.width,
                  buttonName: 'Sign up',
                  toggle: true,
                  onButtonPressed: () {
                                             navigateTo(context, layoutScreen(0));

                  }),
                   ]
                    )
                   ] )
                    );
                  },

                ),
      ),
            
      
        );
      
    
  }
}
