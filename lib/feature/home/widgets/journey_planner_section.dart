import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'journey_card.dart';

class JourneyPlannerSection extends StatelessWidget {
  const JourneyPlannerSection({
    super.key,
    this.onReservedTap,
    this.onUnreservedTap,
    this.onPlatformTap,
  });

  final VoidCallback? onReservedTap;
  final VoidCallback? onUnreservedTap;
  final VoidCallback? onPlatformTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Journey Planner',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 27,
              color: AppTheme.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 19),
        SizedBox(
          height: 214,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                Expanded(
                  child: JourneyCard(
                    title: 'Reserved',
                    assetPath: 'assets/images/journey_reserved.jpg',
                    onTap: onReservedTap,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: JourneyCard(
                    title: 'Unreserved',
                    assetPath: 'assets/images/journey_unreserved.jpg',
                    onTap: onUnreservedTap,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: JourneyCard(
                    title: 'Platform',
                    assetPath: 'assets/images/journey_platform.jpg',
                    onTap: onPlatformTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
