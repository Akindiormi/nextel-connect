import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/app_theme.dart';
import 'services/user_service.dart';
import 'services/progress_service.dart';
import 'services/notification_service.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserService.instance.init();
  await ProgressService.instance.init();
  if (UserService.instance.notificationsEnabled) {
    // The user opened the app right now — no need to nag them again today.
    await NotificationService.instance.cancelTodayRemaining();
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const NextelApp());
}

class NextelApp extends StatefulWidget {
  const NextelApp({super.key});

  @override
  State<NextelApp> createState() => _NextelAppState();
}

class _NextelAppState extends State<NextelApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Coming back to the foreground also counts as "used today".
    if (state == AppLifecycleState.resumed &&
        UserService.instance.notificationsEnabled) {
      NotificationService.instance.cancelTodayRemaining();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild the whole app when the theme preference changes.
    return AnimatedBuilder(
      animation: UserService.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Nextel',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: UserService.instance.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
