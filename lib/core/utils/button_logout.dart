import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    super.key,
    required this.label,
    required this.onTap,
    required this.isExpand,
  });

  final String label;
  final Function onTap;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Align(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onTap(),
                child: Container(
                  width: isExpand == null
                      ? null
                      : isExpand!
                          ? double.infinity
                          : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFD92D20)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
