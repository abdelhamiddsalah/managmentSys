import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_state.dart';
import 'package:managerestaurent/features/home/ui/widgets/product_list_widget.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProductsCubit>()..fetchProducts('iceCreams', 'icecreams'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsError) {
            return Center(child: Text(state.error));
          } else if (state is ProductsLoaded) {
            final products = state.products;
            return products.isEmpty
                ? const Center(child: Text('No products available.'))
                : SingleChildScrollView(
                    child: ProductListWidget(products: products),
                  );
          }
          return const Center(child: Text('Unexpected state.'));
        },
      ),
    );
  }
}
