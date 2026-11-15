import 'package:flutter/material.dart';
import '../../booking/screens/booking_details_screen.dart';
import '../../home/screens/rail_one_home_screen.dart';
import '../widgets/railone_bottom_navigation.dart';
import '../widgets/railone_menu_drawer.dart';
import '../../../theme/app_theme.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, 2);
  }

  void _onTabSelected(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openEndDrawer();
      return;
    }
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: RailOneMenuDrawer(
        onSelectItem: (item) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(item)));
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          RailOneHomeScreen(onNavigateToBookings: () => _onTabSelected(1)),
          BookingDetailsScreen(onBack: () => _onTabSelected(0)),
          const _ProfilePlaceholderTab(),
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
      appBar: AppBar(title: const Text('You (Profile)'), centerTitle: true),
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
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF0866F5),
                ),
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
                style: TextStyle(
                  fontFamily: 'MyanmarKhyay',
                  fontSize: 15,
                  color: AppTheme.mutedText,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                color: const Color(0xFFF7F9FC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'R-Wallet Balance',
                        style: TextStyle(
                          fontFamily: 'MyanmarKhyay',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.mutedText,
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
