import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_salad_page.dart';

class SaladsView extends StatelessWidget {
  const SaladsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProductsCubit>()..fetchProducts('salads', 'foods_images'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
            return SingleChildScrollView(
              child: buildVerticalList(state.products),
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Unexpected error occurred.'));
        },
      ),
    );
  }

  Widget buildVerticalList(List<Product> products) {
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
                  height: 230.h,
                  child: ItemInSaladPage(product: products[firstItemIndex]),
                ),
              ),
            ),
            if (secondItemIndex < products.length)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250.h,
                    child: ItemInSaladPage(product: products[secondItemIndex]),
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
