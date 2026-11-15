import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class JourneyCard extends StatelessWidget {
  final String title;
  final String assetPath;
  final VoidCallback? onTap;

  const JourneyCard({
    super.key,
    required this.title,
    required this.assetPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.train,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 13,
              color: AppTheme.mutedText,
              height: 1.1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
