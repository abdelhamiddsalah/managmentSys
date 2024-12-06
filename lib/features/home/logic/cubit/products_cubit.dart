// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsCubit extends Cubit<List<Map<String, dynamic>>> {
  ProductsCubit() : super([]);

  // استماع لتغييرات مجموعة المنتجات
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
        emit(items);
      });
    } catch (e) {
      print('Error listening to $collectionName: $e');
      emit([]);
    }
  }
}
