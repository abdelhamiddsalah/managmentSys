import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/image_in_onboarding.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/text1_in_pageview.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/text2_in_pageview.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             ImageInOnboarding(image: 'assets/images/screen1.png'),
              SizedBox(height: 20.h), // مسافة بين الصورة والنصوص
              text1_in_pageview(text: 'Select From Our Best Menu'),
              SizedBox(height: 10.h), // مسافة بين النص الأول والثاني
              text2_in_pageview(text2: 'Pick Your Food From our menu more than 15 times'), 
            ],
          ),
        ),
      ),
    );
  }
}
