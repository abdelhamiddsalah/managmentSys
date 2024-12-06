import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/features/home/ui/home_view.dart';
import 'package:managerestaurent/features/authentication/ui/widgets/profile_view_body.dart';

class CurvedNavbar extends StatefulWidget {
  const CurvedNavbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurvedNavbarState createState() => _CurvedNavbarState();
}

class _CurvedNavbarState extends State<CurvedNavbar> {
  int currentIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    // Initialize the pages
    pages = [
      HomeView(), // Home page
      HomeView(), // Another page (customize as needed)
      HomeView(), // Another page (customize as needed)
      ProfileViewBody(), // Another page (customize as needed)
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], // Show the current page
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.h,
        backgroundColor: Colors.black,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update current index when tapped
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
