// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/cart/ui/widgets/cart_item_row.dart';
import 'package:managerestaurent/features/cart/ui/widgets/cart_total.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart', style: Styles.titleinloginpage),
      ),
      body: BlocBuilder<CartCubit, List<Product>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return Center(
              child: Text('Your cart is empty', style: Styles.titleinloginpage),
            );
          }
          final total = context.read<CartCubit>().getTotal(); // استخدام الدالة لحساب الإجمالي
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final product = cart[index];
                    return CartItemRow(product: product);
                  },
                ),
              ),
              CartTotal(total: total), // تمرير الإجمالي إلى الـ Widget
            ],
          );
        },
      ),
    );
  }
}
