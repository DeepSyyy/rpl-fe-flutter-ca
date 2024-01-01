import 'package:flutter/material.dart';

class KeyPointsWidget extends StatelessWidget {
  const KeyPointsWidget(
      {super.key, required this.counter, required this.keyPoints});
  final int counter;
  final List<String> keyPoints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: counter,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Key Point ${index + 1}: ${keyPoints[index]} "),
          );
        },
      ),
    );
  }
}
