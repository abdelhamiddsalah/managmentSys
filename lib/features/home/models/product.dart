class Product {
  final String id;
  final String name;
  final String desc;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
  });

  // إنشاء دالة لتحويل بيانات Firebase إلى Product
  factory Product.fromFirestore(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      name: data['name'] ?? 'No Name',
      desc: data['desc'] ?? 'No Description',
      price: _parsePrice(data['price']), // تحويل السعر بشكل آمن
    );
  }

  // دالة مساعدة لتحويل السعر إلى int
  static int _parsePrice(dynamic price) {
    if (price is int) {
      return price;
    } else if (price is String) {
      return int.tryParse(price) ?? 0; // في حال كانت القيمة String، نحاول تحويلها إلى int وإذا فشلنا نستخدم 0
    } else {
      return 0; // في حال كانت القيمة null أو نوع آخر
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'price': price,
    };
  }
}
