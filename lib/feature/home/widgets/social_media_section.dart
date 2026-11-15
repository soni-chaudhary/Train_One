import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key, this.onSelectPlatform});

  final ValueChanged<String>? onSelectPlatform;

  static const _platforms = <(String, IconData, Color)>[
    ('X (Twitter)', Icons.alternate_email, Color(0xFF111827)),
    ('Facebook', Icons.facebook, Color(0xFF1877F2)),
    ('Instagram', Icons.camera_alt_outlined, Color(0xFFE1306C)),
    ('YouTube', Icons.play_circle_outline, Color(0xFFFF0000)),
  ];

  void _showSocialSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Follow Us On Social Media Platforms',
                  style: TextStyle(
                    fontFamily: 'MyanmarKhyay',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.navy,
                  ),
                ),
                const SizedBox(height: 12),
                for (final (name, icon, color) in _platforms)
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    leading: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: color, size: 18),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'MyanmarKhyay',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.navy,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.open_in_new_rounded,
                      size: 16,
                      color: AppColors.mutedText,
                    ),
                    onTap: () {
                      Navigator.of(sheetContext).pop();
                      onSelectPlatform?.call(name);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: const Color(0xFFF5F8FF),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => _showSocialSheet(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDCE6F7)),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  size: 18,
                  color: AppColors.primary,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Follow Us On Social Media Platforms',
                    style: TextStyle(
                      fontFamily: 'MyanmarKhyay',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.navy,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
