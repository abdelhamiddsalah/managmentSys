import 'package:hive/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]) {
    _loadCart();
  }

  // صندوق Hive لتخزين السلة
  late Box<Product> _cartBox;

  // تحميل السلة من Hive عند بدء تطبيق CartCubit
  Future<void> _loadCart() async {
    _cartBox = await Hive.openBox<Product>('cart');
    emit(_cartBox.values.toList());
  }

  // إضافة عنصر إلى السلة
  void addToCart(Product product) {
    _cartBox.add(product); // إضافة المنتج إلى صندوق Hive
    emit(_cartBox.values.toList()); // تحديث الحالة
  }

  // إزالة عنصر من السلة
  void removeFromCart(String productId) {
    final index = _cartBox.values.toList().indexWhere((product) => product.id == productId);
    if (index != -1) {
      _cartBox.deleteAt(index); // حذف المنتج من صندوق Hive
    }
    emit(_cartBox.values.toList()); // تحديث الحالة
  }

  // مسح السلة
  void clearCart() {
    _cartBox.clear(); // مسح كافة العناصر من صندوق Hive
    emit([]); // تحديث الحالة إلى سلة فارغة
  }

  // إغلاق صندوق Hive عند الانتهاء
  @override
  Future<void> close() async {
    await _cartBox.close();
    super.close();
  }
}
