import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

class PricingCalculator extends StatefulWidget {
  const PricingCalculator({super.key});

  @override
  State<PricingCalculator> createState() => _PricingCalculatorState();
}

class _PricingCalculatorState extends State<PricingCalculator> {
  final _cost = TextEditingController();
  final _margin = TextEditingController(text: '15');

  double get _costVal => double.tryParse(_cost.text) ?? 0;
  double get _marginVal => double.tryParse(_margin.text) ?? 0;
  // Recommended price so that margin% of the price is profit.
  double get _price =>
      _marginVal >= 100 ? 0 : _costVal / (1 - _marginVal / 100);
  double get _profit => _price - _costVal;

  @override
  void dispose() {
    _cost.dispose();
    _margin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'pricing',
      title: 'Pricing Calculator',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Enter your cost and the profit margin you want to find the '
              'right selling price.',
              style: AppText.body(context, size: 14)),
          const SizedBox(height: 20),
          GlassTextField(
            label: 'Your Cost (₦)',
            hint: 'e.g. 850',
            controller: _cost,
            keyboardType: TextInputType.number,
            icon: Icons.shopping_cart_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Desired Profit Margin (%)',
            hint: 'e.g. 15',
            controller: _margin,
            keyboardType: TextInputType.number,
            icon: Icons.percent_rounded,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 28),
          GlassCard(
            gradient: AppGradients.primaryButton,
            child: Column(
              children: [
                Text('Recommended Price',
                    style: AppText.label(context,
                        size: 12, color: Colors.white70)),
                const SizedBox(height: 8),
                Text('₦${_price.toStringAsFixed(0)}',
                    style: AppText.number(context, size: 40, color: Colors.white)),
                const SizedBox(height: 8),
                Text('Profit of ₦${_profit.toStringAsFixed(0)} per sale',
                    style: AppText.body(context,
                        size: 13, color: Colors.white70)),
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
                    'Remember: airtime always sells at face value. Use this for '
                    'data bundles and other products where you set the price.',
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
