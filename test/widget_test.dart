// Smoke + render tests for Nextel.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nextel_connect/main.dart';
import 'package:nextel_connect/theme/app_theme.dart';
import 'package:nextel_connect/services/user_service.dart';
import 'package:nextel_connect/services/progress_service.dart';
import 'package:nextel_connect/screens/profile/profile_screen.dart';
import 'package:nextel_connect/screens/courses/courses_screen.dart';
import 'package:nextel_connect/screens/community/community_screen.dart';
import 'package:nextel_connect/screens/home/home_screen.dart';

Future<void> _initServices() async {
  SharedPreferences.setMockInitialValues({});
  await UserService.instance.init();
  await ProgressService.instance.init();
  // Avoid network font fetches in tests (would otherwise surface as exceptions).
  GoogleFonts.config.allowRuntimeFetching = false;
}

Widget _host(Widget child) => MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: child),
    );

void main() {
  testWidgets('App boots to the splash screen', (WidgetTester tester) async {
    await _initServices();

    await tester.pumpWidget(const NextelApp());
    await tester.pump();

    expect(find.text('Nextel'), findsWidgets);
    expect(find.text('Your World. Your Network.'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pump(const Duration(milliseconds: 700));
    expect(find.text('Master the Telecom Industry'), findsOneWidget);
  });

  // Renders the main tab screens and asserts no layout/build exceptions —
  // guards against regressions like unbounded-height rows blanking a screen.
  testWidgets('Profile screen renders without layout errors',
      (WidgetTester tester) async {
    await _initServices();
    await tester.pumpWidget(_host(const ProfileScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
    expect(find.text('Total XP'), findsOneWidget);
    expect(find.text('Streak'), findsOneWidget);
    expect(find.text('Courses'), findsOneWidget);
  });

  testWidgets('Courses screen renders without layout errors',
      (WidgetTester tester) async {
    await _initServices();
    await tester.pumpWidget(_host(const CoursesScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Community screen renders without layout errors',
      (WidgetTester tester) async {
    await _initServices();
    await tester.pumpWidget(_host(const CommunityScreen()));
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
  });

  testWidgets('Home screen renders without layout errors',
      (WidgetTester tester) async {
    await _initServices();
    await tester.pumpWidget(_host(HomeScreen(onNavigate: (_) {})));
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
  });
}
