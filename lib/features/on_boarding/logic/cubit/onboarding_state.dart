part of 'onboarding_cubit.dart';

abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int index;

  const OnboardingPageChanged(this.index);
}

class OnboardingCompleted extends OnboardingState {}
