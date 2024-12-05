import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/core/widgets/nameInHomeView.dart';
import 'package:managerestaurent/features/home/ui/widgets/rowOfImagesTitlesInHome.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const NameInHomeView(),
                SizedBox(height: 25.h,),
                Text('Delicious Food',style: Styles.deliciousFoodText,),
                Text('Discover and Get Great Food',style: Styles.discoverText,),
                SizedBox(height: 13.h,),
                RowOfImagesTitlesInHome(),
              ],
            ),
          )
        ),
      ),
    );
  }
}

