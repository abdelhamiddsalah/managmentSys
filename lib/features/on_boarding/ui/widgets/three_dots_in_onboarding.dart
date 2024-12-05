// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/features/on_boarding/logic/cubit/onboarding_cubit.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/customer_indicator.dart';

class three_dots_in_onboarding extends StatelessWidget {
  const three_dots_in_onboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (i) => Padding(
          padding: const EdgeInsets.only(right: 2),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final isActive = state is OnboardingPageChanged && state.index == i;
              return CustomerIndicator(active: isActive);
            },
          ),
        ),
      ),
    );
  }
}
