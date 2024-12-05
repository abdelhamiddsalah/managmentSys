import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/signup_cubit.dart';

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
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      semanticLabel: 'Shopping Cart',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
