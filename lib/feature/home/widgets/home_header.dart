import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.onNotificationTap, this.onLanguageTap});

  final VoidCallback? onNotificationTap;
  final VoidCallback? onLanguageTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Row(
          children: [
            InkWell(
              onTap: onLanguageTap,
              borderRadius: BorderRadius.circular(33),
              child: Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF0F0F0),
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'A\nअ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MyanmarKhyay',
                      height: 0.82,
                      fontSize: 22,
                      color: Color(0xFF075BEA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const _RailOneLogo(),
            const Spacer(),
            InkWell(
              onTap: onNotificationTap,
              borderRadius: BorderRadius.circular(33),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFF0F0F0),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      size: 33,
                      color: Colors.black87,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 5,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE52835),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RailOneLogo extends StatelessWidget {
  const _RailOneLogo();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 42,
          color: Colors.black,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.8,
        ),
        children: const [
          TextSpan(text: 'Rail'),
          TextSpan(
            text: 'O',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: 'ne',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
