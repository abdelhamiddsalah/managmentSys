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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Material(
                  elevation: 5.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product['name'],style: Styles.titleinloginpage,),
                            SizedBox(height: 15,),
                            Text(product['desc'])
                          ],
                        ),
                        Column(
                          children: [
                            Text(product['price'].toString() ,style: Styles.titleinloginpage,),
                            SizedBox(height: 15,),
                            IconButton(onPressed: (){
                              context.read<CartCubit>().removeFromCart(product['id']);
                            }, icon: Icon(Icons.delete))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
