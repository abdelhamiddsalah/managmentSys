import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/theming/colors.dart';

class CustomerIndicator extends StatelessWidget {
  final bool active;
  const CustomerIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 250),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: active?Colorsclass.secondcolor:Colorsclass.secondcolor,
    ),
    width: active?30.w:10.w,
    height: 10.h,
    );
  }
}