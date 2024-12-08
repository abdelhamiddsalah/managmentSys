import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<List<Map<String, dynamic>>> {
  CartCubit() : super([]);

  // إضافة عنصر إلى السلة
  void addToCart(Map<String, dynamic> product) {
    final updatedCart = List<Map<String, dynamic>>.from(state);
    updatedCart.add(product);
    emit(updatedCart);
  }

  // إزالة عنصر من السلة
  void removeFromCart(String productId) {
    final updatedCart = state.where((product) => product['id'] != productId).toList();
    emit(updatedCart);
  }

  // مسح السلة
  void clearCart() {
    emit([]);
  }
}
