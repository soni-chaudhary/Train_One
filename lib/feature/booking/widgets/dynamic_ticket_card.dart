import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class DynamicTicketCard extends StatefulWidget {
  const DynamicTicketCard({
    super.key,
    required this.bookingDate,
    required this.bookingTime,
    required this.trainNumber,
  });

  final String bookingDate;
  final String bookingTime;
  final String trainNumber;

  @override
  State<DynamicTicketCard> createState() => _DynamicTicketCardState();
}

class _DynamicTicketCardState extends State<DynamicTicketCard> {
  Duration _remaining = const Duration(minutes: 4, seconds: 22);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      if (_remaining.inSeconds <= 1) {
        setState(() => _remaining = Duration.zero);
      } else {
        setState(
          () => _remaining = Duration(seconds: _remaining.inSeconds - 1),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _countdown {
    final minutes = _remaining.inMinutes.toString().padLeft(2, '0');
    final seconds = (_remaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.ticketDark,
        borderRadius: BorderRadius.circular(3),
        border: const Border(
          top: BorderSide(color: AppColors.ticketOrange, width: 8),
          bottom: BorderSide(color: AppColors.ticketOrange, width: 8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // LEFT: INDIAN RAILWAYS
            const _RailwayTicketSideLabel(
              text: 'INDIAN RAILWAYS',
              quarterTurns: 3,
            ),

            // CENTER: TICKET CONTENT
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 9),

                  Text(
                    'Dynamic preview will close in',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    _countdown,
                    style: GoogleFonts.myanmarKhyay(
                      color: AppColors.countdownOrange,
                      fontSize: 44,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    'Ticket Booking Date & Time',
                    style: GoogleFonts.myanmarKhyay(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '${widget.bookingDate}, ${widget.bookingTime}',
                    style: GoogleFonts.myanmarKhyay(
                      color: AppColors.ticketOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    widget.trainNumber,
                    style: GoogleFonts.myanmarKhyay(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Ticket is Non-Transferable',
                    style: GoogleFonts.myanmarKhyay(
                      color: Colors.white.withValues(alpha: 0.90),
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 13),
                ],
              ),
            ),

            // RIGHT: भारतीय रेल
            const _RailwayTicketSideLabel(
              text: 'भारतीय रेल',
              quarterTurns: 1,
              isHindi: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _RailwayTicketSideLabel extends StatelessWidget {
  const _RailwayTicketSideLabel({
    required this.text,
    required this.quarterTurns,
    this.isHindi = false,
  });

  final String text;
  final int quarterTurns;
  final bool isHindi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // Dashed vertical line
            Expanded(
              child: CustomPaint(
                painter: _DashedVerticalLinePainter(
                  color: Colors.white.withValues(alpha: 0.35),
                ),
              ),
            ),

            // Vertical railway text
            RotatedBox(
              quarterTurns: quarterTurns,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  text,
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.myanmarKhyay(
                    color: Colors.white.withValues(alpha: 0.70),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: isHindi ? 0 : 1.1,
                  ),
                ),
              ),
            ),

            // Dashed vertical line
            Expanded(
              child: CustomPaint(
                painter: _DashedVerticalLinePainter(
                  color: Colors.white.withValues(alpha: 0.35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedVerticalLinePainter extends CustomPainter {
  _DashedVerticalLinePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    const dashHeight = 5.0;
    const gap = 4.0;

    double y = 0;

    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, (y + dashHeight).clamp(0, size.height)),
        paint,
      );

      y += dashHeight + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
