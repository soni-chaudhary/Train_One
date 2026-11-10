import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class TicketSummaryCard extends StatelessWidget {
  const TicketSummaryCard({
    super.key,
    required this.ticketNumber,
    required this.source,
    required this.destination,
    required this.distance,
    required this.passenger,
    required this.ticketType,
    required this.trainType,
    required this.className,
    required this.fare,
    required this.route,
    required this.irReference,
  });

  final String ticketNumber;
  final String source;
  final String destination;
  final String distance;
  final String passenger;
  final String ticketType;
  final String trainType;
  final String className;
  final String fare;
  final String route;
  final String irReference;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          _TopRow(ticketNumber: ticketNumber),
          const SizedBox(height: 14),
          _InfoRow(
            leftLabel: 'Source',
            leftValue: source,
            rightLabel: 'Destination',
            rightValue: destination,
            rightAlign: true,
          ),
          const SizedBox(height: 14),
          _InfoRow(
            leftLabel: 'Distance',
            leftValue: distance,
            rightLabel: 'Passenger',
            rightValue: passenger,
            rightAlign: true,
          ),
          const SizedBox(height: 14),
          _InfoRow(
            leftLabel: 'Ticket Type',
            leftValue: ticketType,
            rightLabel: 'Train Types',
            rightValue: trainType,
            rightAlign: true,
          ),
          const SizedBox(height: 14),
          _InfoRow(
            leftLabel: 'Class',
            leftValue: className,
            rightLabel: 'Fare',
            rightValue: fare,
            rightAlign: true,
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '↪ Via: $route',
              style: GoogleFonts.myanmarKhyay(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'IR:$irReference',
              style: GoogleFonts.myanmarKhyay(
                color: const Color(0xFF999999),
                fontSize: 12,
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(height: 19),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Valid for start of journey within 3 hour or until departure of the first train.',
              style: GoogleFonts.myanmarKhyay(
                color: const Color(0xFF9A9A9A),
                fontSize: 10,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  const _TopRow({required this.ticketNumber});

  final String ticketNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Journey Ticket',
              style: GoogleFonts.myanmarKhyay(
                color: const Color(0xFF8D8D8D),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              ticketNumber,
              style: GoogleFonts.myanmarKhyay(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF7ED),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.success),
              const SizedBox(width: 5),
              Text(
                'ACTIVE',
                style: GoogleFonts.myanmarKhyay(
                  color: AppColors.success,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
    this.rightAlign = false,
  });

  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;
  final bool rightAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _InfoColumn(label: leftLabel, value: leftValue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _InfoColumn(
            label: rightLabel,
            value: rightValue,
            alignEnd: rightAlign,
          ),
        ),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.myanmarKhyay(
            color: const Color(0xFF8B8B8B),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          textAlign: alignEnd ? TextAlign.right : TextAlign.left,
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: GoogleFonts.myanmarKhyay(
            color: AppColors.textPrimary,
            fontSize: 13,
            fontWeight: label == 'Fare' ? FontWeight.w700 : FontWeight.w600,
            height: 1.2,
          ),
          textAlign: alignEnd ? TextAlign.right : TextAlign.left,
        ),
      ],
    );
  }
}
