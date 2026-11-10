import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../booking/screens/booking_details_screen.dart';
import '../../home/screens/rail_one_home_screen.dart';
import '../widgets/railone_bottom_navigation.dart';
import '../../../theme/app_theme.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          RailOneHomeScreen(
            onNavigateToBookings: () => _onTabSelected(1),
          ),
          BookingDetailsScreen(
            onBack: () => _onTabSelected(0),
          ),
          const _ProfilePlaceholderTab(),
          const _MenuPlaceholderTab(),
        ],
      ),
      bottomNavigationBar: RailOneBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}

class _ProfilePlaceholderTab extends StatelessWidget {
  const _ProfilePlaceholderTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('You (Profile)'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8F0FE),
                ),
                child: const Icon(Icons.person, size: 50, color: Color(0xFF0866F5)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Abhishek Sharma',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.navy,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '+91 9557953242',
                style: GoogleFonts.myanmarKhyay(
                  fontSize: 15,
                  color: AppTheme.mutedText,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                color: const Color(0xFFF7F9FC),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R-Wallet Balance',
                        style: GoogleFonts.myanmarKhyay(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '₹450.00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuPlaceholderTab extends StatelessWidget {
  const _MenuPlaceholderTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Menu & Services'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          _buildMenuItem(Icons.train_outlined, 'Indian Railways Services'),
          _buildMenuItem(Icons.support_agent_outlined, 'Rail Madad Helpdesk'),
          _buildMenuItem(Icons.fastfood_outlined, 'IRCTC e-Catering'),
          _buildMenuItem(Icons.hotel_outlined, 'Retiring Rooms & Lounge'),
          _buildMenuItem(Icons.notifications_none, 'Notification Settings'),
          _buildMenuItem(Icons.security_outlined, 'Privacy & Terms'),
          _buildMenuItem(Icons.info_outline, 'About RailOne'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F5F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF0866F5), size: 22),
      ),
      title: Text(
        title,
        style: GoogleFonts.myanmarKhyay(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
