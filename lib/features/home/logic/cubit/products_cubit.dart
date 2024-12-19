import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/logic/cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FirebaseFirestore _firestore = GetIt.instance<FirebaseFirestore>();
  final SupabaseClient _supabase = GetIt.instance<SupabaseClient>();

  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchProducts(String collectionName, String bucketName) async {
    try {
      emit(ProductsLoading());

      // جلب المنتجات من Firestore
      QuerySnapshot snapshot = await _firestore.collection(collectionName).get();
      List<Product> products = snapshot.docs
          .map((doc) => Product.fromFirestore(
                doc.id,
                doc.data() as Map<String, dynamic>,
              ))
          .toList();

      // جلب الصور من Supabase
      final response = await _supabase.storage.from(bucketName).list();

      if (response.isNotEmpty) {
        List<String?> imageUrls = response
            .map((file) {
              final url = _supabase.storage
                  .from(bucketName)
                  .getPublicUrl(file.name);

              // تصفية الروابط الفارغة
              if (url.contains('.emptyFolderPlaceholder') || url.isEmpty) {
                return null;
              }
              return url;
            })
            .whereType<String>() // إزالة القيم null
            .toList();

        // ربط الصور بالمنتجات
        for (int i = 0; i < products.length && i < imageUrls.length; i++) {
          products[i] = products[i].copyWith(imageUrl: imageUrls[i]);
        }
      }

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
