import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

class OfferingData {
  final String label;
  final IconData icon;
  final Color background;
  final Color iconColor;
  final VoidCallback? onTap;

  const OfferingData(
    this.label,
    this.icon,
    this.background,
    this.iconColor, {
    this.onTap,
  });
}

class OfferingTile extends StatelessWidget {
  final OfferingData data;

  const OfferingTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.onTap ?? () {},
      borderRadius: BorderRadius.circular(17),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: data.background,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(data.icon, size: 48, color: data.iconColor),
            ),
          ),
          const SizedBox(height: 9),
          Expanded(
            child: Text(
              data.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.myanmarKhyay(
                color: AppTheme.mutedText,
                fontSize: 13,
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
