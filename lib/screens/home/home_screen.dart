import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../data/courses_data.dart';
import '../../data/tips_data.dart';
import '../../models/course.dart';
import '../../models/lesson.dart';
import '../../services/progress_service.dart';
import '../../services/user_service.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/animations/entrance.dart';
import '../../widgets/animations/xp_counter.dart';
import '../../widgets/illustrations/streak_flame.dart';
import '../../widgets/illustrations/learning_path.dart';
import '../courses/course_detail_screen.dart';
import '../lesson/lesson_screen.dart';
import '../mentorship/mentorship_screen.dart';
import '../progress/progress_screen.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<int> onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  /// The course the user should continue: first in-progress, else first
  /// incomplete, else the first course.
  Course get _continueCourse {
    Course? inProgress;
    for (final c in kCourses) {
      final p = _progress.courseProgress(c);
      if (p > 0 && p < 1) {
        inProgress = c;
        break;
      }
    }
    if (inProgress != null) return inProgress;
    for (final c in kCourses) {
      if (!_progress.isCourseComplete(c)) return c;
    }
    return kCourses.first;
  }

  Lesson _nextLesson(Course course) {
    for (final l in course.lessons) {
      if (!_progress.isLessonComplete(l.id)) return l;
    }
    return course.lessons.first;
  }

  @override
  Widget build(BuildContext context) {
    final name = _user.user?.name.split(' ').first ?? 'Learner';
    final course = _continueCourse;
    final lesson = _nextLesson(course);
    final completed = _progress.completedInCourse(course);

    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
        children: [
          // top bar
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$_greeting,',
                        style: AppText.body(context, size: 14)),
                    Text(name, style: AppText.display(context, size: 26)),
                  ],
                ),
              ),
              GlassPill(
                padding: const EdgeInsets.all(12),
                onTap: () => _showNotifications(context),
                child: const Icon(Icons.notifications_none_rounded,
                    color: AppColors.primaryDark, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Continue learning card
          FadeSlideIn(
            delay: const Duration(milliseconds: 40),
            child: _ContinueLearningCard(
              course: course,
              lesson: lesson,
              completed: completed,
              onContinue: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LessonScreen(lesson: lesson, course: course),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Today's tip
          FadeSlideIn(
            delay: const Duration(milliseconds: 120),
            child: _TipCard(tip: tipForDate()),
          ),
          const SizedBox(height: 20),

          // Stats row
          FadeSlideIn(
            delay: const Duration(milliseconds: 200),
            child: Row(
              children: [
                Expanded(
                  child: GlassCard(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    radius: 20,
                    child: Row(
                      children: [
                        StreakFlame(streak: _progress.streak, size: 44),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            XpCounter(value: _progress.streak, size: 22),
                            Text('Day Streak',
                                style: AppText.label(context, size: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: GlassCard(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    radius: 20,
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.gold.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.bolt_rounded,
                              color: AppColors.gold, size: 24),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            XpCounter(value: _progress.xp, size: 22),
                            Text('Total XP',
                                style: AppText.label(context, size: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Quick access grid
          SectionHeader(title: 'Quick Access'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.5,
            children: [
              _QuickTile(
                icon: Icons.menu_book_rounded,
                label: 'Courses',
                color: AppColors.accentEmerald,
                onTap: () => widget.onNavigate(1),
              ),
              _QuickTile(
                icon: Icons.build_rounded,
                label: 'Business Tools',
                color: AppColors.gold,
                onTap: () => widget.onNavigate(2),
              ),
              _QuickTile(
                icon: Icons.school_rounded,
                label: 'Mentorship',
                color: AppColors.secondaryGreen,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const MentorshipScreen()),
                ),
              ),
              _QuickTile(
                icon: Icons.groups_rounded,
                label: 'Community',
                color: AppColors.primaryDark,
                onTap: () => widget.onNavigate(3),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Recommended courses
          SectionHeader(
            title: 'Recommended Courses',
            actionLabel: 'See all',
            onAction: () => widget.onNavigate(1),
          ),
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, i) {
                final c = kCourses[i];
                return _MiniCourseCard(
                  course: c,
                  progress: _progress.courseProgress(c),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => CourseDetailScreen(course: c)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Learning path preview
          SectionHeader(
            title: 'Your Learning Path',
            actionLabel: 'View',
            onAction: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProgressScreen()),
            ),
          ),
          FadeSlideIn(
            delay: const Duration(milliseconds: 120),
            child: GlassCard(
            child: LearningPathMap(
              rowHeight: 124,
              nodes: [
                for (final c in kCourses.take(4))
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
          ),
        ],
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    HapticFeedback.selectionClick();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _GlassSheet(
        title: 'Notifications',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NotificationTile(
              icon: Icons.local_fire_department_rounded,
              color: AppColors.gold,
              title: 'Keep your streak alive!',
              body: 'Complete a lesson today to grow your ${_progress.streak}-day streak.',
            ),
            _NotificationTile(
              icon: Icons.lightbulb_outline_rounded,
              color: AppColors.accentEmerald,
              title: "Today's tip is ready",
              body: tipForDate(),
            ),
            _NotificationTile(
              icon: Icons.emoji_events_rounded,
              color: AppColors.secondaryGreen,
              title: 'New badges to earn',
              body: 'Complete lessons and quizzes to unlock achievements.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueLearningCard extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final int completed;
  final VoidCallback onContinue;

  const _ContinueLearningCard({
    required this.course,
    required this.lesson,
    required this.completed,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // green gradient header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: AppGradients.greenHeader,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(course.icon, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CONTINUE LEARNING',
                          style: AppText.label(context,
                              size: 10, color: Colors.white70)),
                      const SizedBox(height: 4),
                      Text(course.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.heading(context,
                              size: 17, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lesson ${lesson.index}: ${lesson.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.body(context,
                        size: 14, color: palette.textPrimary)),
                const SizedBox(height: 4),
                Text('Lesson ${completed + 1} of ${course.lessonCount}',
                    style: AppText.label(context, size: 12)),
                const SizedBox(height: 14),
                GradientProgressBar(
                    value: course.lessonCount == 0
                        ? 0
                        : completed / course.lessonCount),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onContinue();
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: AppGradients.primaryButton,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.buttonShadow,
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Continue Lesson',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15)),
                          SizedBox(width: 8),
                          Icon(Icons.play_arrow_rounded,
                              color: Colors.white, size: 22),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String tip;
  const _TipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5,
              decoration: const BoxDecoration(
                gradient: AppGradients.progress,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.lightbulb_rounded,
                            color: AppColors.gold, size: 18),
                        const SizedBox(width: 6),
                        Text("TODAY'S TIP",
                            style: AppText.label(context,
                                size: 11, color: AppColors.accentEmerald)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(tip,
                        style: AppText.body(context,
                            size: 14,
                            color: AppPalette.of(context).textPrimary)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      radius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          Text(label, style: AppText.heading(context, size: 15)),
        ],
      ),
    );
  }
}

class _MiniCourseCard extends StatelessWidget {
  final Course course;
  final double progress;
  final VoidCallback onTap;

  const _MiniCourseCard({
    required this.course,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GlassCard(
        onTap: onTap,
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppGradients.greenHeader,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Icon(course.icon, color: Colors.white, size: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.heading(context, size: 14)),
                  const SizedBox(height: 6),
                  Text('${course.lessonCount} lessons',
                      style: AppText.label(context, size: 11)),
                  const SizedBox(height: 10),
                  GradientProgressBar(value: progress, height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable glass bottom sheet.
class _GlassSheet extends StatelessWidget {
  final String title;
  final Widget child;
  const _GlassSheet({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return Container(
      decoration: BoxDecoration(
        color: palette.isDark ? const Color(0xFF10231A) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: palette.textSecondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppText.heading(context, size: 20)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String body;

  const _NotificationTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
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
