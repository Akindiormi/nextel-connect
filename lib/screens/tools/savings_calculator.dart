import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

class SavingsCalculator extends StatefulWidget {
  const SavingsCalculator({super.key});

  @override
  State<SavingsCalculator> createState() => _SavingsCalculatorState();
}

class _SavingsCalculatorState extends State<SavingsCalculator> {
  final _goal = TextEditingController();
  final _weekly = TextEditingController();

  double get _goalVal => double.tryParse(_goal.text) ?? 0;
  double get _weeklyVal => double.tryParse(_weekly.text) ?? 0;

  int get _weeksNeeded =>
      _weeklyVal <= 0 ? 0 : (_goalVal / _weeklyVal).ceil();

  String get _timeLabel {
    if (_weeksNeeded <= 0) return '—';
    if (_weeksNeeded < 5) return '$_weeksNeeded week${_weeksNeeded == 1 ? '' : 's'}';
    final months = (_weeksNeeded / 4.33).ceil();
    return '$months month${months == 1 ? '' : 's'}';
  }

  @override
  void dispose() {
    _goal.dispose();
    _weekly.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'savings',
      title: 'Savings Calculator',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Enter your savings goal and how much you can set aside each '
            'week to see how long it will take to get there.',
            style: AppText.body(context, size: 14),
          ),
          const SizedBox(height: 20),
          GlassTextField(
            label: 'Savings Goal (₦)',
            hint: 'e.g. 100000',
            controller: _goal,
            keyboardType: TextInputType.number,
            icon: Icons.savings_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Amount You Can Save Weekly (₦)',
            hint: 'e.g. 5000',
            controller: _weekly,
            keyboardType: TextInputType.number,
            icon: Icons.wallet_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 28),
          GlassCard(
            gradient: AppGradients.primaryButton,
            child: Column(
              children: [
                Text('Time to Reach Your Goal',
                    style: AppText.label(context,
                        size: 12, color: Colors.white70)),
                const SizedBox(height: 8),
                Text(_timeLabel,
                    style: AppText.number(context, size: 40, color: Colors.white)),
                const SizedBox(height: 8),
                Text(
                  _weeksNeeded > 0
                      ? 'Saving ₦${_weeklyVal.toStringAsFixed(0)} every week'
                      : 'Fill in both fields to see your timeline',
                  style: AppText.body(context, size: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GlassCard(
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    color: AppColors.accentEmerald),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Small, consistent weekly savings add up faster than '
                    'waiting to save a big amount all at once.',
                    style: AppText.body(context, size: 13),
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
