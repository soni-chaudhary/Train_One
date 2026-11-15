import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'offering_tile.dart';

class MoreOfferingsSection extends StatelessWidget {
  const MoreOfferingsSection({super.key, this.onSelectOffering});

  final ValueChanged<String>? onSelectOffering;

  List<OfferingData> _getOfferings(BuildContext context) {
    return [
      OfferingData(
        'Search\nTrains',
        'assets/more_offering_images/search_trains.svg',
        const Color(0xFFFDEEF4),
        const Color(0xFFFFA2D6),
        onTap: () => onSelectOffering?.call('Search Trains'),
      ),
      OfferingData(
        'PNR\nStatus',
        'assets/more_offering_images/pnr_status.svg',
        const Color(0xFFE8FCE9),
        const Color(0xFF388D3C),
        onTap: () => onSelectOffering?.call('PNR Status'),
      ),
      OfferingData(
        'Coach\nPosition',
        'assets/more_offering_images/coach_position.svg',
        const Color(0xFFE1F8FC),
        const Color(0xFF5076BE),
        onTap: () => onSelectOffering?.call('Coach Position'),
      ),
      OfferingData(
        'Track Your\nTrain',
        'assets/more_offering_images/track_train.svg',
        const Color(0xFFFFF4DC),
        const Color(0xFFFCBC52),
        onTap: () => onSelectOffering?.call('Track Your Train'),
      ),
      OfferingData(
        'Order\nFood',
        'assets/more_offering_images/order_food.svg',
        const Color(0xFFE6E6FF),
        const Color(0xFF6365B0),
        onTap: () => onSelectOffering?.call('Order Food'),
      ),
      OfferingData(
        'File\nRefund',
        'assets/more_offering_images/file_refund.svg',
        const Color(0xFFEDEDED),
        const Color(0xFF474747),
        onTap: () => onSelectOffering?.call('File Refund'),
      ),
      OfferingData(
        'Rail\nMadad',
        'assets/more_offering_images/rail_madad.svg',
        const Color(0xFFF9E1E5),
        const Color(0xFFF86C6B),
        onTap: () => onSelectOffering?.call('Rail Madad'),
      ),
      OfferingData(
        'Go To\nWAVES',
        'assets/more_offering_images/go_to_waves.svg',
        const Color(0xFF5D5B78),
        Colors.white,
        onTap: () => onSelectOffering?.call('Go To WAVES'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final offerings = _getOfferings(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'More Offerings',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 17,
              color: AppTheme.navy,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: offerings.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) =>
                OfferingTile(data: offerings[index]),
          ),
        ),
      ],
    );
  }
}
