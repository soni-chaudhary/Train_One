import 'package:flutter/material.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({
    super.key,
    required this.mobileNumber,
    this.onBack,
  });

  final String mobileNumber;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 76,
      leadingWidth: 58,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
          style: IconButton.styleFrom(
            side: const BorderSide(color: Colors.white54),
            shape: const CircleBorder(),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Booking Details',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Mobile: $mobileNumber',
            style: const TextStyle(
              fontFamily: 'MyanmarKhyay',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
