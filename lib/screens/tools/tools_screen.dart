import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/progress_service.dart';
import '../../widgets/common/app_cards.dart';
import 'profit_calculator.dart';
import 'startup_estimator.dart';
import 'pricing_calculator.dart';
import 'business_checklist.dart';
import 'customer_records.dart';
import 'goal_tracker.dart';

class ToolDef {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget Function() build;
  const ToolDef(this.id, this.title, this.subtitle, this.icon, this.color,
      this.build);
}

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final _progress = ProgressService.instance;

  late final List<ToolDef> _tools = [
    ToolDef('profit', 'Profit Margin', 'Cost vs selling price',
        Icons.trending_up_rounded, AppColors.success, () => const ProfitCalculator()),
    ToolDef('startup', 'Startup Cost', 'Estimate what you need',
        Icons.receipt_long_rounded, AppColors.gold, () => const StartupEstimator()),
    ToolDef('pricing', 'Pricing Tool', 'Set the right price',
        Icons.sell_rounded, AppColors.accentEmerald, () => const PricingCalculator()),
    ToolDef('checklist', 'Business Checklist', '25-step launch plan',
        Icons.checklist_rounded, AppColors.secondaryGreen, () => const BusinessChecklist()),
    ToolDef('customers', 'Customer Records', 'Track your customers',
        Icons.contacts_rounded, AppColors.primaryDark, () => const CustomerRecords()),
    ToolDef('goals', 'Goal Tracker', 'Hit weekly targets',
        Icons.flag_rounded, AppColors.gold, () => const GoalTracker()),
  ];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        children: [
          Text('Business Tools', style: AppText.display(context, size: 28)),
          const SizedBox(height: 4),
          Text('Practical tools to plan and run your business',
              style: AppText.body(context, size: 14)),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.95,
            children: [
              for (final t in _tools)
                GlassCard(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => t.build()),
                  ),
                  padding: const EdgeInsets.all(16),
                  radius: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: t.color.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(t.icon, color: t.color, size: 28),
                          ),
                          if (_progress.isToolUsed(t.id))
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(Icons.check_circle_rounded,
                                  color: AppColors.success, size: 18),
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.title,
                              style: AppText.heading(context, size: 16)),
                          const SizedBox(height: 2),
                          Text(t.subtitle,
                              style: AppText.label(context, size: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
