import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/header.dart';

class TransaksiComponent extends StatefulWidget {
  const TransaksiComponent({super.key});

  @override
  State<TransaksiComponent> createState() => _TransaksiComponentState();
}

class _TransaksiComponentState extends State<TransaksiComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderPage(),
        const SizedBox(
          height: 24,
        ),
        Text("data"),
      ],
    );
  }
}
