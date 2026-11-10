import 'package:flutter/material.dart';

import '../widgets/booking_action_buttons.dart';
import '../widgets/booking_app_bar.dart';
import '../widgets/dynamic_ticket_card.dart';
import '../widgets/thank_you_banner.dart';
import '../widgets/ticket_notice.dart';
import '../widgets/ticket_summary_card.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
    this.onBack,
  });

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBar(
        mobileNumber: '9557953242',
        onBack: onBack,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ThankYouBanner(
                passengerName: 'Abhishek Sharma,',
              ),
              const SizedBox(height: 10),
              const DynamicTicketCard(
                bookingDate: '11 Sep 2026',
                bookingTime: '20:33',
                trainNumber: 'R14069',
              ),
              const TicketSummaryCard(
                ticketNumber: 'XC4IEG9127',
                source: 'ANAND VIHAR TERMINAL',
                destination: 'MUZAFFARNAGAR',
                distance: '116 km',
                passenger: '2 Adult, 0 Child',
                ticketType: 'JOURNEY',
                trainType: 'MAIL/EXPRESS',
                className: 'SECOND',
                fare: '₹120.00',
                route: 'MTC',
                irReference: '07AAAGM0289C1ZL',
              ),
              const TicketNotice(),
              BookingActionButtons(
                onConnectingJourney: () {
                  _showMessage(context, 'Connecting journey selected');
                },
                onBookAgain: () {
                  _showMessage(context, 'Book again selected');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
