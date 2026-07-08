import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// An animated weekly bar chart showing lessons completed per day (Mon–Sun).
class WeeklyProgressChart extends StatefulWidget {
  final List<int> values; // length 7, Monday..Sunday
  final double height;

  const WeeklyProgressChart({
    super.key,
    required this.values,
    this.height = 160,
  });

  @override
  State<WeeklyProgressChart> createState() => _WeeklyProgressChartState();
}

class _WeeklyProgressChartState extends State<WeeklyProgressChart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..forward();

  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    final maxVal = (widget.values.isEmpty
            ? 1
            : widget.values.reduce((a, b) => a > b ? a : b))
        .clamp(1, 9999);
    final today = DateTime.now().weekday - 1; // 0..6

    return SizedBox(
      height: widget.height,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0; i < 7; i++)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${widget.values[i]}',
                          style: AppText.label(context,
                              size: 11,
                              color: widget.values[i] > 0
                                  ? AppColors.accentEmerald
                                  : palette.textSecondary)),
                      const SizedBox(height: 6),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: (widget.height - 54) *
                            (widget.values[i] / maxVal) *
                            _c.value,
                        decoration: BoxDecoration(
                          gradient: widget.values[i] > 0
                              ? AppGradients.progress
                              : null,
                          color: widget.values[i] > 0
                              ? null
                              : (palette.isDark
                                  ? Colors.white10
                                  : AppColors.primaryDark
                                      .withValues(alpha: 0.06)),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: widget.values[i] > 0
                              ? [
                                  BoxShadow(
                                    color: AppColors.success
                                        .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                  )
                                ]
                              : null,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 26,
                        height: 26,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == today
                              ? AppColors.accentEmerald.withValues(alpha: 0.16)
                              : Colors.transparent,
                        ),
                        child: Text(
                          _days[i],
                          style: AppText.label(
                            context,
                            size: 12,
                            weight: i == today
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: i == today
                                ? AppColors.accentEmerald
                                : palette.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
