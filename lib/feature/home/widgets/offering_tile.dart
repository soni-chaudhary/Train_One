import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/app_theme.dart';

class OfferingData {
  final String label;
  final String svgAsset;
  final Color background;
  final Color iconColor;
  final VoidCallback? onTap;

  const OfferingData(
    this.label,
    this.svgAsset,
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
      borderRadius: BorderRadius.circular(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: data.background,
                borderRadius: BorderRadius.circular(14),
              ),
              child: SvgPicture.asset(
                data.svgAsset,
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(data.iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                data.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'MyanmarKhyay',
                  color: AppTheme.mutedText,
                  fontSize: 11.5,
                  height: 1.15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
