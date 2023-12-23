import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> dataBank = [
  "BCA",
  "BNI",
  "BRI",
  "Mandiri",
  "Bank Jatim",
  "Bank Jateng",
  "Bank BJB",
  "Bank DKI",
];

class PaymentChoiceCard extends StatefulWidget {
  const PaymentChoiceCard({super.key});

  @override
  State<PaymentChoiceCard> createState() => _PaymentChoiceCardState();
}

class _PaymentChoiceCardState extends State<PaymentChoiceCard> {
  String selectedBank = 'BCA';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Choice Card",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: dataBank.length * 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView.builder(
                itemCount: dataBank.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  String bank = dataBank[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedBank = bank;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: PaymentCard(
                        dataBank: dataBank[index],
                        isCheck: selectedBank == bank,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
