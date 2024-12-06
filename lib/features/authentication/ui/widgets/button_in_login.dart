// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/colors.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class button_in_login extends StatelessWidget {
  const button_in_login({
    super.key, this.onTap, required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colorsclass.maincolor),
      child: GestureDetector(
        onTap: onTap,
        child: Center(child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child: Text(text,style: Styles.titleinloginpage,),
        )),
      ),
    );
  }
}