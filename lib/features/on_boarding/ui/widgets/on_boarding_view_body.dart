import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/features/on_boarding/logic/cubit/onboarding_cubit.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/button_in_onboarding.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/pages_in_pageview.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/three_dots_in_onboarding.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 45),
            child: Column(
              children: [
                pages_in_pageview(),
                SizedBox(height: 5.h),
                three_dots_in_onboarding(),
                SizedBox(height: 30.h),
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    final cubit = context.read<OnboardingCubit>();
                    final isLastPage =
                        state is OnboardingPageChanged && state.index == 2;
                    return ButtonInOnboarding(
                      value: isLastPage ? 'Start' : 'Next',
                      onPressed: () {
                        if (!isLastPage) {
                          cubit.navigateToNextPage();
                        } else {
                       Navigator.pushReplacementNamed(context, Routes.signupview);
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
    );
  }
}