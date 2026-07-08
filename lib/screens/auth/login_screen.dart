import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../home/home_shell.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;

  void _login() async {
    if (!_email.text.contains('@') || _password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid email and password.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() => _loading = true);
    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 700));

    // Local-only auth: reuse an existing profile or create one from the email.
    final existing = UserService.instance.user;
    if (existing == null) {
      final name = _email.text.split('@').first;
      await UserService.instance.saveUser(AppUser(
        name: name.isEmpty ? 'Learner' : name,
        email: _email.text.trim(),
        username: name,
      ));
    }
    await UserService.instance.login();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeShell()),
      (route) => false,
    );
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Reset Password', style: AppText.heading(context, size: 18)),
        content: Text(
          'Nextel stores your learning progress on your device. If you cannot '
          'sign in, simply create a new account — your courses and tools are '
          'always available.',
          style: AppText.body(context, size: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: GlassAppBar(leading: const GlassBackButton(), title: 'Log In'),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 96,
                height: 96,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentEmerald.withValues(alpha: 0.2),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text('Welcome back',
                textAlign: TextAlign.center,
                style: AppText.display(context, size: 26)),
            const SizedBox(height: 6),
            Text('Continue your telecom learning journey',
                textAlign: TextAlign.center,
                style: AppText.body(context, size: 14)),
            const SizedBox(height: 32),
            GlassTextField(
              label: 'Email Address',
              hint: 'you@example.com',
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              icon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 18),
            GlassTextField(
              label: 'Password',
              hint: 'Your password',
              controller: _password,
              obscure: true,
              toggleObscure: true,
              icon: Icons.lock_outline_rounded,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: Text('Forgot Password?',
                    style: AppText.label(context,
                        size: 13, color: AppColors.accentEmerald)),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Log In',
              icon: Icons.login_rounded,
              loading: _loading,
              onPressed: _login,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: AppText.body(context, size: 14)),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  ),
                  child: Text('Sign Up',
                      style: AppText.label(context,
                          size: 14, color: AppColors.accentEmerald)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
