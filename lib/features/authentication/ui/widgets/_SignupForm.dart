// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/authentication/logic/signupCubit/signup_cubit.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/button_in_login.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.8,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Text('Sign up', style: Styles.titleinloginpage),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: cubit.nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Name',
                      hintStyle: Styles.titleinloginpage,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  TextFormField(
                    controller: cubit.emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: Styles.titleinloginpage,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  TextFormField(
                    controller: cubit.passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Password',
                      hintStyle: Styles.titleinloginpage,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is SignupLoading) {
                        EasyLoading.show(status: 'Signing up...');
                      } else if (state is SignupSuccess) {
                        EasyLoading.showSuccess('Signup successful!');
                        Navigator.pushReplacementNamed(context, Routes.homeView);
                      } else if (state is SignupFailure) {
                        EasyLoading.showError(state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      return  button_in_login(
                              text: 'Sign up',
                              onTap: () {
                                if (cubit.formKey.currentState?.validate() ?? false) {
                                  cubit.signup(); // Call signup method
                                }
                              },
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
