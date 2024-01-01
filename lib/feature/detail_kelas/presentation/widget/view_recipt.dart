import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';

class ViewReceipt extends StatelessWidget {
  const ViewReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Kelas sudah dibeli.',
            style: TextStyle(color: Colors.grey),
          ),
          Material(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              // onTap: () {
              //   Navigator.pushNamed(
              //     context,
              //     AppRoute.detailBooking,
              //     arguments: bookedData,
              //   );
              // },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 14,
                ),
                child: Text(
                  'View Receipt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
