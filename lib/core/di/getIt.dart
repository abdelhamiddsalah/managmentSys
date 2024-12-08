// ignore_for_file: file_names

import 'package:get_it/get_it.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
final sl = GetIt.instance; // sl = Service Locator

void init() {
  // Example: Registering a Cubit
  sl.registerLazySingleton<CartCubit>(() => CartCubit());
}
