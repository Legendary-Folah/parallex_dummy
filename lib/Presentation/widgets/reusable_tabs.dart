import 'package:flutter/material.dart';

class ReusableTabs extends StatelessWidget {
  const ReusableTabs({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 55,
        padding: const EdgeInsets.only(left: 14, right: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, wordSpacing: 3.0),
        ),
      ),
    );
  }
}
