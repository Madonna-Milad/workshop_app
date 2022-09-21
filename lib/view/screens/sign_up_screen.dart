import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/screens/login_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/authentication/signup_cubit.dart';
import 'package:workshop_app/view_model/authentication/signup_states.dart';
import '../../model/size_model.dart';
import '../componants/authentication/or_row.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';
import '../componants/authentication/drop_down_column.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
       ScreenSize.initScreenSize(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildScreenTitle(),
                SizedBox(
                  height: ScreenSize.height * .08,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: ScreenSize.height * .02,
                ),
                BlocProvider(
                  lazy: true,
                  create: (context) => SignUpCubit()..getUniversity()..getGrade(),
                  child: BlocConsumer<SignUpCubit, SignUpStates>(
                    listener: (context, state) {
                      AnimationController localAnimationController;
              if (state is SignupSuccessfulState) {
               
                
                 showTopSnackBar(
                  
              context,
              CustomSnackBar.success(
              
                message: "Added Successfully",
              ),
             
              persistent: false,
              onAnimationControllerInit: (controller) =>
                localAnimationController = controller,
          );
                        navigateTo(context, LoginScreen());
                      }
                    },
                    builder: (context, state) {
                      SignUpCubit cubit = SignUpCubit.get(context);
                      return (cubit.universityList!=null && cubit.gradeList !=null)? Column(
                        children: [
                          defaultTextFormField(
                              controller: cubit.nameController, label: 'Name'),
                          SizedBox(
                            height: ScreenSize.height * .02,
                          ),
                          defaultTextFormField(
                              controller: cubit.emailController, label: 'E-Mail'),
                          SizedBox(
                            height: ScreenSize.height * .02,
                          ),
                          defaultTextFormField(
                              controller: cubit.passwordController,
                              label: 'Password',
                              isVisible: cubit.isVisibleFirstIcon,
                              avaliableSuffix: true,
                              onIconPressed: () {
                                cubit.toggleEyeIcon(isFirst: true);
                              }),
                          SizedBox(
                            height: ScreenSize.height * .02,
                          ),
                          defaultTextFormField(
                              controller: cubit.confirmationPasswordController,
                              label: 'Password',
                              avaliableSuffix: true,
                              isVisible: cubit.isVisibleSecondIcon,
                              onIconPressed: () {
                                cubit.toggleEyeIcon(isFirst: false);
                              }),
                          SizedBox(
                            height: ScreenSize.height * .02,
                          ),
                          defaultTextFormField(
                              controller:cubit.phoneController, label: 'Phone Number'),
                          SizedBox(
                            height:ScreenSize. height * .02,
                          ),
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dropDownColumn(ScreenSize.height,ScreenSize.width, 'Gender',
                                  cubit.genderList, cubit),
                              dropDownColumn(ScreenSize.height, ScreenSize.width, 'University',
                                  cubit.universityList, cubit),
                            ],
                          ),
                          Center(
                              child: dropDownColumn(ScreenSize.height, ScreenSize.width, 'Grade',
                                  cubit.gradeList, cubit)),
                          SizedBox(
                            height: ScreenSize.height * .02,
                          ),
                       
                defaultButton(
                    height: ScreenSize.height,
                    width:ScreenSize. width,
                    buttonName: 'Sign Up',
                    onButtonPressed: () {
                  cubit.signup();
                    }),
                     ],
                      ):Center(child:CircularProgressIndicator());
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenSize.height * .02,
                ),
                buildSeparatedRow(height: ScreenSize.height, width: ScreenSize.width),
                SizedBox(
                  height: ScreenSize.height * .02,
                ),
                defaultButton(
                    height:ScreenSize. height,
                    width: ScreenSize.width,
                    buttonName: 'Login',
                    toggle: true,
                    onButtonPressed: () {
                      navigateTo(context, LoginScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
