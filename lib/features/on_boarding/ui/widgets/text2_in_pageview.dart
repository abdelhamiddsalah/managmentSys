import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

// ignore: camel_case_types
class text2_in_pageview extends StatelessWidget {
  const text2_in_pageview({
    super.key, required this.text2,
  });
final String text2;
  @override
  Widget build(BuildContext context) {
    return Text(
      text2,
      textAlign: TextAlign.center, // لتوسيط النص
      style: Styles.text2Inpageview
    );
  }
}