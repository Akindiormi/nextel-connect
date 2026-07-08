import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import 'tool_page.dart';

class _Item {
  String name;
  double amount;
  _Item(this.name, this.amount);
}

class StartupEstimator extends StatefulWidget {
  const StartupEstimator({super.key});

  @override
  State<StartupEstimator> createState() => _StartupEstimatorState();
}

class _StartupEstimatorState extends State<StartupEstimator> {
  final List<_Item> _items = [
    _Item('Starting float / capital', 20000),
    _Item('Business registration (CAC)', 15000),
    _Item('Smartphone / device', 0),
    _Item('Data subscription', 5000),
    _Item('Branding & flyers', 3000),
  ];

  final _name = TextEditingController();
  final _amount = TextEditingController();

  double get _total => _items.fold(0, (s, i) => s + i.amount);

  void _add() {
    final n = _name.text.trim();
    final a = double.tryParse(_amount.text) ?? 0;
    if (n.isEmpty || a <= 0) return;
    setState(() {
      _items.add(_Item(n, a));
      _name.clear();
      _amount.clear();
    });
    HapticFeedback.selectionClick();
  }

  void _export() {
    final buffer = StringBuffer('Nextel — Startup Cost Estimate\n\n');
    for (final i in _items) {
      buffer.writeln('${i.name}: ₦${i.amount.toStringAsFixed(0)}');
    }
    buffer.writeln('\nTOTAL: ₦${_total.toStringAsFixed(0)}');
    Clipboard.setData(ClipboardData(text: buffer.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Summary copied to clipboard'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'startup',
      title: 'Startup Cost Estimator',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassCard(
            gradient: AppGradients.greenHeader,
            child: Column(
              children: [
                Text('Estimated Total',
                    style: AppText.label(context,
                        size: 12, color: Colors.white70)),
                const SizedBox(height: 6),
                Text('₦${_total.toStringAsFixed(0)}',
                    style: AppText.number(context, size: 34, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ..._items.asMap().entries.map((e) => _ItemRow(
                item: e.value,
                onRemove: () => setState(() => _items.removeAt(e.key)),
              )),
          const SizedBox(height: 16),
          Text('Add a custom item', style: AppText.label(context, size: 13)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: GlassTextField(
                  label: '',
                  hint: 'Item name',
                  controller: _name,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: GlassTextField(
                  label: '',
                  hint: '₦',
                  controller: _amount,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: 'Add Item',
            icon: Icons.add_rounded,
            onPressed: _add,
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            label: 'Export Summary',
            icon: Icons.ios_share_rounded,
            onPressed: _export,
          ),
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final _Item item;
  final VoidCallback onRemove;
  const _ItemRow({required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        radius: 16,
        child: Row(
          children: [
            Expanded(
              child: Text(item.name, style: AppText.body(context, size: 14)),
            ),
            Text('₦${item.amount.toStringAsFixed(0)}',
                style: AppText.number(context, size: 15)),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onRemove,
              child: Icon(Icons.close_rounded,
                  size: 18, color: AppPalette.of(context).textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
