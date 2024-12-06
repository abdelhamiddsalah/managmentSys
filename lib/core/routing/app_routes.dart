import 'package:flutter/material.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/widgets/curved_navbar.dart';
import 'package:managerestaurent/features/authentication/ui/forgetpassword_view.dart';
import 'package:managerestaurent/features/authentication/ui/login_view.dart';
import 'package:managerestaurent/features/authentication/ui/signup_view.dart';
import 'package:managerestaurent/features/home/ui/widgets/details_view_body.dart';
import 'package:managerestaurent/features/on_boarding/ui/on_boarding_view.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => const CurvedNavbar(),
        );
      case Routes.loginview:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.signupview:
        return MaterialPageRoute(
          builder: (_) => const SignupView(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.forgetpassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetpasswordView(),
        );
      case Routes.details:
        final product = settings.arguments as Map<String, dynamic>;  // استخراج البيانات
        return MaterialPageRoute(
          builder: (_) => DetailsView(product: product), // تمرير البيانات إلى تفاصيل المنتج
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Page not found")),
            body: const Center(child: Text("404 - Page not found")),
          ),
        );
    }
  }
}
