import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/features/authentication/logic/loginCubit/login_cubit.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/button_in_login.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

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
            child: Column(
              children: [
                Text('Login', style: Styles.titleinloginpage),
                SizedBox(height: 20.h),
                Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cubit.emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          hintStyle: Styles.titleinloginpage,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.h),
                      TextFormField(
                        controller: cubit.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          hintStyle: Styles.titleinloginpage,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.forgetpassword);
                    },
                    child: Text('Forget Password?', style: Styles.titleinloginpage)),
                ),
                SizedBox(height: 40.h),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return button_in_login(
                            text: 'Login',
                            onTap: () {
                              cubit.login();
                            },
                          );
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
