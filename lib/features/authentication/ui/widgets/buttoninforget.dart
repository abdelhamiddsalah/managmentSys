import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/features/authentication/logic/cubit/login_cubit.dart';

class ButtonInForget extends StatelessWidget {
  const ButtonInForget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(color: Colors.white),
          );
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: MaterialButton(
            onPressed: () async {
              await context.read<LoginCubit>().sendPasswordResetEmail();
              
            },
            child: Text(
              'Send Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
