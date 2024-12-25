import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_pizza_page.dart';

class PizzasView extends StatelessWidget {
  const PizzasView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => locator<ProductsCubit>()..fetchProducts('pizza', 'pizza'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
               final products = state.products;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ItemsInPizzasPage(products: products)
                ],
              ),
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Unexpected error occurred.'));
        },
      ),
    );
  }
}
  class ItemsInPizzasPage extends StatelessWidget {
  final List<Product> products;
  const ItemsInPizzasPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // أبعاد الشاشة باستخدام MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // حساب عدد الصفوف بناءً على عدد المنتجات
  //  int rowCount = (products.length / 4).ceil(); // مع اعتبار عرض 2 عمود في كل صف

    // حساب ارتفاع الـ GridView بناءً على عدد الصفوف
  //  double gridViewHeight = rowCount * (screenHeight * 0.5); // ارتفاع العنصر في الشبكة

    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      shrinkWrap: true, // تحديد الحجم بناءً على المحتوى
      physics: NeverScrollableScrollPhysics(), // منع التمرير داخل GridView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        mainAxisSpacing: screenHeight * 0.02, // التباعد الرأسي
        crossAxisSpacing: screenWidth * 0.02, // التباعد الأفقي
        childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ItemInPizzaPage(product: products[index]);
      },
    );
  }
}
