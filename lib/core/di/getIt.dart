// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // تسجيل FirebaseFirestore
  locator.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client,);
  locator.registerSingleton<CartCubit>(CartCubit());
  locator.registerFactory<ProductsCubit>(() => ProductsCubit());
}
