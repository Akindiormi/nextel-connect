import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../home/home_shell.dart';

const List<String> kNigerianStates = [
  'Abia', 'Abuja (FCT)', 'Adamawa', 'Akwa Ibom', 'Anambra', 'Bauchi',
  'Bayelsa', 'Benue', 'Borno', 'Cross River', 'Delta', 'Ebonyi', 'Edo',
  'Ekiti', 'Enugu', 'Gombe', 'Imo', 'Jigawa', 'Kaduna', 'Kano', 'Katsina',
  'Kebbi', 'Kogi', 'Kwara', 'Lagos', 'Nasarawa', 'Niger', 'Ogun', 'Ondo',
  'Osun', 'Oyo', 'Plateau', 'Rivers', 'Sokoto', 'Taraba', 'Yobe', 'Zamfara',
];

const List<String> kLearningTopics = [
  'Airtime Business', 'Data Business', 'Agency & Distribution', 'Marketing',
  'Customer Service', 'Business Finance', 'Branding', 'Scaling',
];

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _page = PageController();
  int _step = 0;

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  final _username = TextEditingController();
  final _phone = TextEditingController();

  String? _state;
  String _experience = 'Beginner';
  final Set<String> _topics = {};
  bool _acceptedTerms = false;
  String _password2 = '';

  double get _passwordStrength {
    final p = _password.text;
    double s = 0;
    if (p.length >= 6) s += 0.25;
    if (p.length >= 10) s += 0.25;
    if (RegExp(r'[A-Z]').hasMatch(p) && RegExp(r'[a-z]').hasMatch(p)) s += 0.25;
    if (RegExp(r'[0-9!@#\$&*~]').hasMatch(p)) s += 0.25;
    return s.clamp(0, 1);
  }

  Color get _strengthColor {
    if (_passwordStrength < 0.4) return const Color(0xFFEF4444);
    if (_passwordStrength < 0.75) return AppColors.gold;
    return AppColors.success;
  }

  String get _strengthLabel {
    if (_password.text.isEmpty) return '';
    if (_passwordStrength < 0.4) return 'Weak';
    if (_passwordStrength < 0.75) return 'Good';
    return 'Strong';
  }

  bool get _step1Valid =>
      _name.text.trim().isNotEmpty &&
      _email.text.contains('@') &&
      _password.text.length >= 6 &&
      _password.text == _confirm.text;

  bool get _step2Valid =>
      _username.text.trim().isNotEmpty &&
      _phone.text.trim().length >= 7 &&
      _state != null;

  bool get _step3Valid => _topics.isNotEmpty && _acceptedTerms;

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg), behavior: SnackBarBehavior.floating),
    );
  }

  void _next() {
    HapticFeedback.selectionClick();
    if (_step == 0 && !_step1Valid) {
      _showError('Please complete all fields. Passwords must match.');
      return;
    }
    if (_step == 1 && !_step2Valid) {
      _showError('Please fill username, phone and select your state.');
      return;
    }
    if (_step < 2) {
      _page.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic);
    } else {
      _finish();
    }
  }

  void _finish() async {
    if (!_step3Valid) {
      _showError('Select at least one topic and accept the terms.');
      return;
    }
    final colors = [0xFF2E8B57, 0xFF1A5C3A, 0xFFD4A017, 0xFF0D3D2B];
    final user = AppUser(
      name: _name.text.trim(),
      email: _email.text.trim(),
      username: _username.text.trim(),
      phone: _phone.text.trim(),
      state: _state ?? '',
      experience: _experience,
      learningGoals: _topics.toList(),
      avatarColorValue: colors[_name.text.length % colors.length],
    );
    await UserService.instance.saveUser(user);
    await UserService.instance.login();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeShell()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _page.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    _username.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Create Account',
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    Expanded(
                      child: GradientProgressBar(
                        value: i <= _step ? 1 : 0,
                        height: 6,
                      ),
                    ),
                    if (i < 2) const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _page,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _step = i),
                children: [
                  _buildStep1(),
                  _buildStep2(),
                  _buildStep3(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: PrimaryButton(
                label: _step == 2 ? 'Finish & Start Learning' : 'Continue',
                icon: _step == 2
                    ? Icons.check_rounded
                    : Icons.arrow_forward_rounded,
                onPressed: _next,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        Text('Your details', style: AppText.heading(context, size: 20)),
        const SizedBox(height: 4),
        Text('Step 1 of 3', style: AppText.label(context, size: 12)),
        const SizedBox(height: 24),
        GlassTextField(
          label: 'Full Name',
          hint: 'e.g. Ada Obi',
          controller: _name,
          icon: Icons.person_outline_rounded,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 18),
        GlassTextField(
          label: 'Email Address',
          hint: 'you@example.com',
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          icon: Icons.mail_outline_rounded,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 18),
        GlassTextField(
          label: 'Password',
          hint: 'At least 6 characters',
          controller: _password,
          obscure: true,
          toggleObscure: true,
          icon: Icons.lock_outline_rounded,
          onChanged: (_) => setState(() {}),
        ),
        if (_password.text.isNotEmpty) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GradientProgressBar(
                  value: _passwordStrength,
                  height: 6,
                  gradient: LinearGradient(
                      colors: [_strengthColor, _strengthColor]),
                ),
              ),
              const SizedBox(width: 10),
              Text(_strengthLabel,
                  style: AppText.label(context,
                      size: 12, color: _strengthColor)),
            ],
          ),
        ],
        const SizedBox(height: 18),
        GlassTextField(
          label: 'Confirm Password',
          hint: 'Re-enter your password',
          controller: _confirm,
          obscure: true,
          toggleObscure: true,
          icon: Icons.lock_outline_rounded,
          onChanged: (v) => setState(() => _password2 = v),
        ),
        if (_password2.isNotEmpty && _password2 != _password.text)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Passwords do not match',
                style: AppText.label(context,
                    size: 12, color: const Color(0xFFEF4444))),
          ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStep2() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        Text('Profile', style: AppText.heading(context, size: 20)),
        const SizedBox(height: 4),
        Text('Step 2 of 3', style: AppText.label(context, size: 12)),
        const SizedBox(height: 24),
        Center(
          child: Column(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  gradient: AppGradients.primaryButton,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _name.text.isEmpty ? 'N' : _name.text[0].toUpperCase(),
                    style: AppText.display(context, size: 36, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text('Profile photo optional',
                  style: AppText.label(context, size: 12)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        GlassTextField(
          label: 'Username',
          hint: 'e.g. ada_telecom',
          controller: _username,
          icon: Icons.alternate_email_rounded,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 18),
        GlassTextField(
          label: 'Phone Number',
          hint: 'e.g. 0803 000 0000',
          controller: _phone,
          keyboardType: TextInputType.phone,
          icon: Icons.phone_outlined,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 18),
        Text('State', style: AppText.label(context, size: 13)),
        const SizedBox(height: 8),
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          radius: AppRadius.input,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _state,
              isExpanded: true,
              hint: Text('Select your state',
                  style: AppText.body(context, size: 15)),
              borderRadius: BorderRadius.circular(16),
              items: [
                for (final s in kNigerianStates)
                  DropdownMenuItem(value: s, child: Text(s)),
              ],
              onChanged: (v) => setState(() => _state = v),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStep3() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        Text('Your goals', style: AppText.heading(context, size: 20)),
        const SizedBox(height: 4),
        Text('Step 3 of 3', style: AppText.label(context, size: 12)),
        const SizedBox(height: 24),
        Text('Business Experience', style: AppText.label(context, size: 13)),
        const SizedBox(height: 10),
        Row(
          children: [
            for (final level in ['Beginner', 'Intermediate', 'Advanced'])
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _experience = level);
                    },
                    child: GlassPill(
                      active: _experience == level,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(level,
                            style: AppText.label(
                              context,
                              size: 12,
                              color: _experience == level
                                  ? AppColors.accentEmerald
                                  : null,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 24),
        Text('What do you want to learn?',
            style: AppText.label(context, size: 13)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final t in kLearningTopics)
              GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  setState(() {
                    _topics.contains(t) ? _topics.remove(t) : _topics.add(t);
                  });
                },
                child: GlassPill(
                  active: _topics.contains(t),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_topics.contains(t)) ...[
                        const Icon(Icons.check_rounded,
                            size: 15, color: AppColors.accentEmerald),
                        const SizedBox(width: 4),
                      ],
                      Text(t,
                          style: AppText.label(
                            context,
                            size: 13,
                            color: _topics.contains(t)
                                ? AppColors.accentEmerald
                                : null,
                          )),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () => setState(() => _acceptedTerms = !_acceptedTerms),
          child: GlassCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: _acceptedTerms ? AppGradients.progress : null,
                    color: _acceptedTerms ? null : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: _acceptedTerms
                          ? AppColors.success
                          : AppPalette.of(context).textSecondary,
                      width: 1.5,
                    ),
                  ),
                  child: _acceptedTerms
                      ? const Icon(Icons.check_rounded,
                          size: 16, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'I accept the Terms of Use and understand this app is for '
                    'educational purposes only.',
                    style: AppText.body(context, size: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
