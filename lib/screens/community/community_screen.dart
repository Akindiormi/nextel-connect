import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../services/progress_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/section_header.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final _progress = ProgressService.instance;

  @override
  void initState() {
    super.initState();
    _progress.addListener(_refresh);
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _progress.removeListener(_refresh);
    super.dispose();
  }

  Future<void> _openTelegram() async {
    final uri = Uri.parse('https://t.me/');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open Telegram'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final unlocked = _progress.communityUnlocked;
    final done = _progress.communityUnlockCount;

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        children: [
          Text('Community', style: AppText.display(context, size: 28)),
          const SizedBox(height: 4),
          Text('Connect. Share. Grow.', style: AppText.body(context, size: 15)),
          const SizedBox(height: 24),

          if (!unlocked)
            _LockedCard(done: done)
          else
            _UnlockedCard(onJoin: _openTelegram),

          const SizedBox(height: 24),
          SectionHeader(title: 'Community Guidelines'),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _Guideline(Icons.favorite_rounded,
                    'Be respectful', 'Treat every member with courtesy.'),
                _Guideline(Icons.help_outline_rounded, 'Ask freely',
                    'No question about the business is too small.'),
                _Guideline(Icons.volunteer_activism_rounded, 'Share knowledge',
                    'Help others as you would want to be helped.'),
                _Guideline(Icons.block_rounded, 'No spam or scams',
                    'Keep it educational — no get-rich-quick schemes.'),
                _Guideline(Icons.school_rounded, 'Stay on topic',
                    'Focus on learning and growing telecom businesses.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedCard extends StatelessWidget {
  final int done;
  const _LockedCard({required this.done});

  @override
  Widget build(BuildContext context) {
    final progress = (done / 3).clamp(0.0, 1.0);
    return GlassCard(
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.lock_rounded,
                color: AppColors.gold, size: 34),
          ),
          const SizedBox(height: 16),
          Text('Community Locks Unlock Soon',
              textAlign: TextAlign.center,
              style: AppText.heading(context, size: 18)),
          const SizedBox(height: 8),
          Text(
            'Complete 3 lessons to unlock our learning community and connect '
            'with fellow telecom entrepreneurs.',
            textAlign: TextAlign.center,
            style: AppText.body(context, size: 14),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: GradientProgressBar(value: progress, height: 10)),
              const SizedBox(width: 12),
              Text('$done / 3',
                  style: AppText.label(context,
                      size: 13, color: AppColors.accentEmerald)),
            ],
          ),
          const SizedBox(height: 10),
          Text('${3 - done} more lesson${3 - done == 1 ? '' : 's'} to go',
              style: AppText.label(context, size: 12)),
        ],
      ),
    );
  }
}

class _UnlockedCard extends StatelessWidget {
  final VoidCallback onJoin;
  const _UnlockedCard({required this.onJoin});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: AppGradients.greenHeader,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.telegram_rounded,
                      color: Colors.white, size: 34),
                ),
                const SizedBox(height: 14),
                Text('Join Our Learning Community',
                    textAlign: TextAlign.center,
                    style: AppText.heading(context,
                        size: 18, color: Colors.white)),
                const SizedBox(height: 6),
                Text('You unlocked the community — welcome!',
                    style: AppText.body(context,
                        size: 13, color: Colors.white70)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Benefit('Learn from experienced telecom operators'),
                const _Benefit('Ask questions and get real answers'),
                const _Benefit('Share your progress and wins'),
                const _Benefit('Stay motivated with a like-minded community'),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Join Telegram Group',
                  icon: Icons.telegram_rounded,
                  onPressed: onJoin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Benefit extends StatelessWidget {
  final String text;
  const _Benefit(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded,
              color: AppColors.success, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: AppText.body(context, size: 14))),
        ],
      ),
    );
  }
}

class _Guideline extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const _Guideline(this.icon, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.accentEmerald.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.accentEmerald, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppText.heading(context, size: 14)),
                const SizedBox(height: 2),
                Text(body, style: AppText.body(context, size: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
