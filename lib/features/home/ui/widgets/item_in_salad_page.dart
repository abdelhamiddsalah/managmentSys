import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/core/widgets/showdialog.dart';
import 'package:managerestaurent/features/cart/logic/cubit/cart_cubit.dart';
import 'package:managerestaurent/features/home/models/product.dart';

class ItemInSaladPage extends StatelessWidget {
  const ItemInSaladPage({super.key, required this.product});
final Product product;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
          Navigator.pushNamed(
          context,
          Routes.details,
          arguments: product,  // تمرير المنتج إلى صفحة التفاصيل
        );
      },
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.02), 
         width: screenWidth * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:  Image.network(
                    product.imageUrl, // استخدام الصورة المجلوبة من Supabase
                   height: screenHeight * 0.10,
                   width: screenWidth * 0.25,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // أيقونة خطأ إذا فشل التحميل
                    },
                  ),
              ),
            SizedBox(height: screenHeight * 0.01),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          style:Styles.itemTextInIcecreamPage.copyWith(
                      fontSize: screenWidth * 0.04,
                    ),
                        ),
                        IconButton(onPressed: (){
                          context.read<CartCubit>().addToCart(product);
                          showSuccessDialog(context);
                        }, icon: Icon(Icons.shopping_bag, size: screenWidth * 0.06))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}