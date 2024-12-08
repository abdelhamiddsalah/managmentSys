// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsCubit extends Cubit<List<Map<String, dynamic>>> {
  ProductsCubit() : super([]);

  // استماع لتغييرات مجموعة المنتجات في Firestore
  void listenToProducts(String collectionName) {
    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .snapshots()
          .listen((querySnapshot) {
        final items = querySnapshot.docs.map((doc) {
          return {
            'id': doc.id,
            ...doc.data(),
          };
        }).toList();
        emit(items); // Emit المنتجات المستلمة
      });
    } catch (e) {
      print('Error listening to $collectionName: $e');
      emit([]); // Emit قائمة فارغة في حال حدوث خطأ
    }
  }

  // جلب منتج محدد بواسطة ID من Firestore
/*  void getProductById(String collectionName, String productId) {
    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(productId)
          .get()
          .then((doc) {
        if (doc.exists) {
          final product = {
            'id': doc.id,
            ...doc.data()!,
          };
          emit([product]); // Emit المنتج
        } else {
          emit([]); // إذا لم يتم العثور على المنتج
        }
      });
    } catch (e) {
      print('Error fetching product: $e');
      emit([]);
    }
  }*/
}
