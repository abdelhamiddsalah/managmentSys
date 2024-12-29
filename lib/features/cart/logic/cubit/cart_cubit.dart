import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  final Box<Product> _cartBox;

  CartCubit(this._cartBox) : super([]) {
    _loadCart(); // تحميل البيانات من الصندوق عند البداية
  }

  void _loadCart() {
    // عند تحميل المنتجات من Hive، نقوم بتحديث الحالة
    emit(_cartBox.values.toList());
  }

  void addToCart(Product product) {
    // إضافة المنتج إلى السلة
    _cartBox.add(product);
    // تحديث الحالة مع السلة الجديدة
    emit(_cartBox.values.toList());
  }

  void removeFromCart(String productId) {
    final index = _cartBox.values
        .toList()
        .indexWhere((product) => product.id == productId);
    if (index != -1) {
      _cartBox.deleteAt(index);
      emit(_cartBox.values.toList());
    }
  }

  void clearCart() {
    _cartBox.clear();
    emit([]);  // إرسال قائمة فارغة عند مسح السلة
  }

  double getTotal() {
    // حساب الإجمالي بناءً على المنتجات في السلة
    return state.fold(0, (sum, product) => sum + product.price);
  }

  @override
  Future<void> close() {
    _cartBox.close();
    return super.close();
  }
}
