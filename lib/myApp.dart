// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:managerestaurent/features/home/models/product.dart';
import 'package:managerestaurent/core/routing/app_routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;
  final Box<Product> cartBox; // إضافة الصندوق كخاصية

  const MyApp({
    super.key,
    required this.initialRoute,
    required this.cartBox, // تمرير الصندوق المفتوح
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Demo',
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouting().generateRoute,
        );
      },
    );
  }
}
