// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/features/on_boarding/logic/cubit/onboarding_cubit.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/first_page.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/second_page.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/third_page.dart';

class pages_in_pageview extends StatelessWidget {
  const pages_in_pageview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return PageView(
            controller: cubit.pageController,
            onPageChanged: (newIndex) {
              cubit.pageChanged(newIndex);
            },
            children: const [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
          );
        },
      ),
    );
  }
}
