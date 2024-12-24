// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/authentication/logic/signupCubit/signup_cubit.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class NameInHomeView extends StatelessWidget {
  const NameInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Hello, $userName',
                style: Styles.nameInHomeViewText,
              ),
              Container(
                 // padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<CartCubit, List<Product>>(
                    builder: (context, state) {
                       final cartItemsCount = state.isNotEmpty ? state.length : 0;
                      return IconButton(
                       
                        icon: Stack(
                          children: [
                           const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        semanticLabel: 'Shopping Cart',
                      ),
                            if (cartItemsCount > 0)
                              Positioned(
                                right: -3,
                                top: -2,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 18..w,
                                    minHeight: 18.h,
                                  ),
                                  child: Text(
                                    '$cartItemsCount',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold
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
                  )),
            ],
          );
        },
      ),
    );
  }
}
