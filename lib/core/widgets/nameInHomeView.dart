import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/authentication/logic/signupCubit/signup_cubit.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class NameInHomeView extends StatelessWidget {
  const NameInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة باستخدام MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => SignupCubit()..loadUserData(),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          String userName = 'No Name';
          if (state is SignupSuccess) {
            userName = state.user.displayName ?? 'No Name';
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // النص مع أخذ عرض الشاشة بعين الاعتبار
              SizedBox(
                width: screenWidth * 0.6, // نسبة العرض للنص
                child: Text(
                  'Hello, $userName',
                  style: Styles.nameInHomeViewText,
                  overflow: TextOverflow.ellipsis, // نص منسق إذا كان طويلًا
                ),
              ),
              BlocBuilder<CartCubit, List<Product>>(
                builder: (context, state) {
                  final cartItemsCount = state.isNotEmpty ? state.length : 0;
                  return IconButton(
                    icon: Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                          size: 30,
                          semanticLabel: 'Shopping Cart',
                        ),
                        if (cartItemsCount > 0)
                          Positioned(
                            right: screenWidth * 0.00, // نسبة للمسافة اليمنى
                            top: screenHeight * 0.0, // نسبة للمسافة العلوية
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: screenWidth * 0.05,
                                minHeight: screenWidth * 0.05,
                              ),
                              child: Text(
                                '$cartItemsCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cart);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
