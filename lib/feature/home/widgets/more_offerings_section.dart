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
        Icons.alt_route,
        const Color(0xFFFDEEF4),
        const Color(0xFFD64593),
        onTap: () => onSelectOffering?.call('Search Trains'),
      ),
      OfferingData(
        'PNR\nStatus',
        Icons.confirmation_number,
        const Color(0xFFE8FCE9),
        const Color(0xFF2E7D32),
        onTap: () => onSelectOffering?.call('PNR Status'),
      ),
      OfferingData(
        'Coach\nPosition',
        Icons.train,
        const Color(0xFFE1F8FC),
        const Color(0xFF2B6CB0),
        onTap: () => onSelectOffering?.call('Coach Position'),
      ),
      OfferingData(
        'Track Your\nTrain',
        Icons.train_outlined,
        const Color(0xFFFFF4DC),
        const Color(0xFFD98200),
        onTap: () => onSelectOffering?.call('Track Your Train'),
      ),
      OfferingData(
        'Order\nFood',
        Icons.restaurant,
        const Color(0xFFE6E6FF),
        const Color(0xFF4F4EA3),
        onTap: () => onSelectOffering?.call('Order Food'),
      ),
      OfferingData(
        'File\nRefund',
        Icons.receipt_long_outlined,
        const Color(0xFFEDEDED),
        const Color(0xFF3F3F46),
        onTap: () => onSelectOffering?.call('File Refund'),
      ),
      OfferingData(
        'Rail\nMadad',
        Icons.handshake_outlined,
        const Color(0xFFF9E1E5),
        const Color(0xFFD63D49),
        onTap: () => onSelectOffering?.call('Rail Madad'),
      ),
      OfferingData(
        'Go To\nWAVES',
        Icons.graphic_eq,
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
