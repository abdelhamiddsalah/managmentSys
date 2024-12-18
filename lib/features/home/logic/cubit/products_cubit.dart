/*import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  void listenToProducts(String collectionName) {
    emit(ProductsLoading()); // بدء التحميل

    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .snapshots()
          .listen((querySnapshot) {
        final products = querySnapshot.docs.map((doc) {
          return Product.fromFirestore(doc.id, doc.data());
        }).toList();

        print('Fetched products: $products');  // سجل البيانات المسترجعة

        if (products.isEmpty) {
          emit(ProductsError('No products found.'));
        } else {
          emit(ProductsLoaded(products)); // نجاح في التحميل
        }
      }, onError: (error) {
        emit(ProductsError('Error fetching products: $error')); // معالجة الخطأ
      });
    } catch (e) {
      emit(ProductsError('Exception in listenToProducts: $e'));
    }
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProductsCubit() : super(ProductsInitial());

  // جلب البيانات من Firestore
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
}
