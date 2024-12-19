import 'package:hive/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]) {
    _loadCart();
  }

  late Box<Product> _cartBox;

  // تحميل السلة من Hive
  Future<void> _loadCart() async {
    _cartBox = await Hive.openBox<Product>('cart');
    emit(_cartBox.values.toList());
  }

  // إضافة عنصر إلى السلة
  void addToCart(Product product) {
    _cartBox.add(product);
    emit(_cartBox.values.toList());
  }

  // إزالة عنصر من السلة
  void removeFromCart(String productId) {
    final index = _cartBox.values.toList().indexWhere((product) => product.id == productId);
    if (index != -1) {
      _cartBox.deleteAt(index);
    }
    emit(_cartBox.values.toList());
  }

  // مسح السلة
  void clearCart() {
    _cartBox.clear();
    emit([]);
  }

  // إغلاق الصندوق عند انتهاء الكيوبت
  @override
  Future<void> close() async {
    await _cartBox.close();
    super.close();
  }
}
