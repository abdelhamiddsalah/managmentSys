import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartItemRow extends StatelessWidget {
  final Product product;

  const CartItemRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // استخدم MediaQuery للحصول على أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.1; // نسبة معينة من العرض

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                product.imageUrl,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 30);
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: Styles.titleinloginpage),
                    SizedBox(height: 15),
                    Text(product.desc, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('\$${product.price}', style: Styles.titleinloginpage),
                  SizedBox(height: 15),
                  IconButton(
                    onPressed: () {
                      context.read<CartCubit>().removeFromCart(product.id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}