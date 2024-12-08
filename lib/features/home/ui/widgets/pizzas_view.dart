import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_pizza_page.dart';

class PizzasView extends StatelessWidget {
  const PizzasView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
       value: sl<ProductsCubit>()..listenToProducts('pizza'),
      child: BlocBuilder<ProductsCubit, List<Map<String, dynamic>>>(
        builder: (context, products) {
           if (products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 10, right: 10),
                        child: SizedBox(
                          width: 230.w,
                          child: ItemInPizzaPage(product: product),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h,),
      
                ListView.builder(
                 physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 10, right: 10),
                      child: SizedBox(
                        height: 270.h,
                        child: ItemInPizzaPage(product: product),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}