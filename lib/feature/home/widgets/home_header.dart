import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.onNotificationTap, this.onLanguageTap});

  final VoidCallback? onNotificationTap;
  final VoidCallback? onLanguageTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: onLanguageTap,
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  width: 42,
                  height: 42,
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
                        height: 0.9,
                        fontSize: 14,
                        color: Color(0xFF075BEA),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Center(child: _RailOneLogo()),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onNotificationTap,
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFF0F0F0),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        size: 22,
                        color: Colors.black87,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE52835),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
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
}

class _RailOneLogo extends StatelessWidget {
  const _RailOneLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/railone.png',
      height: 28,
      fit: BoxFit.contain,
      semanticLabel: 'RailOne',
    );
  }
}
