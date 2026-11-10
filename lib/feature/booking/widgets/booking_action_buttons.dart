import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({
    super.key,
    this.onConnectingJourney,
    this.onBookAgain,
  });

  final VoidCallback? onConnectingJourney;
  final VoidCallback? onBookAgain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
              onPressed: onConnectingJourney,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(
                  color: AppColors.disabledBorder,
                  width: 1.2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'Book Connecting Journey',
                style: TextStyle(
                  fontFamily: 'MyanmarKhyay',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton(
              onPressed: onBookAgain,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'Book Again',
                style: TextStyle(
                  fontFamily: 'MyanmarKhyay',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
