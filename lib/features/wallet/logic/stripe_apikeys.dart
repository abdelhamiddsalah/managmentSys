import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class PaymentKeys {
  static String get publisherKey => dotenv.env['PUBLISHER_KEY'] ?? '';
  static String get secretKey => dotenv.env['SECRET_KEY'] ?? '';
}