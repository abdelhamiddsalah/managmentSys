// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/core/routing/app_routes.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  init(); 
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // تحميل البيئة من ملف .env
  if (dotenv.env.containsKey('PUBLISHER_KEY')) {
    debugPrint("Environment loaded successfully!");
  } else {
    debugPrint("Failed to load environment.");
  }
  Stripe.publishableKey = dotenv.env['PUBLISHER_KEY'] ?? 'default_key'; // تعيين مفتاح النشر من البيئة
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Check for the token before runApp
  final initialRoute = await _getInitialRoute();
  runApp(MyApp(initialRoute: initialRoute));
  configLoading();
}

Future<String> _getInitialRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('id_token');
  return token != null && token.isNotEmpty
      ? Routes.homeView
      : Routes.onboarding;
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

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

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..dismissOnTap = false;
}
