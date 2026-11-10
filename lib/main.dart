import 'package:flutter/material.dart';

import 'feature/splash/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const RailOneApp());
}

class RailOneApp extends StatelessWidget {
  const RailOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RailOne',
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}

