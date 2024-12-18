import 'package:managerestaurent/features/home/models/product.dart';

// تعريف حالات ProductsCubit
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);

}

class ProductsError extends ProductsState {
  final String error;

  ProductsError(this.error);
}
