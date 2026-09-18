import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/course.dart';
import '../../models/lesson.dart';
import '../../services/progress_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../lesson/lesson_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final _progress = ProgressService.instance;
  int _tab = 0;

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

  Lesson get _nextLesson {
    for (final l in widget.course.lessons) {
      if (!_progress.isLessonComplete(l.id)) return l;
    }
    return widget.course.lessons.first;
  }

  void _openLesson(Lesson lesson) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LessonScreen(lesson: lesson, course: widget.course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.course;
    final palette = AppPalette.of(context);
    final progress = _progress.courseProgress(c);
    final completed = _progress.completedInCourse(c);
    final allDone = _progress.isCourseComplete(c);

    return GradientScaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Hero header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 56, 20, 30),
                  decoration: const BoxDecoration(
                    gradient: AppGradients.greenHeader,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _CircleButton(
                            icon: Icons.arrow_back_ios_new_rounded,
                            onTap: () => Navigator.pop(context),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.success.withValues(alpha: 0.4),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Icon(c.icon, color: Colors.white, size: 44),
                      ),
                      const SizedBox(height: 18),
                      Text(c.title,
                          textAlign: TextAlign.center,
                          style: AppText.display(context,
                              size: 24, color: Colors.white)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _HeaderTag(c.category),
                          const SizedBox(width: 8),
                          _HeaderTag(c.difficulty.label),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(c.description, style: AppText.body(context, size: 15)),
                    const SizedBox(height: 20),

                    // stats row
                    Row(
                      children: [
                        Expanded(
                          child: _StatBox(
                              icon: Icons.menu_book_rounded,
                              value: '${c.lessonCount}',
                              label: 'Lessons'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatBox(
                              icon: Icons.schedule_rounded,
                              value: '${c.durationMinutes}m',
                              label: 'Duration'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatBox(
                              icon: Icons.bolt_rounded,
                              value: '${c.totalXp}',
                              label: 'XP'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // progress card
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Your Progress',
                                  style: AppText.heading(context, size: 16)),
                              Text('$completed / ${c.lessonCount}',
                                  style: AppText.label(context,
                                      size: 13,
                                      color: AppColors.accentEmerald)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          GradientProgressBar(value: progress, height: 12),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // tabs
                    Row(
                      children: [
                        _TabButton(
                          label: 'Lessons',
                          active: _tab == 0,
                          onTap: () => setState(() => _tab = 0),
                        ),
                        const SizedBox(width: 12),
                        _TabButton(
                          label: 'About',
                          active: _tab == 1,
                          onTap: () => setState(() => _tab = 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    if (_tab == 0)
                      ...c.lessons.map((l) {
                        final unlocked = _progress.isLessonUnlocked(c, l);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _LessonTile(
                            lesson: l,
                            done: _progress.isLessonComplete(l.id),
                            locked: !unlocked,
                            onTap: unlocked ? () => _openLesson(l) : () {},
                          ),
                        );
                      })
                    else
                      _AboutSection(course: c, palette: palette),
                  ]),
                ),
              ),
            ],
          ),

          // floating start/continue button
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: PrimaryButton(
              label: allDone
                  ? 'Review Course'
                  : (completed > 0 ? 'Continue Learning' : 'Start Course'),
              icon: allDone
                  ? Icons.replay_rounded
                  : Icons.play_arrow_rounded,
              onPressed: () => _openLesson(_nextLesson),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final Course course;
  final AppPalette palette;
  const _AboutSection({required this.course, required this.palette});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About this course',
              style: AppText.heading(context, size: 16)),
          const SizedBox(height: 10),
          Text(course.description, style: AppText.body(context, size: 14)),
          const SizedBox(height: 16),
          _AboutRow(
              icon: Icons.category_rounded,
              label: 'Category',
              value: course.category),
          _AboutRow(
              icon: Icons.signal_cellular_alt_rounded,
              label: 'Level',
              value: course.difficulty.label),
          _AboutRow(
              icon: Icons.menu_book_rounded,
              label: 'Lessons',
              value: '${course.lessonCount}'),
          _AboutRow(
              icon: Icons.bolt_rounded,
              label: 'Total XP',
              value: '${course.totalXp}'),
          _AboutRow(
              icon: Icons.schedule_rounded,
              label: 'Est. duration',
              value: '${course.durationMinutes} minutes'),
          const SizedBox(height: 8),
          Text(
            'This course is part of the Nextel educational curriculum. All '
            'content is for learning purposes only.',
            style: AppText.label(context, size: 12),
          ),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _AboutRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.accentEmerald),
          const SizedBox(width: 10),
          Text(label, style: AppText.body(context, size: 14)),
          const Spacer(),
          Text(value,
              style: AppText.label(context,
                  size: 13, color: AppPalette.of(context).textPrimary)),
        ],
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  final Lesson lesson;
  final bool done;
  final bool locked;
  final VoidCallback onTap;

  const _LessonTile({
    required this.lesson,
    required this.done,
    required this.onTap,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return GlassCard(
      onTap: () {
        if (locked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Pass the previous lesson\'s quiz to unlock this one'),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }
        onTap();
      },
      padding: const EdgeInsets.all(14),
      radius: 18,
      child: Opacity(
        opacity: locked ? 0.55 : 1,
        child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: done ? AppGradients.progress : null,
              color: done ? null : palette.cardStrong,
              shape: BoxShape.circle,
              border: done ? null : Border.all(color: palette.border),
            ),
            child: done
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
                : locked
                    ? Icon(Icons.lock_rounded,
                        size: 18, color: palette.textSecondary)
                    : Center(
                        child: Text('${lesson.index}',
                            style: AppText.number(context, size: 16)),
                      ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lesson.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.heading(context, size: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.schedule_rounded,
                        size: 13, color: palette.textSecondary),
                    const SizedBox(width: 4),
                    Text('${lesson.readingMinutes} min read',
                        style: AppText.label(context, size: 11)),
                    if (lesson.hasQuiz) ...[
                      const SizedBox(width: 10),
                      Icon(Icons.quiz_rounded,
                          size: 13,
                          color: locked ? palette.textSecondary : AppColors.gold),
                      const SizedBox(width: 4),
                      Text(
                          locked
                              ? '${lesson.quiz.length} questions'
                              : 'Quiz \u00b7 ${lesson.effectivePassScore}/${lesson.quiz.length} to pass',
                          style: AppText.label(context,
                              size: 11,
                              color: locked ? palette.textSecondary : AppColors.gold)),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Icon(locked ? Icons.lock_rounded : Icons.chevron_right_rounded,
              color: palette.textSecondary),
        ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _TabButton(
      {required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassPill(
        active: active,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Text(label,
            style: AppText.label(context,
                size: 14,
                color: active ? AppColors.accentEmerald : null)),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _StatBox(
      {required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      radius: 18,
      child: Column(
        children: [
          Icon(icon, color: AppColors.accentEmerald, size: 22),
          const SizedBox(height: 8),
          Text(value, style: AppText.number(context, size: 18)),
          Text(label, style: AppText.label(context, size: 11)),
        ],
      ),
    );
  }
}

class _HeaderTag extends StatelessWidget {
  final String text;
  const _HeaderTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
