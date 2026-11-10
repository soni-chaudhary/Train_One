import 'package:flutter/material.dart';

class ThankYouBanner extends StatelessWidget {
  const ThankYouBanner({
    super.key,
    required this.passengerName,
  });

  final String passengerName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 11),
      child: Text(
        'Thank You $passengerName, Happy Journey !',
        style: TextStyle(
          fontFamily: 'MyanmarKhyay',
          color: Colors.grey.shade500,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
