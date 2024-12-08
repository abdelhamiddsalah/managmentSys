import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/wallet.png',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Wallet', style: Styles.discoverText),
              Text('\$ 100', style: Styles.titleinloginpage),
            ],
          ),
        ],
      ),
    );
  }
}
