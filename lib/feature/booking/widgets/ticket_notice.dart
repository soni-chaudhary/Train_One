import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class TicketNotice extends StatelessWidget {
  const TicketNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(
            fontFamily: 'MyanmarKhyay',
            color: AppColors.warningText,
            fontSize: 11,
            height: 1.35,
          ),
          children: [
            TextSpan(
              text: 'Note: ',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            TextSpan(
              text:
                  'This ticket is non refundable. Ticket is stored locally on the device. Please do not change your handset or perform factory reset.',
            ),
          ],
        ),
      ),
    );
  }
}
