import 'package:flutter/material.dart';

class SneakPeakView extends StatelessWidget {
  const SneakPeakView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 70,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.deepPurple),
    );
  }
}
