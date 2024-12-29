import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/wallet.png',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 40),
          BlocProvider(
            create: (context) => locator<CartCubit>(),
            child: BlocBuilder<CartCubit, List<Product>>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total', style: Styles.discoverText),
                    Text('\$${context.read<CartCubit>().getTotal().toStringAsFixed(2)}', style: Styles.titleinloginpage),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
