import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop_app/view/componants/core/ScreenTitle.dart';
import 'package:workshop_app/view/screens/login_screen.dart';
import 'package:workshop_app/core/resourses/colors.dart';
import 'package:workshop_app/view_model/authentication/signup_cubit.dart';
import 'package:workshop_app/view_model/authentication/signup_states.dart';
import '../componants/authentication/or_row.dart';
import '../componants/core/defaultButton.dart';
import '../componants/core/defaultTextFormField.dart';
import '../componants/core/navigation.dart';
import '../componants/authentication/drop_down_column.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildScreenTitle(),
              SizedBox(
                height: height * .1,
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: height * .02,
              ),
              BlocProvider(
                create: (context) => SignUpCubit(),
                child: BlocConsumer<SignUpCubit, SignUpStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    SignUpCubit cubit = SignUpCubit.get(context);
                    return Column(
                      children: [
                        defaultTextFormField(
                            controller: nameController, label: 'Name'),
                        SizedBox(
                          height: height * .02,
                        ),
                        defaultTextFormField(
                            controller: emailController, label: 'E-Mail'),
                        SizedBox(
                          height: height * .02,
                        ),
                        defaultTextFormField(
                            controller: passwordController,
                            label: 'Password',
                            isVisible: cubit.isVisibleFirstIcon,
                            avaliableSuffix: true,
                            onIconPressed: () {
                              cubit.toggleEyeIcon(isFirst: true);
                            }),
                        SizedBox(
                          height: height * .02,
                        ),
                        defaultTextFormField(
                            controller: confirmationPasswordController,
                            label: 'Password',
                            avaliableSuffix: true,
                            isVisible: cubit.isVisibleSecondIcon,
                            onIconPressed: () {
                              cubit.toggleEyeIcon(isFirst: false);
                            }),
                        SizedBox(
                          height: height * .02,
                        ),
                        defaultTextFormField(
                            controller: phoneController, label: 'Phone Number'),
                        SizedBox(
                          height: height * .02,
                        ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dropDownColumn(height, width, 'Gender',
                                cubit.genderList, cubit),
                            dropDownColumn(height, width, 'University',
                                cubit.universityList, cubit),
                          ],
                        ),
                        Center(
                            child: dropDownColumn(height, width, 'Grade',
                                cubit.gradeList, cubit)),
                        SizedBox(
                          height: height * .02,
                        ),
                      ],
                    );
                  },
                ),
              ),
              defaultButton(
                  height: height,
                  width: width,
                  buttonName: 'Sign Up',
                  onButtonPressed: () {}),
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
                  buttonName: 'Login',
                  toggle: true,
                  onButtonPressed: () {
                    navigateTo(context, LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
