import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.dataBank, required this.isCheck});
  final String dataBank;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataBank,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'PT Courze Membangun Bangsa',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7B8CB5),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isCheck ? Icons.check_circle : Icons.circle_outlined,
            color: isCheck ? AppColor.primary : Colors.grey,
          ),
        ],
      ),
    );
  }
}
