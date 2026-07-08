import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

class ProfitCalculator extends StatefulWidget {
  const ProfitCalculator({super.key});

  @override
  State<ProfitCalculator> createState() => _ProfitCalculatorState();
}

class _ProfitCalculatorState extends State<ProfitCalculator> {
  final _cost = TextEditingController();
  final _sell = TextEditingController();

  double get _costVal => double.tryParse(_cost.text) ?? 0;
  double get _sellVal => double.tryParse(_sell.text) ?? 0;
  double get _profit => _sellVal - _costVal;
  double get _margin => _sellVal > 0 ? (_profit / _sellVal) * 100 : 0;
  double get _markup => _costVal > 0 ? (_profit / _costVal) * 100 : 0;

  @override
  void dispose() {
    _cost.dispose();
    _sell.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'profit',
      title: 'Profit Margin Calculator',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Enter your cost and selling price to see your profit, margin '
              'and markup.',
              style: AppText.body(context, size: 14)),
          const SizedBox(height: 20),
          GlassTextField(
            label: 'Cost Price (₦)',
            hint: 'e.g. 950',
            controller: _cost,
            keyboardType: TextInputType.number,
            icon: Icons.shopping_cart_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Selling Price (₦)',
            hint: 'e.g. 1000',
            controller: _sell,
            keyboardType: TextInputType.number,
            icon: Icons.sell_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 28),

          // gauge
          Center(
            child: SizedBox(
              width: 200,
              height: 130,
              child: CustomPaint(
                painter: _GaugePainter(_margin.clamp(0, 100) / 100),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Text('${_margin.toStringAsFixed(1)}%',
                          style: AppText.number(context, size: 30)),
                      Text('Profit Margin',
                          style: AppText.label(context, size: 11)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _ResultCard(
                  label: 'Profit',
                  value: '₦${_profit.toStringAsFixed(0)}',
                  color: _profit >= 0 ? AppColors.success : const Color(0xFFEF4444),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ResultCard(
                  label: 'Markup',
                  value: '${_markup.toStringAsFixed(1)}%',
                  color: AppColors.gold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GlassCard(
            child: Row(
              children: [
                const Icon(Icons.lightbulb_rounded,
                    color: AppColors.accentEmerald),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _margin < 5 && _sellVal > 0
                        ? 'Thin margin — typical for airtime. Focus on volume.'
                        : (_margin >= 10
                            ? 'Healthy margin — closer to data reselling territory.'
                            : 'Enter values to see guidance on your margin.'),
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

class _ResultCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _ResultCard(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(value, style: AppText.number(context, size: 22, color: color)),
          const SizedBox(height: 4),
          Text(label, style: AppText.label(context, size: 12)),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double value; // 0..1
  _GaugePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2 - 10;
    const start = math.pi;
    const sweep = math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      start,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round
        ..color = AppColors.primaryDark.withValues(alpha: 0.1),
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      start,
      sweep * value,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round
        ..shader = const LinearGradient(
          colors: [AppColors.success, AppColors.accentEmerald],
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );
  }

  @override
  bool shouldRepaint(covariant _GaugePainter old) => old.value != value;
}
