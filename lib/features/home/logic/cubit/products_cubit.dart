/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProductsCubit() : super(ProductsInitial());
  
  Future<void> fetchProducts(String collectionName) async {
    try {
      emit(ProductsLoading());  // إعادة تعيين الحالة إلى البداية
      QuerySnapshot snapshot = await _firestore.collection(collectionName).get();
      List<Product> products = snapshot.docs
          .map((doc) => Product.fromFirestore(doc.id, doc.data() as Map<String, dynamic>)) // تعديل هنا
          .toList();
      emit(ProductsLoaded(products));  // تحديث الحالة عند نجاح الجلب
    } catch (e) {
      emit(ProductsError(e.toString()));  // تحديث الحالة عند حدوث خطأ
    }
  }
}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchProducts(String collectionName , String bucketName) async {
    try {
      emit(ProductsLoading());

      // جلب المنتجات من Firestore
      QuerySnapshot snapshot = await _firestore.collection(collectionName).get();
      List<Product> products = snapshot.docs
          .map((doc) => Product.fromFirestore(
              doc.id,
              doc.data() as Map<String, dynamic>)) // يتم تعيين صورة مؤقتة
          .toList();

      // جلب الصور من Supabase
      final response = await Supabase.instance.client.storage
          .from(bucketName)
          .list();

      if (response.isEmpty) {
        debugPrint('No files found in the bucket.');
      } else {
        final imageUrls = response.map((file) {
          final url = Supabase.instance.client.storage
              .from(bucketName)
              .getPublicUrl(file.name);

          if (url.contains('.emptyFolderPlaceholder') || url.isEmpty) {
            return null;
          }
          return url;
        }).where((url) => url != null).toList();

        // ربط الصور بالمنتجات
        for (int i = 0; i < products.length && i < imageUrls.length; i++) {
          products[i] = Product(
            id: products[i].id,
            name: products[i].name,
            desc: products[i].desc,
            price: products[i].price,
            imageUrl: imageUrls[i]!,
          );
        }
      }

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
