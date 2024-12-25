import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ItemInIcePage extends StatelessWidget {
  final Product product;

  const ItemInIcePage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          'details', // تحديد اسم الصفحة المناسبة
          arguments: product, // تمرير المنتج إلى صفحة التفاصيل
        );
      },
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(screenWidth * 0.025), // استجابة مع العرض
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.02), // تقليل البُعد حسب العرض
          width: screenWidth * 0.5, // 45% من عرض الشاشة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    height: screenHeight * 0.10, // نسبة من ارتفاع الشاشة
                    width: screenWidth * 0.25, // نسبة من عرض الشاشة
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, size: screenWidth * 0.1); // أيقونة بحجم مناسب
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // مسافة استجابة للارتفاع
              Text(
                product.name,
                style: Styles.itemTextInIcecreamPage.copyWith(
                  fontSize: screenWidth * 0.04, // حجم النص استجابة للعرض
                ),
              ),
              SizedBox(height: screenHeight * 0.005), // مسافة صغيرة استجابة للارتفاع
              Text(
                product.desc,
                style: Styles.discoverText.copyWith(
                  fontSize: screenWidth * 0.035, // حجم نص الوصف
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Styles.itemTextInIcecreamPage.copyWith(
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartCubit>().addToCart(product);
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      size: screenWidth * 0.06, // حجم الأيقونة
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
