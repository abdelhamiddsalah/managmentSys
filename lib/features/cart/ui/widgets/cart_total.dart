import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class CartTotal extends StatelessWidget {
  final double total;

  const CartTotal({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    // استخدم MediaQuery لتحديد الحشوة بناءً على الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingValue = screenWidth * 0.05;

    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(paddingValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total:', style: Styles.titleinloginpage),
          Text('\$${total.toStringAsFixed(2)}', style: Styles.titleinloginpage),
        ],
      ),
    );
  }
}
