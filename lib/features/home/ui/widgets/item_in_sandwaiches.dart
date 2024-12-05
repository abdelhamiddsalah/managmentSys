import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class ItemInSandwaiches extends StatelessWidget {
  final Map<String, dynamic> product;

  const ItemInSandwaiches({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/salad4.png',
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'] ?? 'Unknown Product',
                    style: Styles.itemTextInIcecreamPage,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['desc'] ?? 'No description available',
                    style: Styles.discoverText,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product['price'] ?? '0'}',
                    style: Styles.itemTextInIcecreamPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
