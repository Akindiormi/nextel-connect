import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../services/progress_service.dart';
import '../../widgets/animations/celebration_overlay.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/empty_states.dart';
import 'tool_page.dart';

class GoalTracker extends StatefulWidget {
  const GoalTracker({super.key});

  @override
  State<GoalTracker> createState() => _GoalTrackerState();
}

class _GoalTrackerState extends State<GoalTracker> {
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

  void _addGoal() {
    final title = TextEditingController();
    final target = TextEditingController(text: '7');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: AppPalette.of(context).isDark
                ? const Color(0xFF10231A)
                : Colors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Weekly Goal',
                  style: AppText.heading(context, size: 20)),
              const SizedBox(height: 20),
              GlassTextField(
                label: 'Goal',
                hint: 'e.g. Serve 50 customers',
                controller: title,
              ),
              const SizedBox(height: 14),
              GlassTextField(
                label: 'Target count',
                hint: 'e.g. 50',
                controller: target,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Add Goal',
                icon: Icons.add_rounded,
                onPressed: () {
                  final t = int.tryParse(target.text) ?? 0;
                  if (title.text.trim().isEmpty || t <= 0) return;
                  _progress.addGoal(title.text.trim(), t);
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _increment(String title) async {
    final target = _progress.goals[title]!;
    await _progress.incrementGoal(title);
    HapticFeedback.selectionClick();
    if (_progress.goalProgress[title] == target && mounted) {
      await showCelebration(
        context,
        title: 'Goal Reached!',
        message: 'You completed "$title". Set a new one to keep growing.',
        icon: Icons.flag_rounded,
        color: AppColors.success,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final goals = _progress.goals;
    return ToolPage(
      toolId: 'goals',
      title: 'Goal Tracker',
      body: Column(
        children: [
          Expanded(
            child: goals.isEmpty
                ? EmptyState(
                    icon: Icons.flag_rounded,
                    title: 'No goals yet',
                    message:
                        'Set weekly goals and track your daily progress toward '
                        'them. Small consistent steps build a business.',
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
                    children: [
                      for (final entry in goals.entries)
                        _GoalCard(
                          title: entry.key,
                          target: entry.value,
                          current: _progress.goalProgress[entry.key] ?? 0,
                          onIncrement: () => _increment(entry.key),
                          onRemove: () => _progress.removeGoal(entry.key),
                        ),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: PrimaryButton(
              label: 'Add Goal',
              icon: Icons.add_rounded,
              onPressed: _addGoal,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final String title;
  final int target;
  final int current;
  final VoidCallback onIncrement;
  final VoidCallback onRemove;

  const _GoalCard({
    required this.title,
    required this.target,
    required this.current,
    required this.onIncrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target == 0 ? 0.0 : (current / target).clamp(0.0, 1.0);
    final done = current >= target;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title,
                      style: AppText.heading(context, size: 16)),
                ),
                if (done)
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success)
                else
                  GestureDetector(
                    onTap: onRemove,
                    child: Icon(Icons.close_rounded,
                        size: 18,
                        color: AppPalette.of(context).textSecondary),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: GradientProgressBar(value: progress)),
                const SizedBox(width: 12),
                Text('$current / $target',
                    style: AppText.label(context,
                        size: 13, color: AppColors.accentEmerald)),
              ],
            ),
            const SizedBox(height: 14),
            if (!done)
              SecondaryButton(
                label: 'Log Progress (+1)',
                icon: Icons.add_rounded,
                onPressed: onIncrement,
              )
            else
              Text('Goal reached — well done! 🎉',
                  style: AppText.label(context,
                      size: 13, color: AppColors.success)),
          ],
        ),
      ),
    );
  }
}
