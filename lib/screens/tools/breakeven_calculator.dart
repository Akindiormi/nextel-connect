import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

class BreakevenCalculator extends StatefulWidget {
  const BreakevenCalculator({super.key});

  @override
  State<BreakevenCalculator> createState() => _BreakevenCalculatorState();
}

class _BreakevenCalculatorState extends State<BreakevenCalculator> {
  final _fixedCosts = TextEditingController();
  final _price = TextEditingController();
  final _variableCost = TextEditingController();

  double get _fixedVal => double.tryParse(_fixedCosts.text) ?? 0;
  double get _priceVal => double.tryParse(_price.text) ?? 0;
  double get _variableVal => double.tryParse(_variableCost.text) ?? 0;

  double get _marginPerUnit => _priceVal - _variableVal;

  int get _unitsNeeded =>
      _marginPerUnit <= 0 ? 0 : (_fixedVal / _marginPerUnit).ceil();

  @override
  void dispose() {
    _fixedCosts.dispose();
    _price.dispose();
    _variableCost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final invalid = _priceVal > 0 && _marginPerUnit <= 0;
    return ToolPage(
      toolId: 'breakeven',
      title: 'Break-Even Calculator',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Find out how many units you need to sell before your '
            'business starts making a profit.',
            style: AppText.body(context, size: 14),
          ),
          const SizedBox(height: 20),
          GlassTextField(
            label: 'Fixed Costs (₦)',
            hint: 'e.g. rent, salaries — 50000',
            controller: _fixedCosts,
            keyboardType: TextInputType.number,
            icon: Icons.home_work_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Selling Price per Unit (₦)',
            hint: 'e.g. 1000',
            controller: _price,
            keyboardType: TextInputType.number,
            icon: Icons.sell_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Cost per Unit (₦)',
            hint: 'e.g. 600',
            controller: _variableCost,
            keyboardType: TextInputType.number,
            icon: Icons.inventory_2_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 28),
          GlassCard(
            gradient: AppGradients.primaryButton,
            child: Column(
              children: [
                Text('Units to Break Even',
                    style: AppText.label(context,
                        size: 12, color: Colors.white70)),
                const SizedBox(height: 8),
                Text(
                  invalid ? '—' : '$_unitsNeeded',
                  style: AppText.number(context, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  invalid
                      ? 'Selling price must be higher than cost per unit'
                      : _unitsNeeded > 0
                          ? 'Units you need to sell before turning a profit'
                          : 'Fill in the fields above to see your break-even point',
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
                    'Every unit sold after your break-even point is pure '
                    'profit — this is the number to watch when planning stock.',
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
