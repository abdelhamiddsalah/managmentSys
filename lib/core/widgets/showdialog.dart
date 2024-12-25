import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white, // الخلفية البيضاء
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // زوايا مستديرة
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle, // علامة الصح
            color: Colors.orange, // لون العلامة
            size: 60.0, // حجم العلامة
          ),
          SizedBox(height: 20), // مسافة بين العلامة والنص
          Text(
            'Added to cart', // النص
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // النص الأسود
            ),
          ),
        ],
      ),
    ),
  );
}
