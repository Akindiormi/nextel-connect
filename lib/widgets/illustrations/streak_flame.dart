import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// An animated flame that grows taller with the streak and shifts colour:
/// green at 3 days, gold at 7, red at 30.
class StreakFlame extends StatefulWidget {
  final int streak;
  final double size;

  const StreakFlame({super.key, required this.streak, this.size = 64});

  @override
  State<StreakFlame> createState() => _StreakFlameState();
}

class _StreakFlameState extends State<StreakFlame>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  Color get _flameColor {
    if (widget.streak >= 30) return const Color(0xFFEF4444);
    if (widget.streak >= 7) return AppColors.gold;
    return AppColors.success;
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 0 streak = small ember; grows with streak up to a cap
    final grow = (0.5 + (widget.streak / 30).clamp(0, 1) * 0.5);
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(
          painter: _FlamePainter(
            flicker: _c.value,
            color: _flameColor,
            grow: grow,
            lit: widget.streak > 0,
          ),
        ),
      ),
    );
  }
}

class _FlamePainter extends CustomPainter {
  final double flicker;
  final Color color;
  final double grow;
  final bool lit;

  _FlamePainter({
    required this.flicker,
    required this.color,
    required this.grow,
    required this.lit,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final baseX = w / 2;
    final baseY = h * 0.9;
    final flameH = h * grow * (0.9 + 0.1 * math.sin(flicker * math.pi * 2));
    final flameW = w * 0.42 * (0.95 + 0.05 * flicker);

    // glow
    if (lit) {
      canvas.drawCircle(
        Offset(baseX, baseY - flameH * 0.5),
        flameW * 1.3,
        Paint()
          ..color = color.withValues(alpha: 0.22)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
      );
    }

    Path flame(double scale) {
      final tipY = baseY - flameH * scale;
      final path = Path()..moveTo(baseX, baseY);
      path.quadraticBezierTo(
        baseX + flameW * scale, baseY - flameH * scale * 0.4,
        baseX + flameW * scale * 0.3, baseY - flameH * scale * 0.7,
      );
      path.quadraticBezierTo(
        baseX + flameW * scale * 0.5, tipY + flameH * 0.1,
        baseX, tipY,
      );
      path.quadraticBezierTo(
        baseX - flameW * scale * 0.5, tipY + flameH * 0.1,
        baseX - flameW * scale * 0.3, baseY - flameH * scale * 0.7,
      );
      path.quadraticBezierTo(
        baseX - flameW * scale, baseY - flameH * scale * 0.4,
        baseX, baseY,
      );
      path.close();
      return path;
    }

    if (!lit) {
      // grey ember when no streak
      canvas.drawPath(
        flame(1),
        Paint()..color = Colors.grey.withValues(alpha: 0.3),
      );
      return;
    }

    // outer flame
    canvas.drawPath(
      flame(1),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [color, color.withValues(alpha: 0.6)],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );
    // inner brighter flame
    canvas.drawPath(
      flame(0.55),
      Paint()..color = Colors.white.withValues(alpha: 0.85),
    );
  }

  @override
  bool shouldRepaint(covariant _FlamePainter old) =>
      old.flicker != flicker ||
      old.color != color ||
      old.grow != grow ||
      old.lit != lit;
}
