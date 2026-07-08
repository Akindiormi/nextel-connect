import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/screen_scaffold.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 128,
                height: 128,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentEmerald.withValues(alpha: 0.25),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: 28),
              Text('Nextel', style: AppText.display(context, size: 40)),
              const SizedBox(height: 10),
              Text(
                'Your World. Your Network.',
                style: AppText.body(context, size: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Learn the telecom business. Build real skills. Grow with a '
                'community of entrepreneurs.',
                style: AppText.body(context, size: 14),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              PrimaryButton(
                label: 'Create Account',
                icon: Icons.person_add_alt_1_rounded,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                ),
              ),
              const SizedBox(height: 14),
              SecondaryButton(
                label: 'Log In',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
