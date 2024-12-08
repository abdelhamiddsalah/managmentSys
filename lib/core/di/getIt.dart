// ignore_for_file: file_names

import 'package:get_it/get_it.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_cubit.dart';

final sl = GetIt.instance; // sl = Service Locator

void init() {
  // Example: Registering a Cubit
  sl.registerLazySingleton<CartCubit>(() => CartCubit());

    // تسجيل ProductsCubit
  sl.registerLazySingleton<ProductsCubit>(() => ProductsCubit());
}
