import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ItemInIcePage extends StatelessWidget {
  final Product product;

  const ItemInIcePage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details', // تحديد اسم الصفحة المناسبة
          arguments: product, // تمرير المنتج إلى صفحة التفاصيل
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
                  'assets/images/ice-cream.png', // صورة المنتج
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.name,
                style: Styles.itemTextInIcecreamPage,
              ),
              const SizedBox(height: 4),
              Text(
                product.desc,
                 style: Styles.discoverText,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                   style: Styles.itemTextInIcecreamPage,
                  ),
                   IconButton(onPressed: (){
                          context.read<CartCubit>().addToCart(product);
                        }, icon: Icon(Icons.shopping_bag))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
