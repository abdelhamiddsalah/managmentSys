import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/login_cubit.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/buttoninforget.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/last_part_in_forget.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/textfieldInforget.dart';

class ForgetpasswordViewBody extends StatelessWidget {
  const ForgetpasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Password Recovery',
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Enter Your Email',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                const textfieldInforget(),
                SizedBox(height: 20.h),
                const ButtonInForget(),
                SizedBox(height: 40.h),
                LastPartInForget(
                  text1: 'Don’t have an account?',
                  text2: 'Create',
                  ontap: () {
                    Navigator.pushReplacementNamed(context, Routes.signupview);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

