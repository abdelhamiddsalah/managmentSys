import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_ice_page.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..fetchProducts('iceCreams'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsError) {
            return Center(child: Text(state.error));
          } else if (state is ProductsLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(child: Text('No products available.'));
            }
            return SingleChildScrollView(
              child:buildVerticalList(state.products),
            );
          }
          return const Center(child: Text('Unexpected state.'));
        },
      ),
    );
  }
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
                  height: 270.h,
                  child: ItemInIcePage(product: products[firstItemIndex]),
                ),
              ),
            ),
            if (secondItemIndex < products.length)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 270.h,
                    child: ItemInIcePage(product: products[secondItemIndex]),
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
