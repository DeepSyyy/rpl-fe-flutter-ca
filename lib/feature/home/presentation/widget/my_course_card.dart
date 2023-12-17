import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 86,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Experience Design Essentials - Adobe XD UI UX Design",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Nama Mentor",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7B8CB5)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "60%",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
          )
        ],
      ),
    );
  }
}
