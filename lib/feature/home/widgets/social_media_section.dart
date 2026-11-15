import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key, this.onSelectPlatform});

  final ValueChanged<String>? onSelectPlatform;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Follow Us On Social Media Platforms',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 17,
              color: AppTheme.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 415 / 195,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/sunset_train_over_tropical.png',
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _SocialIcon(
                          onTap: () => onSelectPlatform?.call('X (Twitter)'),
                          child: _circle(
                            Colors.black,
                            const Text(
                              '𝕏',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        _SocialIcon(
                          onTap: () => onSelectPlatform?.call('Facebook'),
                          child: _circle(
                            const Color(0xFF1877F2),
                            const Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        _SocialIcon(
                          onTap: () => onSelectPlatform?.call('Instagram'),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xFFFEDA75),
                                  Color(0xFFFA7E1E),
                                  Color(0xFFD62976),
                                  Color(0xFF962FBF),
                                  Color(0xFF4F5BD5),
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                        _SocialIcon(
                          onTap: () => onSelectPlatform?.call('YouTube'),
                          child: Container(
                            width: 44,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF0000),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _circle(Color color, Widget child) => Container(
    width: 42,
    height: 42,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    child: child,
  );
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}
