// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/theming/styles.dart';

// ignore: camel_case_types
class rowlastinlogin extends StatelessWidget {
  const rowlastinlogin({
    super.key, required this.text1, required this.text2, this.ontap,
  });
 final String text1;
 final String text2;
 final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,style: Styles.titleinloginpage,),
        SizedBox(width: 10.w,),
        GestureDetector(onTap:ontap,child: Text(text2,style: Styles.titleinloginpage,),)
      ],
    );
  }
}