// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class DetailsViewBody extends StatelessWidget {
  final Product product;
  const DetailsViewBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    height: 200.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, size: 100);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style: Styles.titleinloginpage,
              ),
              const SizedBox(height: 10),
              Text(
                product.desc,
                style: Styles.discoverText,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price :',style: Styles.text1Inpageview),
                  Text(
                    '\$${product.price}',
                    style: Styles.titleinloginpage.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined, size: 20),
                  SizedBox(width: 10.w),
                  Text(
                    'Delivery Time: 30 min',
                    style: Styles.discoverText,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add To Cart',
                    style: Styles.titleinloginpage,
                  ),
                  BlocBuilder<CartCubit, List<Product>>(
                    builder: (context, state) {
                      final itemCount = state.where((item) => item.id == product.id).length;

                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: IconButton(
                              onPressed: () {
                                if (itemCount > 0) {
                                  context.read<CartCubit>().removeFromCart(product.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${product.name} removed from cart'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.minimize),
                            ),
                          ),
                          Text(itemCount.toString(),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                          IconButton(
                            onPressed: () {
                              context.read<CartCubit>().addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${product.name} added to cart'),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      );
                    },
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
