import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_pizza_page.dart';

class PizzasView extends StatelessWidget {
  const PizzasView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..listenToProducts('pizza'),
      child: BlocBuilder<ProductsCubit, List<Map<String, dynamic>>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                buildVerticalList(products),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildVerticalList(List<Map<String, dynamic>> products) {
    return   ListView.builder(
                  shrinkWrap: true, // Solves unbounded height issue
                  physics: const NeverScrollableScrollPhysics(), // Prevents internal scroll
                  itemCount: (products.length / 2).ceil(), // Show rows of two items
                  itemBuilder: (context, index) {
                    int firstItemIndex = index * 2;
                    int secondItemIndex = firstItemIndex + 1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // First item
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 300.h, // Set a consistent height
                              child: ItemInPizzaPage(product: products[firstItemIndex]),
                            ),
                          ),
                        ),
                        // Second item (check to avoid overflow)
                        if (secondItemIndex < products.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 310.h, // Set the same consistent height
                                child: ItemInPizzaPage(product: products[secondItemIndex]),
                              ),
                            ),
                          ),
                        // Spacer for alignment if only one item in the row
                        if (secondItemIndex >= products.length)
                          Expanded(
                            child: SizedBox(
                              height: 280.h, // Maintain row height even if empty
                              child: const SizedBox(),
                            ),
                          ),
                      ],
                    );
                  },
                );
  }
}
