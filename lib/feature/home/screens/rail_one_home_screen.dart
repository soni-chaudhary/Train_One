import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';
import '../widgets/did_you_know_section.dart';
import '../widgets/home_header.dart';
import '../widgets/journey_planner_section.dart';
import '../widgets/more_offerings_section.dart';

class RailOneHomeScreen extends StatelessWidget {
  const RailOneHomeScreen({
    super.key,
    this.onNavigateToBookings,
    this.onSelectOffering,
  });

  final VoidCallback? onNavigateToBookings;
  final ValueChanged<String>? onSelectOffering;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeader(
              onNotificationTap: () {
                _showSnackBar(context, 'You have 3 unread notifications');
              },
              onLanguageTap: () {
                _showSnackBar(context, 'Language selector');
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Text(
                        'Hi, Guest!',
                        style: GoogleFonts.myanmarKhyay(
                          color: AppTheme.navy,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    JourneyPlannerSection(
                      onReservedTap: () {
                        if (onNavigateToBookings != null) {
                          onNavigateToBookings!();
                        } else {
                          _showSnackBar(context, 'Reserved Journey Planner');
                        }
                      },
                      onUnreservedTap: () {
                        _showSnackBar(context, 'Unreserved Ticket Booking');
                      },
                      onPlatformTap: () {
                        _showSnackBar(context, 'Platform Ticket Booking');
                      },
                    ),
                    const SizedBox(height: 32),
                    MoreOfferingsSection(
                      onSelectOffering: (offering) {
                        if (offering == 'PNR Status' && onNavigateToBookings != null) {
                          onNavigateToBookings!();
                        } else {
                          _showSnackBar(context, '$offering selected');
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    DidYouKnowSection(
                      onSelectFact: (fact) {
                        _showSnackBar(context, 'Fact: $fact');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
