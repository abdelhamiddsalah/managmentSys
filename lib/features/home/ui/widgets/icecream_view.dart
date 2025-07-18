import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_cubit.dart';
import 'package:managerestaurent/features/home/logic/products_cubit/products_state.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/features/home/ui/widgets/item_in_ice_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<ProductsCubit>()..fetchProducts('iceCreams', 'icecreams'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          // تحقق إذا كانت المنتجات في حالة تحميل

          if (state is ProductsError) {
            return Center(child: Text(state.error));
          } else if (state is ProductsLoaded) {
            final products = state.products;

            // في حالة عدم وجود منتجات، يتم عرض نص مع هيكل عظمي
            if (products.isEmpty) {
              return const Center(child: Text('No products available.'));
            }

            return ItemsInIcecreamsPage(products: products);
          }

          // عرض افتراضي أثناء انتظار حالة
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemsInIcecreamsPage extends StatelessWidget {
  final List<Product> products;
  const ItemsInIcecreamsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      shrinkWrap: true, // تحديد الحجم بناءً على المحتوى
      physics: const NeverScrollableScrollPhysics(), // منع التمرير داخل GridView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        mainAxisSpacing: screenHeight * 0.02, // التباعد الرأسي
        crossAxisSpacing: screenWidth * 0.02, // التباعد الأفقي
        childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ItemInIcePage(product: products[index]);
      },
    );
  }
}
