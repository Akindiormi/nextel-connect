import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import 'tool_page.dart';

class _Phase {
  final String title;
  final List<String> items;
  const _Phase(this.title, this.items);
}

const List<_Phase> _phases = [
  _Phase('Phase 1: Foundation', [
    'Decide your business name',
    'Research your local competition',
    'Choose your starting capital / float',
    'Open a dedicated business bank account',
    'Register your business with CAC',
    'Define your target customers',
    'Set your service offerings (airtime, data, bills)',
    'Draft your first price list',
  ]),
  _Phase('Phase 2: Setup', [
    'Choose a reliable VTU platform',
    'Register and verify on the platform',
    'Fund your first wallet',
    'Practise test transactions on all networks',
    'Set up a secure transaction PIN',
    'Identify a backup supplier',
    'Set up your customer record system',
    'Create your WhatsApp business profile',
    'Prepare your no-credit policy',
  ]),
  _Phase('Phase 3: Launch', [
    'Announce your launch to your warm network',
    'Post your plans on WhatsApp status',
    'Make your first five sales',
    'Record every transaction from day one',
    'Ask early customers for referrals',
    'Reconcile your numbers daily',
    'Set your first weekly goal',
    'Plan your reinvestment routine',
  ]),
];

class BusinessChecklist extends StatefulWidget {
  const BusinessChecklist({super.key});

  @override
  State<BusinessChecklist> createState() => _BusinessChecklistState();
}

class _BusinessChecklistState extends State<BusinessChecklist> {
  static const _key = 'business_checklist';
  Set<String> _done = {};
  SharedPreferences? _prefs;

  List<String> get _all =>
      [for (final p in _phases) ...p.items.map((i) => '${p.title}|$i')];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs!.getString(_key);
    if (raw != null) {
      _done = (jsonDecode(raw) as List).cast<String>().toSet();
    }
    setState(() {});
  }

  Future<void> _toggle(String id) async {
    HapticFeedback.selectionClick();
    setState(() {
      _done.contains(id) ? _done.remove(id) : _done.add(id);
    });
    await _prefs?.setString(_key, jsonEncode(_done.toList()));
  }

  @override
  Widget build(BuildContext context) {
    final total = _all.length;
    final completed = _done.length;
    final progress = total == 0 ? 0.0 : completed / total;

    return ToolPage(
      toolId: 'checklist',
      title: 'Business Checklist',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // progress ring
          GlassCard(
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CustomPaint(
                    painter: _RingPainter(progress),
                    child: Center(
                      child: Text('${(progress * 100).round()}%',
                          style: AppText.number(context, size: 18)),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$completed of $total done',
                          style: AppText.heading(context, size: 18)),
                      const SizedBox(height: 4),
                      Text(
                          progress == 1
                              ? 'Your business is launch-ready! 🚀'
                              : 'Work through each phase step by step.',
                          style: AppText.body(context, size: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          for (final phase in _phases) ...[
            Text(phase.title, style: AppText.heading(context, size: 17)),
            const SizedBox(height: 12),
            ...phase.items.map((item) {
              final id = '${phase.title}|$item';
              final checked = _done.contains(id);
              return GestureDetector(
                onTap: () => _toggle(id),
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
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          gradient: checked ? AppGradients.progress : null,
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
                        child: Text(item,
                            style: AppText.body(context,
                                size: 14,
                                color: checked
                                    ? AppPalette.of(context).textSecondary
                                    : AppPalette.of(context).textPrimary)),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double value;
  _RingPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..color = AppColors.primaryDark.withValues(alpha: 0.1),
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round
        ..shader = const LinearGradient(
          colors: [AppColors.success, AppColors.accentEmerald],
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) => old.value != value;
}
