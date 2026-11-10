import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class FactCard extends StatelessWidget {
  final String assetPath;
  final String caption;
  final VoidCallback? onTap;

  const FactCard({
    super.key,
    required this.assetPath,
    required this.caption,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 288,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.image,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              caption,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'MyanmarKhyay',
                fontSize: 16,
                height: 1.25,
                fontWeight: FontWeight.w600,
                color: AppTheme.navy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
