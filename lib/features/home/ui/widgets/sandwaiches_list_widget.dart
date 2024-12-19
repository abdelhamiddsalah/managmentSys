import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'item_in_sandwaiches.dart';

class SandwaichesListWidget extends StatelessWidget {
  final List<Product> products;

  const SandwaichesListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (products.length / 2).ceil(),
      itemBuilder: (context, index) {
        int firstItemIndex = index * 2;
        int secondItemIndex = firstItemIndex + 1;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 260.h,
                  child: ItemInSandwaiches(product: products[firstItemIndex]),
                ),
              ),
            ),
            if (secondItemIndex < products.length)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 270.h,
                    child: ItemInSandwaiches(product: products[secondItemIndex]),
                  ),
                ),
              ),
            if (secondItemIndex >= products.length)
              Expanded(child: SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
