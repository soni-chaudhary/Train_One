import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class FactCard extends StatelessWidget {
  final String assetPath;
  final String caption;
  final double width;
  final double imageHeight;
  final VoidCallback? onTap;

  const FactCard({
    super.key,
    required this.assetPath,
    required this.caption,
    required this.width,
    this.imageHeight = 116,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                width: width,
                height: imageHeight,
                child: Image.asset(
                  assetPath,
                  width: width,
                  height: imageHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: width,
                    height: imageHeight,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      size: 36,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              caption,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'MyanmarKhyay',
                fontSize: 12.5,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: AppColors.subtitleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
