import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/achievements_data.dart';
import '../../data/courses_data.dart';
import '../../models/achievement.dart';
import '../../services/progress_service.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/illustrations/learning_path.dart';
import '../courses/course_detail_screen.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
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

  @override
  Widget build(BuildContext context) {
    final coursesDone =
        kCourses.where((c) => _progress.isCourseComplete(c)).length;
    final badges = _progress.achievements.length;
    final level = _progress.currentLevel;

    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Achievements',
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          children: [
            Text('Your Milestones',
                style: AppText.display(context, size: 26)),
            const SizedBox(height: 20),

            // summary
            GlassCard(
              child: Row(
                children: [
                  Expanded(
                      child: _Summary(
                          value: '$coursesDone', label: 'Courses')),
                  _divider(context),
                  Expanded(
                      child: _Summary(
                          value: '${_progress.xp}', label: 'Total XP')),
                  _divider(context),
                  Expanded(
                      child: _Summary(
                          value: '${level.level}', label: level.title)),
                  _divider(context),
                  Expanded(
                      child: _Summary(value: '$badges', label: 'Badges')),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'Learning Path'),
            GlassCard(
              child: LearningPathMap(
                nodes: [
                  for (final c in kCourses)
                    PathNode(
                      title: c.title,
                      icon: c.icon,
                      progress: _progress.courseProgress(c),
                      state: _progress.isCourseComplete(c)
                          ? PathState.completed
                          : (_progress.courseProgress(c) > 0
                              ? PathState.current
                              : PathState.locked),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => CourseDetailScreen(course: c)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'Badges'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.85,
              children: [
                for (final a in kAchievements)
                  _BadgeTile(
                    achievement: a,
                    unlocked: _progress.hasUnlocked(a.id),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'XP History'),
            if (_progress.xpHistory.isEmpty)
              GlassCard(
                child: Text('Complete lessons and quizzes to start earning XP.',
                    style: AppText.body(context, size: 14)),
              )
            else
              GlassCard(
                child: Column(
                  children: [
                    for (final e in _progress.xpHistory.take(15))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.gold.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.bolt_rounded,
                                  color: AppColors.gold, size: 18),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(e.label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppText.body(context, size: 13)),
                            ),
                            Text('+${e.amount}',
                                style: AppText.label(context,
                                    size: 13, color: AppColors.gold)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) => Container(
        width: 1,
        height: 36,
        color: AppPalette.of(context).border,
      );
}

class _Summary extends StatelessWidget {
  final String value;
  final String label;
  const _Summary({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppText.number(context, size: 20)),
        const SizedBox(height: 2),
        Text(label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.label(context, size: 10)),
      ],
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final Achievement achievement;
  final bool unlocked;
  const _BadgeTile({required this.achievement, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(10),
      radius: 18,
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppPalette.of(context).isDark
                ? const Color(0xFF12241A)
                : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)),
            title: Text(achievement.title,
                style: AppText.heading(context, size: 18)),
            content: Text(
              unlocked
                  ? achievement.description
                  : 'Locked — ${achievement.description}',
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
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              gradient: unlocked
                  ? LinearGradient(colors: [
                      achievement.color,
                      achievement.color.withValues(alpha: 0.7),
                    ])
                  : null,
              color: unlocked ? null : Colors.grey.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              boxShadow: unlocked
                  ? [
                      BoxShadow(
                        color: achievement.color.withValues(alpha: 0.4),
                        blurRadius: 14,
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              unlocked ? achievement.icon : Icons.lock_rounded,
              color: unlocked
                  ? Colors.white
                  : AppPalette.of(context).textSecondary,
              size: 26,
            ),
          ),
          const SizedBox(height: 8),
          Text(achievement.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppText.label(
                context,
                size: 10,
                color: unlocked
                    ? AppPalette.of(context).textPrimary
                    : AppPalette.of(context).textSecondary,
              )),
        ],
      ),
    );
  }
}
