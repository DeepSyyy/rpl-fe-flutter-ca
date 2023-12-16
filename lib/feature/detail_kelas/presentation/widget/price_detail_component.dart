import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceComponent extends StatelessWidget {
  const PriceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Rp400.000",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Expanded(
          // height: 50,
          child: ButtonCustom(label: "Beli", onTap: () => {}, isExpand: false),
        )
      ]),
    );
  }
}
