import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/home/models/product.dart';



class DetailsViewBody extends StatelessWidget {
  final Product product;

  const DetailsViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Center(
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  height: 200,
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

            // السعر
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

            // الوقت المتوقع للتوصيل
            Row(
              children: [
                const Icon(Icons.watch_later_outlined, size: 20),
                const SizedBox(width: 10),
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
            const SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus eros sit amet nisl viverra, in faucibus purus sollicitudin.',
              style: Styles.discoverText,
            ),
          ],
        ),
      ),
    );
  }
}
