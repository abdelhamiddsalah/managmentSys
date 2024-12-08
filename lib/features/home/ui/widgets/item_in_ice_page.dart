import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';

class ItemInIcePage extends StatelessWidget {
  final Map<String, dynamic> product;
  const ItemInIcePage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.details,
          arguments: product,  // تمرير المنتج إلى صفحة التفاصيل
        );
      },
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/8e7d6a3367963f091011dad53454fad3.jpg',  // صورة المنتج
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'] ?? 'Unknown Product',
                      style: Styles.itemTextInIcecreamPage,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['desc'] ?? 'No description available',
                      style: Styles.discoverText,
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        context.read<CartCubit>().addToCart(product);
                      },
                      child: Text(
                        '\$${product['price'] ?? '0'}',
                        style: Styles.itemTextInIcecreamPage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}