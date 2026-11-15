import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import 'fact_card.dart';

class DidYouKnowSection extends StatelessWidget {
  const DidYouKnowSection({super.key, this.onSelectFact});

  final ValueChanged<String>? onSelectFact;

  static const double _horizontalPadding = 16;
  static const double _cardSpacing = 12;
  static const double _imageHeight = 116;
  static const double _sectionHeight = 196;

  static const List<({String assetPath, String caption, String title})> _facts =
      [
        (
          assetPath: 'assets/images/fact_train.jpg',
          caption:
              'First ever passenger train in India ran between Mumbai and Thane in 1853.',
          title: 'First passenger train',
        ),
        (
          assetPath: 'assets/images/fact_bridge.jpg',
          caption:
              'Chenab Railway Bridge: World\'s highest railway bridge at 359m above river bed.',
          title: 'Chenab Railway Bridge',
        ),
        (
          assetPath: 'assets/images/noney_bridge.jpg',
          caption:
              'Noney Bridge is going to be world\'s tallest railway bridge pier at a height of 141 meters.',
          title: 'Noney Bridge',
        ),
        (
          assetPath: 'assets/images/hubballi_railway_station.jpg',
          caption:
              'Shree Siddharoodha Swamiji Railway Station Hubballi is world\'s longest Railway Platform with length of 1505 meters.',
          title: 'Hubballi Railway Station',
        ),
        (
          assetPath: 'assets/images/electrication.jpeg',
          caption: '99% Electrification is achieved in Indian Railways.',
          title: 'Electrification',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
          child: Text(
            'Do You know?',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 17,
              color: AppColors.headerText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            // Display 2 full cards + 5% of the 3rd card (2.05 cards) within the viewport:
            // leftPadding + cardWidth + spacing + cardWidth + spacing + (0.05 * cardWidth) = maxWidth
            final availableWidth =
                constraints.maxWidth - _horizontalPadding - (_cardSpacing * 2);
            final cardWidth = (availableWidth / 2.05).clamp(120.0, 400.0);

            return SizedBox(
              height: _sectionHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding,
                ),
                itemCount: _facts.length,
                separatorBuilder: (_, _) => const SizedBox(width: _cardSpacing),
                itemBuilder: (context, index) {
                  final fact = _facts[index];
                  return FactCard(
                    width: cardWidth,
                    imageHeight: _imageHeight,
                    assetPath: fact.assetPath,
                    caption: fact.caption,
                    onTap: () => onSelectFact?.call(fact.title),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
