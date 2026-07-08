import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A number that animates (counts up) from an old value to a new value.
class XpCounter extends StatelessWidget {
  final int value;
  final double size;
  final Color? color;
  final String suffix;
  final Duration duration;

  const XpCounter({
    super.key,
    required this.value,
    this.size = 24,
    this.color,
    this.suffix = '',
    this.duration = const Duration(milliseconds: 900),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value.toDouble()),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, v, _) {
        return Text(
          '${v.round()}$suffix',
          style: AppText.number(context, size: size, color: color),
        );
      },
    );
  }
}

/// A small "+15 XP" badge that floats up and fades — used on lesson completion.
class XpGainBadge extends StatelessWidget {
  final int amount;
  const XpGainBadge({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.scale(scale: 0.8 + 0.2 * t, child: child),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          gradient: AppGradients.gold,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: [
            BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
            const SizedBox(width: 4),
            Text(
              '+$amount XP',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
