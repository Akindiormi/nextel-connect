import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../models/lesson.dart';
import '../../services/progress_service.dart';
import '../../widgets/animations/celebration_overlay.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';

class QuizScreen extends StatefulWidget {
  final Lesson lesson;
  const QuizScreen({super.key, required this.lesson});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _progress = ProgressService.instance;
  int _index = 0;
  int? _selected;
  bool _revealed = false;
  int _score = 0;
  bool _finished = false;
  final List<int?> _answers = [];

  List<QuizQuestion> get _questions => widget.lesson.quiz;

  @override
  void initState() {
    super.initState();
    _answers.addAll(List.filled(_questions.length, null));
  }

  void _choose(int i) {
    if (_revealed) return;
    HapticFeedback.selectionClick();
    setState(() {
      _selected = i;
      _revealed = true;
      _answers[_index] = i;
      if (i == _questions[_index].correctIndex) {
        _score++;
        HapticFeedback.lightImpact();
      } else {
        HapticFeedback.heavyImpact();
      }
    });
  }

  void _next() async {
    if (_index < _questions.length - 1) {
      setState(() {
        _index++;
        _selected = null;
        _revealed = false;
      });
    } else {
      final passed = _score >= (_questions.length * 0.6).ceil();
      final xp = await _progress.recordQuiz(widget.lesson.id, _score, passed);
      setState(() => _finished = true);
      if (passed && xp > 0 && mounted) {
        await showCelebration(
          context,
          title: 'Quiz Passed!',
          message: 'You scored $_score/${_questions.length} and earned XP.',
          icon: Icons.psychology_rounded,
          color: AppColors.accentEmerald,
        );
      }
    }
  }

  void _retry() {
    setState(() {
      _index = 0;
      _selected = null;
      _revealed = false;
      _score = 0;
      _finished = false;
      for (int i = 0; i < _answers.length; i++) {
        _answers[i] = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_finished) return _buildResult();
    final q = _questions[_index];
    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Quiz',
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GradientProgressBar(
                        value: (_index + 1) / _questions.length, height: 8),
                  ),
                  const SizedBox(width: 12),
                  Text('${_index + 1}/${_questions.length}',
                      style: AppText.label(context, size: 13)),
                ],
              ),
              const SizedBox(height: 28),
              Text('Question ${_index + 1}',
                  style: AppText.label(context,
                      size: 13, color: AppColors.accentEmerald)),
              const SizedBox(height: 8),
              Text(q.question, style: AppText.heading(context, size: 22)),
              const SizedBox(height: 28),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 0; i < q.options.length; i++)
                      _OptionCard(
                        text: q.options[i],
                        state: _optionState(i, q),
                        onTap: () => _choose(i),
                      ),
                    if (_revealed && q.explanation.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.accentEmerald.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline_rounded,
                                color: AppColors.accentEmerald, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(q.explanation,
                                  style: AppText.body(context, size: 13)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (_revealed)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PrimaryButton(
                    label: _index < _questions.length - 1
                        ? 'Next Question'
                        : 'See Results',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: _next,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _OptionState _optionState(int i, QuizQuestion q) {
    if (!_revealed) {
      return _selected == i ? _OptionState.selected : _OptionState.idle;
    }
    if (i == q.correctIndex) return _OptionState.correct;
    if (i == _selected) return _OptionState.wrong;
    return _OptionState.idle;
  }

  Widget _buildResult() {
    final passed = _score >= (_questions.length * 0.6).ceil();
    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient:
                      passed ? AppGradients.progress : AppGradients.gold,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (passed ? AppColors.success : AppColors.gold)
                          .withValues(alpha: 0.4),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Icon(
                  passed
                      ? Icons.emoji_events_rounded
                      : Icons.refresh_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              const SizedBox(height: 28),
              Text(passed ? 'Well done!' : 'Keep practising',
                  style: AppText.display(context, size: 28)),
              const SizedBox(height: 10),
              Text(
                'You scored $_score out of ${_questions.length}',
                style: AppText.body(context, size: 16),
              ),
              const SizedBox(height: 8),
              if (passed)
                Text('+$kQuizXp XP earned',
                    style: AppText.label(context,
                        size: 14, color: AppColors.gold)),
              const SizedBox(height: 24),
              GlassCard(
                child: Column(
                  children: [
                    for (int i = 0; i < _questions.length; i++)
                      _ReviewRow(
                        index: i + 1,
                        question: _questions[i].question,
                        correct: _answers[i] == _questions[i].correctIndex,
                      ),
                  ],
                ),
              ),
              const Spacer(),
              if (!passed)
                PrimaryButton(
                  label: 'Retry Quiz',
                  icon: Icons.refresh_rounded,
                  onPressed: _retry,
                ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'Back to Lesson',
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

enum _OptionState { idle, selected, correct, wrong }

class _OptionCard extends StatelessWidget {
  final String text;
  final _OptionState state;
  final VoidCallback onTap;
  const _OptionCard(
      {required this.text, required this.state, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    Color border = palette.border;
    Color? fill;
    IconData? icon;
    Color iconColor = AppColors.accentEmerald;
    switch (state) {
      case _OptionState.selected:
        border = AppColors.accentEmerald;
        fill = AppColors.accentEmerald.withValues(alpha: 0.08);
        break;
      case _OptionState.correct:
        border = AppColors.success;
        fill = AppColors.success.withValues(alpha: 0.12);
        icon = Icons.check_circle_rounded;
        iconColor = AppColors.success;
        break;
      case _OptionState.wrong:
        border = const Color(0xFFEF4444);
        fill = const Color(0xFFEF4444).withValues(alpha: 0.10);
        icon = Icons.cancel_rounded;
        iconColor = const Color(0xFFEF4444);
        break;
      case _OptionState.idle:
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: fill ?? palette.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(text,
                  style: AppText.body(context,
                      size: 15, color: palette.textPrimary)),
            ),
            if (icon != null) Icon(icon, color: iconColor, size: 22),
          ],
        ),
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final int index;
  final String question;
  final bool correct;
  const _ReviewRow(
      {required this.index, required this.question, required this.correct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: correct ? AppColors.success : const Color(0xFFEF4444),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text('$index. $question',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppText.body(context, size: 13)),
          ),
        ],
      ),
    );
  }
}
