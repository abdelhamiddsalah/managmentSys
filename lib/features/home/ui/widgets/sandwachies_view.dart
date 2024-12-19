import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_state.dart';
import 'package:managerestaurent/features/home/ui/widgets/sandwaiches_list_widget.dart';

class SandwachiesView extends StatelessWidget {
  const SandwachiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProductsCubit>()..fetchProducts('sandwachies', 'sandwachies'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
            return SingleChildScrollView(
              child: SandwaichesListWidget(products: state.products),
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Unexpected error occurred.'));
        },
      ),
    );
  }
}
