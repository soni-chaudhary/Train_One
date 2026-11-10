import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';
import 'fact_card.dart';

class DidYouKnowSection extends StatelessWidget {
  const DidYouKnowSection({super.key, this.onSelectFact});

  final ValueChanged<String>? onSelectFact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Do You know?',
            style: GoogleFonts.myanmarKhyay(
              fontSize: 27,
              color: AppTheme.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            children: [
              FactCard(
                assetPath: 'assets/images/fact_train.jpg',
                caption: 'First ever passenger train in India ran between Mumbai and Thane in 1853.',
                onTap: () => onSelectFact?.call('First passenger train'),
              ),
              const SizedBox(width: 20),
              FactCard(
                assetPath: 'assets/images/fact_bridge.jpg',
                caption: 'Chenab Railway Bridge: World\'s highest railway bridge at 359m above river bed.',
                onTap: () => onSelectFact?.call('Chenab Railway Bridge'),
              ),
              const SizedBox(width: 20),
              FactCard(
                assetPath: 'assets/images/fact_green.jpg',
                caption: 'Indian Railways is working to become Net Zero Carbon Emitter by 2030.',
                onTap: () => onSelectFact?.call('Green Railways'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
