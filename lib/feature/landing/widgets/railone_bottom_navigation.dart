import 'package:flutter/material.dart';

class RailOneBottomNavigation extends StatelessWidget {
  const RailOneBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Color(0xFF0866F5),
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(
              icon: currentIndex == 0 ? Icons.home : Icons.home_outlined,
              label: 'Home',
              selected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _BottomNavItem(
              icon: currentIndex == 1
                  ? Icons.confirmation_num
                  : Icons.confirmation_number_outlined,
              label: 'My Bookings',
              selected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _BottomNavItem(
              icon: currentIndex == 2 ? Icons.person : Icons.person_outline,
              label: 'You',
              selected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _BottomNavItem(
              icon: Icons.menu,
              label: 'Menu',
              selected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : const Color(0xFFB3D1FF);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white24,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'MyanmarKhyay',
                color: color,
                fontSize: 12,

                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
