import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_ice_page.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..listenToProducts('iceCreams'),
      child: BlocBuilder<ProductsCubit, List<Map<String, dynamic>>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent unbounded height
              children: [
                ListView.builder(
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
                              height: 270.h, // Set a consistent height
                              child: ItemInIcePage(product: products[firstItemIndex]),
                            ),
                          ),
                        ),
                        // Second item (check to avoid overflow)
                        if (secondItemIndex < products.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 270.h, // Set the same consistent height
                                child: ItemInIcePage(product: products[secondItemIndex]),
                              ),
                            ),
                          ),
                        // Spacer for alignment if only one item in the row
                        if (secondItemIndex >= products.length)
                          Expanded(
                            child: SizedBox(
                              height: 270.h, // Maintain row height even if empty
                              child: const SizedBox(),
                            ),
                          ),
                      ],
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
