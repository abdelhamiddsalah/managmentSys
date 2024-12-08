import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            'Wallet',
            style: Styles.titleinloginpage,
          ),
        ),
      ),
    );
  }
}
