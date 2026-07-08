import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/user_service.dart';
import '../onboarding/onboarding_screen.dart';
import '../auth/welcome_screen.dart';
import '../home/home_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );
  late final AnimationController _glowCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  late final Animation<double> _scale = Tween<double>(begin: 0.5, end: 1.0)
      .animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut));
  late final Animation<double> _tagline = CurvedAnimation(
    parent: _logoCtrl,
    curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
  );

  @override
  void initState() {
    super.initState();
    _logoCtrl.forward();
    _glowCtrl.forward();
    Future.delayed(const Duration(milliseconds: 2500), _next);
  }

  void _next() {
    if (!mounted) return;
    final user = UserService.instance;
    Widget target;
    if (!user.hasOnboarded) {
      target = const OnboardingScreen();
    } else if (!user.isLoggedIn) {
      target = const WelcomeScreen();
    } else {
      target = const HomeShell();
    }
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, anim, __) =>
            FadeTransition(opacity: anim, child: target),
      ),
    );
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF124A34), AppColors.primaryDark],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: _scale,
                child: AnimatedBuilder(
                  animation: _glowCtrl,
                  builder: (context, child) {
                    return Container(
                      width: 148,
                      height: 148,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.success
                                .withValues(alpha: 0.4 * _glowCtrl.value),
                            blurRadius: 50 * _glowCtrl.value,
                            spreadRadius: 8 * _glowCtrl.value,
                          ),
                          BoxShadow(
                            color: AppColors.gold
                                .withValues(alpha: 0.25 * _glowCtrl.value),
                            blurRadius: 70 * _glowCtrl.value,
                            spreadRadius: 4 * _glowCtrl.value,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(22),
                      child: child,
                    );
                  },
                  child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 32),
              FadeTransition(
                opacity: _tagline,
                child: Column(
                  children: [
                    Text('Nextel',
                        style: AppText.display(context,
                            size: 40, color: Colors.white)),
                    const SizedBox(height: 8),
                    Text('Your World. Your Network.',
                        style: AppText.body(context,
                            size: 15, color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
