// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';

class Cartviewbody extends StatelessWidget {
  const Cartviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart',style: Styles.titleinloginpage,)),
      body: BlocBuilder<CartCubit, List<Map<String, dynamic>>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return Center(child: Text('Your cart is empty',style: Styles.titleinloginpage,));
          }

          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];
              return ListTile(
                title: Text(product['name'] ?? 'No Name'),
                subtitle: Text('${product['price'] ?? 0} USD'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(product['id']);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          context.read<CartCubit>().clearCart();
        },
      ),
    );
  }
}
