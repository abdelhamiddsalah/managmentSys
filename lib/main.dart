// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managerestaurent/core/routing/app_routes.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await Supabase.initialize(
    url: 'https://ysupbudasxoxequgfucm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlzdXBidWRhc3hveGVxdWdmdWNtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM0Njg0MDMsImV4cCI6MjA0OTA0NDQwM30.ZQm_tV9sSrlIeXJsBmjRHVEvxTr0xazp9VpcTmrIfbg',
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
