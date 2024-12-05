import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/theming/colors.dart';

class ButtonInOnboarding extends StatelessWidget {
  const ButtonInOnboarding({super.key, required this.value, this.onPressed});

  final String value;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colorsclass.maincolor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60.h,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          value,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
