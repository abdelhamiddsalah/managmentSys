// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';
import 'package:managerestaurent/features/wallet/logic/stripe_function.dart';
import 'package:managerestaurent/features/wallet/ui/widgets/wallet_card.dart';
import 'package:managerestaurent/features/wallet/ui/widgets/wallet_header.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WalletHeader(),
            SizedBox(height: 30),
            WalletCard(),
            SizedBox(height: 20),
           // WalletAddOptions(),
            SizedBox(height: 40),
            _AddMoneyButton(),
          ],
        ),
      ),
    );
  }
}

class _AddMoneyButton extends StatelessWidget {
  const _AddMoneyButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff00B0B0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          PaymentFunction.managepayment(120, 'USD');
        },
        child: Center(
          child: Text(
            'Pay Now',
            style: Styles.titleinforget,
          ),
        ),
      ),
    );
  }
}
