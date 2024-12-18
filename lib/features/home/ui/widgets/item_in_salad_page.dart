import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ItemInSaladPage extends StatelessWidget {
  const ItemInSaladPage({super.key, required this.product});
final Product product;
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
                child:  Image.network(
                    product.imageUrl, // استخدام الصورة المجلوبة من Supabase
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // أيقونة خطأ إذا فشل التحميل
                    },
                  ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}