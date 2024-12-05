import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/image_in_onboarding.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/text1_in_pageview.dart';
import 'package:managerestaurent/features/on_boarding/ui/widgets/text2_in_pageview.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
            ImageInOnboarding(image: 'assets/images/screen3.png'),
              SizedBox(height: 20.h), // مسافة بين الصورة والنصوص
             text1_in_pageview(text: 'Quick Delivery at Your Doorstep'),
              SizedBox(height: 10.h), // مسافة بين النص الأول والثاني
             text2_in_pageview(text2: 'Deliver Your Food at Your Doorstep'),
            ],
          ),
        ),
      ),
    );
  }
}
