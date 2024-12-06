import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';



class DetailsViewBody extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailsViewBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
           // Image.network(product['image'] ?? 'default_image_url'),  // صورة المنتج
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product['name'] ?? 'Unknown', style: Styles.titleinloginpage),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.minimize),
                    ),
                    SizedBox(width: 4),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product['desc'] ?? 'No description available',
                style: Styles.discoverText,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Delivery Time', style: Styles.titleinloginpage),
                SizedBox(width: 30),
                const Icon(Icons.watch_later_outlined),
                SizedBox(width: 5),
                Text('30 min', style: Styles.titleinloginpage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
