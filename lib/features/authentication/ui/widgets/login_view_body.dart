import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/login_background.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/login_form.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/logo_widget.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/row_in_last_login.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/login_cubit.dart';
import 'package:managerestaurent/core/routing/routes.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LoginBackground(),
          BlocProvider(
            create: (_) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  EasyLoading.show(status: 'Loading...');
                }
                if (state is LoginSuccess) { // Dismiss loading on success
                  Navigator.pushReplacementNamed(context, Routes.homeView);
                } else if (state is LoginError) {
                  
                 // EasyLoading.show(status: state.message); // Dismiss loading on error  
                  EasyLoading.dismiss();
                }
              },
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(top: 50, right: 45, left: 45),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LogoWidget(),
                        SizedBox(height: 40.h),
                        LoginForm(),
                        SizedBox(height: 30.h),
                        rowlastinlogin(text1: 'Don’t have an account?', text2: 'Sign Up')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
