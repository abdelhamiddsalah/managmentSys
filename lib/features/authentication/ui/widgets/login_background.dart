import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(color: Colorsclass.maincolor),
    );
  }
}
