import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/logic/cubit/enums_state_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managerestaurent/features/home/models/product.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // تسجيل FirebaseFirestore
  locator.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  
  // تسجيل SupabaseClient
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // فتح صندوق Cart
  locator.registerLazySingleton<Box<Product>>(() => Hive.box<Product>('cart'));

  // تسجيل CartCubit مع تمرير صندوق Cart
  locator.registerLazySingleton<CartCubit>(() => CartCubit(locator<Box<Product>>()));

  // تسجيل ProductsCubit
  locator.registerFactory<ProductsCubit>(() => ProductsCubit());

  locator.registerLazySingleton<EnumsStateCubit>(() => EnumsStateCubit());
}
