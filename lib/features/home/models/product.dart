import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromFirestore(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      name: data['name'] ?? 'No Name',
      desc: data['desc'] ?? 'No Description',
      price: _parsePrice(data['price']),
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  static int _parsePrice(dynamic price) {
    if (price is int) {
      return price;
    } else if (price is String) {
      return int.tryParse(price) ?? 0;
    } else {
      return 0;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Add the copyWith method
  Product copyWith({
    String? id,
    String? name,
    String? desc,
    int? price,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
