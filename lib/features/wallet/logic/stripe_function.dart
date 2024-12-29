import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:managerestaurent/features/wallet/logic/stripe_apikeys.dart';

abstract class PaymentFunction {
  static Future<void> managepayment(int amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret((amount * 100).toString(), currency);

      await _initializePaymentSheet(clientSecret);

      await Stripe.instance.presentPaymentSheet();
      debugPrint("Payment completed successfully!");
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        debugPrint("Payment canceled by the user.");
      } else {
        debugPrint("StripeException: ${e.error.localizedMessage}");
        throw Exception("Stripe error: ${e.error.localizedMessage}");
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
      throw Exception("An unexpected error occurred: $e");
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Abdelhamid',
        style: ThemeMode.system,
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();

    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${PaymentKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        },
      );

      return response.data['client_secret'];
    } catch (e) {
      debugPrint("Error fetching client secret: $e");
      throw Exception("Failed to fetch client secret: $e");
    }
  }
}
