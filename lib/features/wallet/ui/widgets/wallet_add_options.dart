import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class WalletAddOptions extends StatelessWidget {
  const WalletAddOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Add to Money', style: Styles.titleinloginpage),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildOption('\$ 100'),
            _buildOption('\$ 400'),
            _buildOption('\$ 5000'),
            _buildOption('\$ 200'),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(String amount) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE9E9E2)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(amount, style: Styles.titleinloginpage),
    );
  }
}
