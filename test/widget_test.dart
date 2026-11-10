// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:railone/feature/landing/screens/landing_screen.dart';
import 'package:railone/feature/splash/splash_screen.dart';
import 'package:railone/main.dart';

void main() {
  testWidgets('App renders SplashScreen and navigates to LandingScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const RailOneApp());
    expect(find.byType(SplashScreen), findsOneWidget);

    // Fast-forward 3.5 seconds to complete splash timer and animation
    await tester.pump(const Duration(milliseconds: 3500));
    await tester.pump();

    // Verify LandingScreen is now displayed
    expect(find.byType(LandingScreen), findsOneWidget);
  });
}
