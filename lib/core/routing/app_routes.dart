import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/widgets/curved_navbar.dart';
import 'package:managerestaurent/features/authentication/ui/forgetpassword_view.dart';
import 'package:managerestaurent/features/authentication/ui/login_view.dart';
import 'package:managerestaurent/features/authentication/ui/signup_view.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/cart/ui/cartView.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/details_view.dart';
import 'package:managerestaurent/features/on_boarding/ui/on_boarding_view.dart';

class AppRouting {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => locator<CartCubit>(), // لا تحتاج إلى context هنا
            child: const CurvedNavbar(),
          ),
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
        final product = settings.arguments as Product; // استخراج البيانات
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: locator<CartCubit>(), // استخدم الـ Cubit من locator
            child: DetailsView(product: product),
          ),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CartCubit>(
            create: (context) => locator<CartCubit>(), // استخدام CartCubit من locator
            child: const Cartview(),
          ),
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
