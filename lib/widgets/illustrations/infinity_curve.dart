import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// An animated infinity (lemniscate) curve that fills with green as progress
/// grows. Milestone markers sit at 25/50/75/100% and glow gold when reached.
class InfinityCurve extends StatefulWidget {
  final double progress; // 0..1
  final double height;

  const InfinityCurve({super.key, required this.progress, this.height = 160});

  @override
  State<InfinityCurve> createState() => _InfinityCurveState();
}

class _InfinityCurveState extends State<InfinityCurve>
    with TickerProviderStateMixin {
  late final AnimationController _fill = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );
  late final AnimationController _glow = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);

  late Animation<double> _fillAnim;

  @override
  void initState() {
    super.initState();
    _fillAnim = Tween<double>(begin: 0, end: widget.progress)
        .animate(CurvedAnimation(parent: _fill, curve: Curves.easeOutCubic));
    _fill.forward();
  }

  @override
  void didUpdateWidget(covariant InfinityCurve old) {
    super.didUpdateWidget(old);
    if (old.progress != widget.progress) {
      _fillAnim = Tween<double>(begin: _fillAnim.value, end: widget.progress)
          .animate(CurvedAnimation(parent: _fill, curve: Curves.easeOutCubic));
      _fill
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _fill.dispose();
    _glow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppPalette.of(context).isDark;
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: Listenable.merge([_fill, _glow]),
        builder: (context, _) {
          return CustomPaint(
            painter: _InfinityPainter(
              progress: _fillAnim.value,
              glow: _glow.value,
              isDark: isDark,
            ),
          );
        },
      ),
    );
  }
}

class _InfinityPainter extends CustomPainter {
  final double progress;
  final double glow;
  final bool isDark;

  _InfinityPainter({
    required this.progress,
    required this.glow,
    required this.isDark,
  });

  Offset _pointAt(double t, Size size, double a) {
    // Lemniscate of Gerono parametrisation, scaled to the canvas.
    final cx = size.width / 2;
    final cy = size.height / 2;
    final x = a * math.cos(t);
    final y = a * math.sin(t) * math.cos(t);
    return Offset(cx + x, cy + y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final a = math.min(size.width / 2 - 20, size.height * 0.9);
    const steps = 240;

    final basePath = Path();
    final points = <Offset>[];
    for (int i = 0; i <= steps; i++) {
      final t = -math.pi / 2 + (2 * math.pi) * i / steps;
      final p = _pointAt(t, size, a);
      points.add(p);
      if (i == 0) {
        basePath.moveTo(p.dx, p.dy);
      } else {
        basePath.lineTo(p.dx, p.dy);
      }
    }

    // base track
    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = (isDark ? Colors.white : AppColors.primaryDark)
          .withValues(alpha: 0.10);
    canvas.drawPath(basePath, track);

    // filled portion
    final fillCount = (points.length * progress).round().clamp(0, points.length);
    if (fillCount > 1) {
      final fillPath = Path()..moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < fillCount; i++) {
        fillPath.lineTo(points[i].dx, points[i].dy);
      }
      final fill = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round
        ..shader = const LinearGradient(
          colors: [AppColors.success, AppColors.accentEmerald],
        ).createShader(Offset.zero & size)
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 0.5);
      canvas.drawPath(fillPath, fill);
    }

    // milestone markers
    for (final m in [0.25, 0.5, 0.75, 1.0]) {
      final idx = ((points.length - 1) * m).round();
      final p = points[idx];
      final reached = progress >= m - 0.001;
      if (reached) {
        final glowPaint = Paint()
          ..color = AppColors.gold.withValues(alpha: 0.25 + 0.35 * glow)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6 + 6 * glow);
        canvas.drawCircle(p, 12, glowPaint);
      }
      final marker = Paint()
        ..color = reached ? AppColors.gold : (isDark ? Colors.white24 : Colors.white)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(p, 7, marker);
      final ring = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = reached ? AppColors.gold : AppColors.accentEmerald.withValues(alpha: 0.5);
      canvas.drawCircle(p, 7, ring);
    }
  }

  @override
  bool shouldRepaint(covariant _InfinityPainter old) =>
      old.progress != progress || old.glow != glow || old.isDark != isDark;
}
