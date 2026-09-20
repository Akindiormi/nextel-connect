import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

/// A guided, one-screen "build your business plan" challenge. The learner
/// fills in a handful of real numbers and gets a computed projection at
/// the end — the "I actually did something" payoff the course content
/// keeps pointing toward. Entirely local; no data leaves the device.
class BusinessPlanBuilder extends StatefulWidget {
  const BusinessPlanBuilder({super.key});

  @override
  State<BusinessPlanBuilder> createState() => _BusinessPlanBuilderState();
}

class _BusinessPlanBuilderState extends State<BusinessPlanBuilder> {
  final _capital = TextEditingController();
  final _location = TextEditingController();
  final _customers = TextEditingController();
  final _feePerCustomer = TextEditingController();
  final _dailyExpenses = TextEditingController();
  final _reservePercent = TextEditingController(text: '15');

  double get _capitalVal => double.tryParse(_capital.text) ?? 0;
  double get _customersVal => double.tryParse(_customers.text) ?? 0;
  double get _feeVal => double.tryParse(_feePerCustomer.text) ?? 0;
  double get _expensesVal => double.tryParse(_dailyExpenses.text) ?? 0;
  double get _reserveVal => double.tryParse(_reservePercent.text) ?? 0;

  double get _dailyRevenue => _customersVal * _feeVal;
  double get _dailyProfit => _dailyRevenue - _expensesVal;
  double get _monthlyProfit => _dailyProfit * 30;
  double get _emergencyReserve => _monthlyProfit > 0
      ? _monthlyProfit * (_reserveVal / 100)
      : 0;
  int get _breakEvenDays =>
      _dailyProfit <= 0 ? 0 : (_capitalVal / _dailyProfit).ceil();

  bool get _hasEnoughInput =>
      _capitalVal > 0 && _customersVal > 0 && _feeVal > 0;

  @override
  void dispose() {
    _capital.dispose();
    _location.dispose();
    _customers.dispose();
    _feePerCustomer.dispose();
    _dailyExpenses.dispose();
    _reservePercent.dispose();
    super.dispose();
  }

  void _export() {
    final buffer = StringBuffer('Nextel — My Business Plan\n\n');
    if (_location.text.trim().isNotEmpty) {
      buffer.writeln('Location: ${_location.text.trim()}');
    }
    buffer.writeln('Starting capital: \u20a6${_capitalVal.toStringAsFixed(0)}');
    buffer.writeln('Expected daily customers: ${_customersVal.toStringAsFixed(0)}');
    buffer.writeln('Fee/margin per customer: \u20a6${_feeVal.toStringAsFixed(0)}');
    buffer.writeln('Daily expenses: \u20a6${_expensesVal.toStringAsFixed(0)}');
    buffer.writeln('\n--- Projection ---');
    buffer.writeln('Daily revenue: \u20a6${_dailyRevenue.toStringAsFixed(0)}');
    buffer.writeln('Daily profit: \u20a6${_dailyProfit.toStringAsFixed(0)}');
    buffer.writeln('Monthly profit: \u20a6${_monthlyProfit.toStringAsFixed(0)}');
    buffer.writeln(
        'Suggested emergency reserve (${_reserveVal.toStringAsFixed(0)}% of monthly profit): \u20a6${_emergencyReserve.toStringAsFixed(0)}');
    if (_breakEvenDays > 0) {
      buffer.writeln('Break-even: ~$_breakEvenDays days to recover starting capital');
    }
    Clipboard.setData(ClipboardData(text: buffer.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Business plan copied to clipboard'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'business_plan',
      title: 'Business Plan Builder',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Fill in real numbers for your business idea and get a '
            'computed projection at the end \u2014 this is your first real '
            'business plan, not just a lesson.',
            style: AppText.body(context, size: 14),
          ),
          const SizedBox(height: 20),
          GlassTextField(
            label: 'Starting Capital (\u20a6)',
            hint: 'e.g. 150000',
            controller: _capital,
            keyboardType: TextInputType.number,
            icon: Icons.account_balance_wallet_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Location (optional)',
            hint: 'e.g. Ojuelegba market',
            controller: _location,
            icon: Icons.location_on_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Expected Daily Customers',
            hint: 'e.g. 30',
            controller: _customers,
            keyboardType: TextInputType.number,
            icon: Icons.people_outline,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Fee / Margin per Customer (\u20a6)',
            hint: 'e.g. 200',
            controller: _feePerCustomer,
            keyboardType: TextInputType.number,
            icon: Icons.payments_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Daily Expenses (\u20a6)',
            hint: 'e.g. 1500',
            controller: _dailyExpenses,
            keyboardType: TextInputType.number,
            icon: Icons.receipt_long_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          GlassTextField(
            label: 'Emergency Reserve (% of monthly profit)',
            hint: '15',
            controller: _reservePercent,
            keyboardType: TextInputType.number,
            icon: Icons.shield_outlined,
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 28),
          if (_hasEnoughInput) ...[
            GlassCard(
              gradient: AppGradients.primaryButton,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('YOUR PROJECTION',
                      style: AppText.label(context,
                          size: 11, color: Colors.white70)),
                  const SizedBox(height: 14),
                  _ProjectionRow('Daily revenue',
                      '\u20a6${_dailyRevenue.toStringAsFixed(0)}'),
                  _ProjectionRow('Daily profit',
                      '\u20a6${_dailyProfit.toStringAsFixed(0)}'),
                  _ProjectionRow('Monthly profit',
                      '\u20a6${_monthlyProfit.toStringAsFixed(0)}',
                      big: true),
                  _ProjectionRow('Suggested emergency reserve',
                      '\u20a6${_emergencyReserve.toStringAsFixed(0)}'),
                  if (_breakEvenDays > 0)
                    _ProjectionRow('Break-even on starting capital',
                        '~$_breakEvenDays days'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _export,
                icon: const Icon(Icons.copy_rounded, size: 18),
                label: const Text('Copy My Business Plan'),
              ),
            ),
          ] else
            GlassCard(
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded,
                      color: AppColors.accentEmerald),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Fill in capital, expected customers, and your fee '
                      'per customer to see your projection.',
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

class _ProjectionRow extends StatelessWidget {
  final String label;
  final String value;
  final bool big;
  const _ProjectionRow(this.label, this.value, {this.big = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label,
                style: AppText.body(context, size: 13, color: Colors.white70)),
          ),
          Text(value,
              style: AppText.number(context,
                  size: big ? 20 : 15, color: Colors.white)),
        ],
      ),
    );
  }
}
