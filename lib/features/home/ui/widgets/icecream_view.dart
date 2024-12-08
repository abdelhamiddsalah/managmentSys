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
              children: [
                // العناصر المعروضة بشكل أفقي
                SizedBox(
                  height: 240.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 3, right: 10,bottom: 10,top: 2),
                        child: SizedBox(
                          width: 220.w,
                          child: ItemInIcePage(product: product),
                        ),
                      );
                    },
                  ),
                ),

                 SizedBox(height: 30.h),
                ListView.builder(
                  shrinkWrap: true, // حل مشكلة القيود
                  physics: const NeverScrollableScrollPhysics(), // منع التمرير الداخلي
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 3, right: 10, bottom: 10,top: 2),
                      child: SizedBox(
                        height: 230.h,
                        child: ItemInIcePage(product: product),
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
