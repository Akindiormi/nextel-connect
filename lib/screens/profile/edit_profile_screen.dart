import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../auth/signup_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final AppUser _user;
  late final TextEditingController _name;
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _bio;
  String? _state;
  late String _experience;
  late Set<String> _goals;
  late int _avatarColor;

  static const _colors = [
    0xFF2E8B57,
    0xFF1A5C3A,
    0xFFD4A017,
    0xFF0D3D2B,
    0xFFEF4444,
    0xFF6366F1,
  ];

  @override
  void initState() {
    super.initState();
    _user = UserService.instance.user ??
        AppUser(name: 'Learner', email: '');
    _name = TextEditingController(text: _user.name);
    _username = TextEditingController(text: _user.username);
    _email = TextEditingController(text: _user.email);
    _phone = TextEditingController(text: _user.phone);
    _bio = TextEditingController(text: _user.bio);
    _state = _user.state.isEmpty ? null : _user.state;
    _experience = _user.experience;
    _goals = _user.learningGoals.toSet();
    _avatarColor = _user.avatarColorValue;
  }

  @override
  void dispose() {
    _name.dispose();
    _username.dispose();
    _email.dispose();
    _phone.dispose();
    _bio.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final updated = AppUser(
      name: _name.text.trim().isEmpty ? 'Learner' : _name.text.trim(),
      email: _email.text.trim(),
      username: _username.text.trim(),
      phone: _phone.text.trim(),
      state: _state ?? '',
      bio: _bio.text.trim(),
      experience: _experience,
      learningGoals: _goals.toList(),
      avatarColorValue: _avatarColor,
    );
    await UserService.instance.saveUser(updated);
    HapticFeedback.lightImpact();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Edit Profile',
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // avatar + colour choices
            Center(
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(_avatarColor),
                    Color(_avatarColor).withValues(alpha: 0.7),
                  ]),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _name.text.isEmpty ? 'N' : _name.text[0].toUpperCase(),
                    style:
                        AppText.display(context, size: 40, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              children: [
                for (final c in _colors)
                  GestureDetector(
                    onTap: () => setState(() => _avatarColor = c),
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color(c),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _avatarColor == c
                              ? AppColors.accentEmerald
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            GlassTextField(
                label: 'Full Name',
                controller: _name,
                icon: Icons.person_outline_rounded,
                onChanged: (_) => setState(() {})),
            const SizedBox(height: 16),
            GlassTextField(
                label: 'Username',
                controller: _username,
                icon: Icons.alternate_email_rounded),
            const SizedBox(height: 16),
            GlassTextField(
                label: 'Email',
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.mail_outline_rounded),
            const SizedBox(height: 16),
            GlassTextField(
                label: 'Phone',
                controller: _phone,
                keyboardType: TextInputType.phone,
                icon: Icons.phone_outlined),
            const SizedBox(height: 16),
            GlassTextField(
                label: 'Bio',
                hint: 'Tell us about your business goals',
                controller: _bio,
                maxLines: 3,
                icon: Icons.notes_rounded),
            const SizedBox(height: 16),

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
            const SizedBox(height: 20),

            Text('Business Experience', style: AppText.label(context, size: 13)),
            const SizedBox(height: 10),
            Row(
              children: [
                for (final level in ['Beginner', 'Intermediate', 'Advanced'])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _experience = level),
                        child: GlassPill(
                          active: _experience == level,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: Text(level,
                                style: AppText.label(context,
                                    size: 12,
                                    color: _experience == level
                                        ? AppColors.accentEmerald
                                        : null)),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            Text('Learning Goals', style: AppText.label(context, size: 13)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final t in kLearningTopics)
                  GestureDetector(
                    onTap: () => setState(() {
                      _goals.contains(t) ? _goals.remove(t) : _goals.add(t);
                    }),
                    child: GlassPill(
                      active: _goals.contains(t),
                      child: Text(t,
                          style: AppText.label(context,
                              size: 13,
                              color: _goals.contains(t)
                                  ? AppColors.accentEmerald
                                  : null)),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Save Changes',
              icon: Icons.check_rounded,
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }
}
