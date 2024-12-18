import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  // إضافة عنصر إلى السلة
  void addToCart(Product product) {
    final updatedCart = List<Product>.from(state);
    updatedCart.add(product);
    emit(updatedCart);
  }

  // إزالة عنصر من السلة
  void removeFromCart(String productId) {
    final updatedCart = state.where((product) => product.id != productId).toList();
    emit(updatedCart);
  }

  // مسح السلة
  void clearCart() {
    emit([]);
  }
}
