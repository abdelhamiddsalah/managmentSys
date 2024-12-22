// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:managerestaurent/core/di/getIt.dart';
import 'package:managerestaurent/core/routing/routes.dart';
import 'package:managerestaurent/myApp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:managerestaurent/features/home/models/product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeHive();  // فتح الصندوق هنا
  await _initializeSupabase();
  await _initializeFirebase();

  setupLocator();

  await dotenv.load();
  _loadEnvironmentVariables();

  final initialRoute = await _getInitialRoute();

  // الحصول على صندوق Cart المفتوح هنا
  final cartBox = await Hive.openBox<Product>('cart');

  runApp(MyApp(
    initialRoute: initialRoute, 
    cartBox: cartBox,  // تمرير cartBox إلى MyApp
  ));

  configLoading();
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  // يتم فتح الصندوق في main الآن
}

Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: 'https://xheqqusfcxldsogcflab.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhoZXFxdXNmY3hsZHNvZ2NmbGFiIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMzU5MTk5NSwiZXhwIjoyMDQ5MTY3OTk1fQ.F-T9v9FCwqTD5U9uAK8hhbOmrCcrwFeG3z034VtLpCM',
  );
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp();
}

void _loadEnvironmentVariables() {
  if (dotenv.env.containsKey('PUBLISHER_KEY')) {
    debugPrint("Environment loaded successfully!");
    Stripe.publishableKey = dotenv.env['PUBLISHER_KEY']!;
  } else {
    debugPrint("Failed to load environment.");
    Stripe.publishableKey = 'default_key';
  }
}

Future<String> _getInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('id_token');
  return token != null && token.isNotEmpty ? Routes.homeView : Routes.onboarding;
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
