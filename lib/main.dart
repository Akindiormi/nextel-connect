import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/app_theme.dart';
import 'services/user_service.dart';
import 'services/progress_service.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserService.instance.init();
  await ProgressService.instance.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const NextelApp());
}

class NextelApp extends StatelessWidget {
  const NextelApp({super.key});

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
