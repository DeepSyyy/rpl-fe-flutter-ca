import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyPointsComponent extends StatelessWidget {
  const KeyPointsComponent({super.key, required this.keyPointsView});
  final String keyPointsView;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                size: 24,
                color: Color(0xFFAAA5FC),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  keyPointsView,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
