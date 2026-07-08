// Smoke test: the Nextel app boots to the splash screen showing the brand name.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nextel_connect/main.dart';
import 'package:nextel_connect/services/user_service.dart';
import 'package:nextel_connect/services/progress_service.dart';

void main() {
  testWidgets('App boots to the splash screen', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await UserService.instance.init();
    await ProgressService.instance.init();

    await tester.pumpWidget(const NextelApp());
    await tester.pump();

    // Splash screen shows the brand name and tagline.
    expect(find.text('Nextel'), findsWidgets);
    expect(find.text('Your World. Your Network.'), findsOneWidget);

    // Let the splash auto-navigation timer elapse so no timers remain pending,
    // then settle onto the first post-splash screen (onboarding).
    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pump(const Duration(milliseconds: 700));
    expect(find.text('Master the Telecom Industry'), findsOneWidget);
  });
}
