import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../models/course.dart';
import '../../models/lesson.dart';
import '../../services/progress_service.dart';
import '../../widgets/animations/celebration_overlay.dart';
import '../../widgets/animations/milestone_screen.dart';
import '../../widgets/animations/xp_counter.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../quiz/quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  final Course course;
  const LessonScreen({super.key, required this.lesson, required this.course});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final _progress = ProgressService.instance;
  final _scroll = ScrollController();
  late List<bool> _stepChecked;
  double _readProgress = 0;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _completed = _progress.isLessonComplete(widget.lesson.id);
    final done = _progress.areActionStepsDone(widget.lesson.id);
    _stepChecked =
        List.filled(widget.lesson.actionSteps.length, done);
    _scroll.addListener(() {
      if (_scroll.position.maxScrollExtent > 0) {
        setState(() => _readProgress =
            (_scroll.offset / _scroll.position.maxScrollExtent).clamp(0, 1));
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Lesson? get _nextLesson {
    final idx = widget.course.lessons.indexWhere((l) => l.id == widget.lesson.id);
    if (idx >= 0 && idx < widget.course.lessons.length - 1) {
      return widget.course.lessons[idx + 1];
    }
    return null;
  }

  Future<void> _toggleStep(int i) async {
    HapticFeedback.selectionClick();
    setState(() => _stepChecked[i] = !_stepChecked[i]);
    if (_stepChecked.every((e) => e)) {
      final bonus = await _progress.completeActionSteps(widget.lesson.id);
      if (bonus > 0 && mounted) {
        _showXpSnack(bonus, 'Action steps complete!');
      }
    }
  }

  void _showXpSnack(int amount, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XpGainBadge(amount: amount),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(label,
                    style: const TextStyle(color: Colors.white, fontSize: 13)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _markComplete() async {
    HapticFeedback.mediumImpact();
    final result = await _progress.completeLesson(widget.lesson, widget.course);
    if (!mounted) return;
    setState(() => _completed = true);

    if (result.xpGained > 0) {
      _showXpSnack(result.xpGained, 'Lesson complete!');
    }

    // milestone celebrations
    final m = result.milestonePercent;
    if (m == 100) {
      await MilestoneScreen.show(
        context,
        title: 'Course Complete!',
        subtitle:
            'You finished ${widget.course.title}. A new badge is yours — keep '
            'building your telecom knowledge.',
        badgeIcon: Icons.workspace_premium_rounded,
        color: AppColors.gold,
        shareText:
            'I just completed the "${widget.course.title}" course on Nextel! 🎓',
      );
    } else if (m != null) {
      await showCelebration(
        context,
        title: '$m% Complete!',
        message: m >= 75
            ? "Almost there — you're smashing this course."
            : (m >= 50
                ? "Halfway through ${widget.course.title}!"
                : "Great start on ${widget.course.title}!"),
        icon: m >= 75
            ? Icons.emoji_events_rounded
            : Icons.trending_up_rounded,
        color: m >= 75 ? AppColors.gold : AppColors.accentEmerald,
      );
    }
  }

  void _openQuiz() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QuizScreen(lesson: widget.lesson),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = widget.lesson;
    final palette = AppPalette.of(context);
    final bookmarked = _progress.isBookmarked(l.id);

    return GradientScaffold(
      body: Column(
        children: [
          // top bar with reading progress
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  _RoundIcon(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lesson ${l.index} of ${widget.course.lessonCount}',
                            style: AppText.label(context, size: 11)),
                        const SizedBox(height: 6),
                        GradientProgressBar(value: _readProgress, height: 5),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  _RoundIcon(
                    icon: bookmarked
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: bookmarked ? AppColors.gold : null,
                    onTap: () async {
                      await _progress.toggleBookmark(l.id, l.title);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              children: [
                Text(l.title, style: AppText.display(context, size: 28)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.schedule_rounded,
                        size: 16, color: palette.textSecondary),
                    const SizedBox(width: 6),
                    Text('${l.readingMinutes} min read',
                        style: AppText.label(context, size: 12)),
                    const SizedBox(width: 16),
                    Icon(Icons.article_rounded,
                        size: 16, color: palette.textSecondary),
                    const SizedBox(width: 6),
                    Text('${l.wordCount} words',
                        style: AppText.label(context, size: 12)),
                  ],
                ),
                const SizedBox(height: 24),

                // body paragraphs
                ...l.paragraphs.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Text(p,
                          style: AppText.body(context,
                              size: 16, color: palette.textPrimary)),
                    )),

                // key concepts
                if (l.keyConcepts.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text('Key Concepts',
                      style: AppText.heading(context, size: 18)),
                  const SizedBox(height: 12),
                  ...l.keyConcepts.map((k) => _KeyConceptBox(concept: k)),
                ],

                // action steps
                if (l.actionSteps.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Action Steps',
                          style: AppText.heading(context, size: 18)),
                      const SizedBox(width: 8),
                      const XpGainBadge(amount: 5),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(
                    l.actionSteps.length,
                    (i) => _ActionStep(
                      text: l.actionSteps[i],
                      checked: _stepChecked[i],
                      onTap: () => _toggleStep(i),
                    ),
                  ),
                ],

                // key takeaways
                if (l.keyTakeaways.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Key Takeaways',
                      style: AppText.heading(context, size: 18)),
                  const SizedBox(height: 12),
                  GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final t in l.keyTakeaways)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    gradient: AppGradients.progress,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(t,
                                      style: AppText.body(context, size: 14)),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],

                // quiz prompt
                if (l.hasQuiz) ...[
                  const SizedBox(height: 20),
                  _QuizPrompt(
                    taken: _progress.quizScore(l.id) != null,
                    score: _progress.quizScore(l.id),
                    onTap: _openQuiz,
                  ),
                ],

                const SizedBox(height: 28),

                // complete / next
                if (!_completed)
                  PrimaryButton(
                    label: 'Mark Complete',
                    icon: Icons.check_circle_rounded,
                    onPressed: _markComplete,
                  )
                else ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: AppColors.success.withValues(alpha: 0.4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded,
                            color: AppColors.success),
                        const SizedBox(width: 10),
                        Text('Lesson completed',
                            style: AppText.heading(context,
                                size: 15, color: AppColors.success)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (_nextLesson != null)
                    PrimaryButton(
                      label: 'Next Lesson',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => LessonScreen(
                                lesson: _nextLesson!, course: widget.course),
                          ),
                        );
                      },
                    )
                  else
                    SecondaryButton(
                      label: 'Back to Course',
                      onPressed: () => Navigator.pop(context),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyConceptBox extends StatelessWidget {
  final KeyConcept concept;
  const _KeyConceptBox({required this.concept});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentEmerald.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_rounded,
                  color: AppColors.accentEmerald, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(concept.title,
                    style: AppText.heading(context,
                        size: 15, color: AppColors.accentEmerald)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(concept.description, style: AppText.body(context, size: 14)),
        ],
      ),
    );
  }
}

class _ActionStep extends StatelessWidget {
  final String text;
  final bool checked;
  final VoidCallback onTap;
  const _ActionStep(
      {required this.text, required this.checked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppPalette.of(context).card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: checked
                ? AppColors.success.withValues(alpha: 0.5)
                : AppPalette.of(context).border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                gradient: checked ? AppGradients.progress : null,
                color: checked ? null : Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: checked
                      ? AppColors.success
                      : AppPalette.of(context).textSecondary,
                  width: 1.5,
                ),
              ),
              child: checked
                  ? const Icon(Icons.check_rounded,
                      size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text,
                  style: AppText.body(context,
                      size: 14,
                      color: AppPalette.of(context).textPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizPrompt extends StatelessWidget {
  final bool taken;
  final int? score;
  final VoidCallback onTap;
  const _QuizPrompt(
      {required this.taken, required this.score, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: AppGradients.gold,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.quiz_rounded, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taken ? 'Retake the Quiz' : 'Test Your Knowledge',
                    style: AppText.heading(context, size: 15)),
                const SizedBox(height: 2),
                Text(
                    taken
                        ? 'Best score: ${score ?? 0}/5 — try to beat it!'
                        : '5 questions • +20 XP for passing',
                    style: AppText.label(context, size: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}

class _RoundIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  const _RoundIcon({required this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: palette.cardStrong,
          shape: BoxShape.circle,
          border: Border.all(color: palette.border),
        ),
        child: Icon(icon, size: 18, color: color ?? palette.textPrimary),
      ),
    );
  }
}
