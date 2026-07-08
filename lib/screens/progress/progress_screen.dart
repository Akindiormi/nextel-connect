import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/courses_data.dart';
import '../../services/progress_service.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/illustrations/infinity_curve.dart';
import '../../widgets/illustrations/progress_chart.dart';
import '../courses/course_detail_screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
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
    final totalLessons = kAllLessons.length;
    final overall = totalLessons == 0
        ? 0.0
        : _progress.totalLessonsCompleted / totalLessons;
    final hours = _progress.timeMinutes ~/ 60;
    final mins = _progress.timeMinutes % 60;

    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Progress',
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          children: [
            Text('Your Progress', style: AppText.display(context, size: 26)),
            const SizedBox(height: 20),

            SectionHeader(title: 'This Week'),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lessons completed per day',
                      style: AppText.label(context, size: 12)),
                  const SizedBox(height: 12),
                  WeeklyProgressChart(values: _progress.weeklyActivity()),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // stat grid
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    icon: Icons.check_circle_rounded,
                    value: '${_progress.totalLessonsCompleted}',
                    label: 'Lessons Done',
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _StatTile(
                    icon: Icons.schedule_rounded,
                    value: hours > 0 ? '${hours}h ${mins}m' : '${mins}m',
                    label: 'Time Learning',
                    color: AppColors.accentEmerald,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _StatTile(
                    icon: Icons.calendar_month_rounded,
                    value:
                        _progress.averageLessonsPerWeek.toStringAsFixed(1),
                    label: 'Lessons / Week',
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _StatTile(
                    icon: Icons.local_fire_department_rounded,
                    value: '${_progress.longestStreak}',
                    label: 'Longest Streak',
                    color: const Color(0xFFEF4444),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'Overall Journey'),
            GlassCard(
              child: Column(
                children: [
                  InfinityCurve(progress: overall, height: 150),
                  const SizedBox(height: 12),
                  Text('${(overall * 100).round()}% of all lessons complete',
                      style: AppText.heading(context, size: 16)),
                  const SizedBox(height: 4),
                  Text(
                      '${_progress.totalLessonsCompleted} of $totalLessons lessons',
                      style: AppText.label(context, size: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'Course Progress'),
            ...kCourses.map((c) {
              final p = _progress.courseProgress(c);
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlassCard(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => CourseDetailScreen(course: c)),
                  ),
                  padding: const EdgeInsets.all(16),
                  radius: 18,
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: AppGradients.greenHeader,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(c.icon, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.heading(context, size: 14)),
                            const SizedBox(height: 8),
                            GradientProgressBar(value: p, height: 6),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('${(p * 100).round()}%',
                          style: AppText.label(context,
                              size: 13, color: AppColors.accentEmerald)),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  const _StatTile({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      radius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(value, style: AppText.number(context, size: 22)),
          Text(label, style: AppText.label(context, size: 11)),
        ],
      ),
    );
  }
}
