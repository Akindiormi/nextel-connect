import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A "planet" representing the user's level, with XP particles orbiting it.
/// More XP means more particles and a larger glow.
class XpOrbit extends StatefulWidget {
  final int level;
  final int xp;
  final double size;

  const XpOrbit({
    super.key,
    required this.level,
    required this.xp,
    this.size = 200,
  });

  @override
  State<XpOrbit> createState() => _XpOrbitState();
}

class _XpOrbitState extends State<XpOrbit> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 12),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // particles scale with xp, capped for performance
    final particles = (8 + widget.xp / 60).clamp(8, 46).toInt();
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(
          painter: _OrbitPainter(
            t: _c.value,
            level: widget.level,
            particles: particles,
            glow: (widget.xp / 5000).clamp(0.2, 1.0),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('LVL',
                    style: AppText.label(context,
                        size: 11, color: Colors.white70)),
                Text('${widget.level}',
                    style: AppText.number(context,
                        size: 40, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final double t;
  final int level;
  final int particles;
  final double glow;

  _OrbitPainter({
    required this.t,
    required this.level,
    required this.particles,
    required this.glow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final planetR = size.width * 0.22;

    // outer glow
    canvas.drawCircle(
      center,
      planetR + 18 * glow,
      Paint()
        ..color = AppColors.accentEmerald.withValues(alpha: 0.25 * glow)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20 * glow + 6),
    );

    // orbit rings
    for (final r in [0.34, 0.42, 0.48]) {
      canvas.drawCircle(
        center,
        size.width * r,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.white.withValues(alpha: 0.12),
      );
    }

    // planet
    canvas.drawCircle(
      center,
      planetR,
      Paint()
        ..shader = const RadialGradient(
          colors: [AppColors.accentEmerald, AppColors.primaryDark],
        ).createShader(Rect.fromCircle(center: center, radius: planetR)),
    );
    // planet highlight
    canvas.drawCircle(
      center.translate(-planetR * 0.3, -planetR * 0.3),
      planetR * 0.35,
      Paint()..color = Colors.white.withValues(alpha: 0.18),
    );

    // orbiting particles
    final rnd = math.Random(7);
    for (int i = 0; i < particles; i++) {
      final ringR = size.width * (0.32 + 0.18 * rnd.nextDouble());
      final speed = 0.6 + rnd.nextDouble() * 1.4;
      final phase = rnd.nextDouble() * 2 * math.pi;
      final angle = phase + t * 2 * math.pi * speed;
      final tilt = 0.5 + rnd.nextDouble() * 0.5;
      final p = Offset(
        center.dx + ringR * math.cos(angle),
        center.dy + ringR * math.sin(angle) * tilt,
      );
      final isGold = i % 5 == 0;
      final pr = 2.0 + rnd.nextDouble() * 2.2;
      canvas.drawCircle(
        p,
        pr,
        Paint()
          ..color = (isGold ? AppColors.gold : AppColors.success)
              .withValues(alpha: 0.9)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter old) =>
      old.t != t || old.particles != particles || old.glow != glow;
}
