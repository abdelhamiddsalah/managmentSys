import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:managerestaurent/features/cart/ui/cartView.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/profile_view_body.dart';
import 'package:managerestaurent/features/home/ui/home_view.dart';
import 'package:managerestaurent/features/wallet/ui/walletView.dart';

class CurvedNavbar extends StatefulWidget {
  const CurvedNavbar({super.key});

  @override
  _CurvedNavbarState createState() => _CurvedNavbarState();
}

class _CurvedNavbarState extends State<CurvedNavbar> {
  int currentIndex = 0;

  // إنشاء صفحات مسبقًا وتخزينها
  final List<Widget> pages = [
    HomeView(),
    Cartview(),
    Walletview(),
    ProfileViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages, // عرض الصفحات باستخدام IndexedStack
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.h,
        backgroundColor: Colors.black,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // تحديث الفهرس فقط
          });
        },
        items: const <Widget>[
          Icon(Icons.home_outlined),
          Icon(Icons.shopping_bag_outlined),
          Icon(Icons.wallet_outlined),
          Icon(Icons.person_outlined),
        ],
      ),
    );
  }
}
