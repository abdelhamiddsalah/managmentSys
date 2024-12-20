import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/home/models/product.dart';



class DetailsViewBody extends StatelessWidget {
  final Product product;

  const DetailsViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.imageUrl,
                    height: 130.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, size: 100);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // الاسم والوصف
              Text(
                product.name,
                style: Styles.titleinloginpage,
              ),
              const SizedBox(height: 10),
              Text(
                product.desc,
                style: Styles.discoverText,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Styles.titleinloginpage.copyWith(color: Colors.green),
                  ),
                  
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined, size: 20),
                   SizedBox(width: 10.w),
                  Text(
                    'Delivery Time: 30 min',
                    style: Styles.discoverText,
                  ),
                ],
              ),
              const SizedBox(height: 20),
      
              // معلومات إضافية
              Text(
                'Additional Information',
                style: Styles.titleinloginpage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
