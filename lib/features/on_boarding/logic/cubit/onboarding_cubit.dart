// onboarding_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(OnboardingInitial());

  void pageChanged(int index) {
    emit(OnboardingPageChanged(index));
  }

  void navigateToNextPage() {
    final currentIndex = pageController.page?.toInt() ?? 0;
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      pageChanged(currentIndex + 1); // تحديث الحالة بعد تغيير الصفحة
    } else {
      emit(OnboardingCompleted());
    }
  }

  @override
  Future<void> close() {
    pageController.dispose(); // تأكد من التخلص من PageController عند الانتهاء
    return super.close();
  }
}
