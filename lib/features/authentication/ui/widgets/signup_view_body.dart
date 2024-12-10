import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/features/authentication/logic/signupCubit/signup_cubit.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/_SignupForm.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/login_background.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/row_in_last_login.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            LoginBackground(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, right: 45, left: 45),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: Image.asset('assets/images/logo.png', width: 240.w)),
                    SizedBox(height: 40.h),
                    SignupForm(),
                    SizedBox(height: 30.h),
                    rowlastinlogin(
                      text1: 'Already have an account?',
                      text2: 'Log in',
                      ontap: () {
                        Navigator.pushReplacementNamed(context, Routes.loginview);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
