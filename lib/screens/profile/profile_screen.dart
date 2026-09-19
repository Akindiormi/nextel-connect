import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../data/achievements_data.dart';
import '../../data/courses_data.dart';
import '../../services/progress_service.dart';
import '../../services/user_service.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/animations/entrance.dart';
import '../../widgets/animations/xp_counter.dart';
import '../../widgets/illustrations/xp_orbit.dart';
import '../achievements/achievements_screen.dart';
import '../progress/progress_screen.dart';
import '../auth/welcome_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _progress = ProgressService.instance;
  final _user = UserService.instance;

  @override
  void initState() {
    super.initState();
    _progress.addListener(_refresh);
    _user.addListener(_refresh);
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _progress.removeListener(_refresh);
    _user.removeListener(_refresh);
    super.dispose();
  }

  String _nextBadgeHint() {
    final next = kAchievements.firstWhere(
      (a) => !_progress.hasUnlocked(a.id),
      orElse: () => kAchievements.last,
    );
    if (_progress.hasUnlocked(next.id)) return 'All badges unlocked so far!';
    return 'Keep it up to unlock the ${next.title} badge';
  }

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Log out?', style: AppText.heading(context, size: 18)),
        content: Text(
          'Your progress is saved on this device and will be here when you '
          'return.',
          style: AppText.body(context, size: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Log out',
                style: TextStyle(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await _user.logout();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        (route) => false,
      );
    }
  }

  void _about() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('About Nextel', style: AppText.heading(context, size: 18)),
        content: Text(
          'Nextel is an educational app that teaches the telecom reselling '
          'business in Nigeria.\n\nVersion 1.0.0\n\nThis app is for educational '
          'purposes only. We make no financial guarantees or income promises.',
          style: AppText.body(context, size: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _user.user;
    final level = _progress.currentLevel;
    final next = _progress.nextLevel;
    final coursesDone =
        kCourses.where((c) => _progress.isCourseComplete(c)).length;
    final unlockedBadges = kAchievements
        .where((a) => _progress.hasUnlocked(a.id))
        .toList();

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profile', style: AppText.display(context, size: 28)),
              GlassPill(
                padding: const EdgeInsets.all(12),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                ),
                child: const Icon(Icons.edit_rounded,
                    color: AppColors.accentEmerald, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // hero card
          FadeSlideIn(
            child: GlassCard(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          user?.avatarColor ?? AppColors.accentEmerald,
                          (user?.avatarColor ?? AppColors.accentEmerald)
                              .withValues(alpha: 0.7),
                        ]),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color:
                                (user?.avatarColor ?? AppColors.accentEmerald)
                                    .withValues(alpha: 0.4),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(user?.initial ?? 'N',
                            style: AppText.display(context,
                                size: 40, color: Colors.white)),
                      ),
                    ),
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const EditProfileScreen()),
                        ),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppPalette.of(context).isDark
                                  ? AppColors.darkBackground
                                  : Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.edit_rounded,
                              color: Colors.white, size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(user?.name ?? 'Learner',
                    style: AppText.display(context, size: 22)),
                const SizedBox(height: 4),
                Text(
                  (user?.username ?? '').isNotEmpty
                      ? '${user!.experience} Learner • @${user.username}'
                      : '${user?.experience ?? 'Beginner'} Learner',
                  style: AppText.body(context, size: 13),
                ),
                const SizedBox(height: 10),
                GlassPill(
                  color: AppColors.gold.withValues(alpha: 0.15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.military_tech_rounded,
                          color: AppColors.gold, size: 16),
                      const SizedBox(width: 6),
                      Text('${level.title} • Level ${level.level}',
                          style: AppText.label(context,
                              size: 12, color: AppColors.gold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
          const SizedBox(height: 16),

          // stat band — one unified card, three columns divided by hairlines
          FadeSlideIn(
            delay: const Duration(milliseconds: 100),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
              child: Row(
                children: [
                  Expanded(
                    child: _StatColumn(
                      icon: Icons.bolt_rounded,
                      color: AppColors.gold,
                      value: _progress.xp,
                      label: 'Total XP',
                    ),
                  ),
                  _StatDivider(),
                  Expanded(
                    child: _StatColumn(
                      icon: Icons.local_fire_department_rounded,
                      color: const Color(0xFFEF4444),
                      value: _progress.streak,
                      label: 'Streak',
                    ),
                  ),
                  _StatDivider(),
                  Expanded(
                    child: _StatColumn(
                      icon: Icons.workspace_premium_rounded,
                      color: AppColors.accentEmerald,
                      value: coursesDone,
                      label: 'Courses',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // streak highlight banner
          if (_progress.streak > 0) ...[
            FadeSlideIn(
              delay: const Duration(milliseconds: 130),
              child: GlassCard(
                color: AppColors.primaryDark,
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.local_fire_department_rounded,
                          color: AppColors.gold, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${_progress.streak}-day learning streak',
                              style: AppText.heading(context,
                                  size: 15, color: Colors.white)),
                          const SizedBox(height: 2),
                          Text(_nextBadgeHint(),
                              style: AppText.body(context,
                                  size: 12, color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],

          // XP progress card
          FadeSlideIn(
            delay: const Duration(milliseconds: 160),
            child: GlassCard(
            gradient: AppGradients.greenHeader,
            child: Row(
              children: [
                XpOrbit(level: level.level, xp: _progress.xp, size: 110),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(level.title,
                          style: AppText.heading(context,
                              size: 18, color: Colors.white)),
                      const SizedBox(height: 4),
                      Text(
                        next == null
                            ? 'Max level reached!'
                            : '${_progress.xpToNextLevel} XP to ${next.title}',
                        style: AppText.body(context,
                            size: 13, color: Colors.white70),
                      ),
                      const SizedBox(height: 12),
                      GradientProgressBar(
                          value: _progress.levelProgress, height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
          const SizedBox(height: 24),

          // recent badges
          if (unlockedBadges.isNotEmpty) ...[
            SectionHeader(
              title: 'Recent Badges',
              actionLabel: 'View all',
              onAction: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const AchievementsScreen()),
              ),
            ),
            SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: unlockedBadges.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final a = unlockedBadges[i];
                  return Column(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            a.color,
                            a.color.withValues(alpha: 0.7),
                          ]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: a.color.withValues(alpha: 0.4),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Icon(a.icon, color: Colors.white, size: 28),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 70,
                        child: Text(a.title,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.label(context, size: 10)),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],

          // quick links
          SectionHeader(title: 'Quick Links'),
          GlassCard(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                _LinkTile(
                  icon: Icons.emoji_events_rounded,
                  label: 'Achievements',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => const AchievementsScreen()),
                  ),
                ),
                _LinkTile(
                  icon: Icons.insights_rounded,
                  label: 'My Progress',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ProgressScreen()),
                  ),
                ),
                _LinkTile(
                  icon: Icons.bookmark_rounded,
                  label: 'Saved Lessons',
                  trailing: '${_progress.bookmarks.length}',
                  onTap: () => _showBookmarks(),
                  isLast: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // settings
          SectionHeader(title: 'Settings'),
          GlassCard(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                _SwitchTile(
                  icon: Icons.dark_mode_rounded,
                  label: 'Dark Mode',
                  value: _user.darkMode,
                  onChanged: (v) {
                    HapticFeedback.selectionClick();
                    _user.setDarkMode(v);
                  },
                ),
                _SwitchTile(
                  icon: Icons.notifications_rounded,
                  label: 'Notifications',
                  value: _user.notificationsEnabled,
                  onChanged: (v) => _user.setNotifications(v),
                ),
                _LinkTile(
                  icon: Icons.privacy_tip_rounded,
                  label: 'Privacy Policy',
                  onTap: _privacy,
                ),
                _LinkTile(
                  icon: Icons.info_rounded,
                  label: 'About Nextel',
                  onTap: _about,
                ),
                _LinkTile(
                  icon: Icons.star_rounded,
                  label: 'Rate the App',
                  onTap: _rate,
                ),
                _LinkTile(
                  icon: Icons.shield_rounded,
                  label: 'Educational Disclaimer',
                  onTap: _disclaimer,
                ),
                _LinkTile(
                  icon: Icons.logout_rounded,
                  label: 'Log Out',
                  color: const Color(0xFFEF4444),
                  onTap: _logout,
                  isLast: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text('Nextel v1.0.0 • Educational use only',
                style: AppText.label(context, size: 11)),
          ),
        ],
      ),
    );
  }

  void _showBookmarks() {
    final bookmarks = _progress.bookmarks;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppPalette.of(context).isDark
              ? const Color(0xFF10231A)
              : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Lessons', style: AppText.heading(context, size: 20)),
            const SizedBox(height: 16),
            if (bookmarks.isEmpty)
              Text('Tap the bookmark icon in any lesson to save it here.',
                  style: AppText.body(context, size: 14))
            else
              ...bookmarks.entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.bookmark_rounded,
                            color: AppColors.gold, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(e.value,
                              style: AppText.body(context, size: 14)),
                        ),
                      ],
                    ),
                  )),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _privacy() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Privacy Policy', style: AppText.heading(context, size: 18)),
        content: SingleChildScrollView(
          child: Text(
            'Nextel respects your privacy. All your data — your profile, learning '
            'progress, XP, and business tool records — is stored locally on your '
            'device using secure device storage. We do not collect, transmit or '
            'sell your personal information. No account data leaves your phone. '
            'The app requires internet only to load fonts and to open external '
            'links such as the community. You may clear all data at any time by '
            'logging out or uninstalling the app.',
            style: AppText.body(context, size: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _disclaimer() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Educational Disclaimer',
            style: AppText.heading(context, size: 18)),
        content: Text(
          'This app is for educational purposes only. We make no financial '
          'guarantees or income promises. All content is designed to teach '
          'business skills and knowledge. Any business decisions you make are '
          'your own responsibility.',
          style: AppText.body(context, size: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('I understand'),
          ),
        ],
      ),
    );
  }

  Future<void> _rate() async {
    final uri = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.nextel.app');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thanks for your support!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

/// One column within the unified stats band: icon badge, count-up number,
/// label — no card wrapper of its own, since the band provides that.
class _StatColumn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int value;
  final String label;

  const _StatColumn({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: color, size: 19),
        ),
        const SizedBox(height: 8),
        XpCounter(value: value, size: 18),
        const SizedBox(height: 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppText.label(context, size: 11),
        ),
      ],
    );
  }
}

/// A thin vertical hairline separating columns in the stats band.
class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 44,
      color: AppPalette.of(context).border,
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final String? trailing;
  final bool isLast;

  const _LinkTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    this.trailing,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    final tileColor = color ?? AppColors.accentEmerald;
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            onTap: onTap,
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: tileColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: tileColor, size: 19),
            ),
            title: Text(label,
                style: AppText.body(context,
                    size: 15, color: color ?? palette.textPrimary)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailing != null)
                  Text(trailing!, style: AppText.label(context, size: 13)),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right_rounded,
                    color: palette.textSecondary),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(height: 1, color: palette.border, indent: 16, endIndent: 16),
      ],
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.accentEmerald.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: AppColors.accentEmerald, size: 19),
            ),
            title: Text(label, style: AppText.body(context, size: 15)),
            trailing: Switch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: AppColors.accentEmerald,
            ),
          ),
        ),
        Divider(height: 1, color: palette.border, indent: 16, endIndent: 16),
      ],
    );
  }
}
