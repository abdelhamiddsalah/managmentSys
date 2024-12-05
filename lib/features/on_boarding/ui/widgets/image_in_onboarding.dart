import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageInOnboarding extends StatelessWidget {
  const ImageInOnboarding({super.key, required this.image});
 final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image,width: 400.w,height: 370.h,);
  }
}