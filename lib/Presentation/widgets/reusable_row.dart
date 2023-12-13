import 'package:flutter/material.dart';

import '../../constants.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    super.key,
    required this.text,
    required this.text2
  });

  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(color: kInactiveTabColor),
        ),
        Text(
          text2,
          style: const TextStyle(color: kHeaderColor),
        )
      ],
    );
  }
}