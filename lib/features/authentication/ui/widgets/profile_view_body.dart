// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/signup_cubit.dart';
import 'package:managerestaurent/features/authentication/ui/login_view.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/ProfileDetailCard.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit()..loadUserData(),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final cubit = context.read<SignupCubit>();

          String userName = 'No Name';
          String userEmail = 'No Email';
          String? userPhoto;

          if (state is SignupSuccess) {
            userName = state.user.displayName ?? 'No Name';
            userEmail = state.user.email ?? 'No Email';
            userPhoto = state.user.photoURL;
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: Material(
                            borderRadius: BorderRadius.circular(60),
                            elevation: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: userPhoto != null
                                  ? Image.network(
                                      userPhoto,
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/boy.jpg',
                                      width: 100.w,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  ProfileDetailCard(
                    icon: Icons.person,
                    label: 'Name',
                    value: userName,
                  ),
                  ProfileDetailCard(
                    icon: Icons.email,
                    label: 'Email',
                    value: userEmail,
                  ),
                  ProfileDetailCard(
                    icon: Icons.file_copy,
                    label: 'Terms and Conditions',
                    value: '',
                  ),
                  GestureDetector(
                    onTap: () async {
                      await cubit.logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginView()),
                        (route) => false,
                      );
                    },
                    child: ProfileDetailCard(
                      icon: Icons.logout,
                      label: 'Log Out',
                      value: '',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
