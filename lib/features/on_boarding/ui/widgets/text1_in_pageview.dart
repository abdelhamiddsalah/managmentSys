import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

// ignore: camel_case_types
class text1_in_pageview extends StatelessWidget {
  const text1_in_pageview({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center, // لتوسيط النص
      style: Styles.text1Inpageview
    );
  }
}