import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

enum PathState { completed, current, locked }

class PathNode {
  final String title;
  final IconData icon;
  final PathState state;
  final double progress; // 0..1
  final VoidCallback? onTap;

  const PathNode({
    required this.title,
    required this.icon,
    required this.state,
    this.progress = 0,
    this.onTap,
  });
}

/// A playful, game-style vertical journey map. Nodes zig-zag down a flowing
/// dashed trail that shimmers; completed nodes glow green with a check, the
/// current node bobs and pulses in gold, locked nodes are greyed. Every node is
/// tappable with haptic + scale feedback, and labels sit clearly below.
class LearningPathMap extends StatefulWidget {
  final List<PathNode> nodes;
  final double rowHeight;
  final bool mini;

  const LearningPathMap({
    super.key,
    required this.nodes,
    this.rowHeight = 132,
    this.mini = false,
  });

  @override
  State<LearningPathMap> createState() => _LearningPathMapState();
}

class _LearningPathMapState extends State<LearningPathMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.nodes.length;
    final height = count * widget.rowHeight + 20;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // Gentle S-curve of node centres down the card.
        final positions = <Offset>[
          for (int i = 0; i < count; i++)
            Offset(
              width / 2 + math.sin(i * 0.8 + 0.4) * (width * 0.26),
              widget.rowHeight * 0.55 + i * widget.rowHeight,
            ),
        ];

        return SizedBox(
          height: height,
          width: width,
          child: AnimatedBuilder(
            animation: _anim,
            builder: (context, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // flowing trail behind the nodes
                  CustomPaint(
                    size: Size(width, height),
                    painter: _TrailPainter(
                      positions: positions,
                      nodes: widget.nodes,
                      t: _anim.value,
                      isDark: AppPalette.of(context).isDark,
                    ),
                  ),
                  for (int i = 0; i < count; i++)
                    Positioned(
                      left: positions[i].dx - 60,
                      top: positions[i].dy - 42,
                      width: 120,
                      child: _PathBubble(
                        node: widget.nodes[i],
                        index: i,
                        pulse: _anim.value,
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _PathBubble extends StatefulWidget {
  final PathNode node;
  final int index;
  final double pulse;

  const _PathBubble({
    required this.node,
    required this.index,
    required this.pulse,
  });

  @override
  State<_PathBubble> createState() => _PathBubbleState();
}

class _PathBubbleState extends State<_PathBubble> {
  double _pressScale = 1;

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    final node = widget.node;
    final completed = node.state == PathState.completed;
    final current = node.state == PathState.current;
    final locked = node.state == PathState.locked;

    Color ring;
    if (completed) {
      ring = AppColors.success;
    } else if (current) {
      ring = AppColors.gold;
    } else {
      ring = palette.textSecondary.withValues(alpha: 0.35);
    }

    // Gentle idle bob on the current node.
    final bob = current
        ? math.sin(widget.pulse * 2 * math.pi) * 4
        : 0.0;
    final pulseGlow = current ? (0.5 + 0.5 * math.sin(widget.pulse * 2 * math.pi)) : 0.0;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 420 + widget.index * 90),
      curve: Curves.elasticOut,
      builder: (context, entrance, child) {
        return Transform.translate(
          offset: Offset(0, bob),
          child: Transform.scale(
            scale: (0.6 + 0.4 * entrance.clamp(0, 1)) * _pressScale,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTapDown: locked ? null : (_) => setState(() => _pressScale = 0.9),
        onTapUp: locked ? null : (_) => setState(() => _pressScale = 1),
        onTapCancel: () => setState(() => _pressScale = 1),
        onTap: locked
            ? () => HapticFeedback.lightImpact()
            : () {
                HapticFeedback.mediumImpact();
                node.onTap?.call();
              },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 76,
              height: 76,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // pulsing glow ring for the current node
                  if (current)
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gold
                                .withValues(alpha: 0.25 + 0.35 * pulseGlow),
                            blurRadius: 16 + 12 * pulseGlow,
                            spreadRadius: 2 + 3 * pulseGlow,
                          ),
                        ],
                      ),
                    ),
                  // progress ring
                  CustomPaint(
                    size: const Size(72, 72),
                    painter: _NodeRingPainter(
                      progress: completed ? 1 : node.progress,
                      color: ring,
                      track: palette.textSecondary.withValues(alpha: 0.15),
                    ),
                  ),
                  // node body
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: completed
                          ? AppGradients.progress
                          : current
                              ? AppGradients.gold
                              : null,
                      color: locked
                          ? (palette.isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : Colors.white.withValues(alpha: 0.6))
                          : null,
                      boxShadow: [
                        if (completed || current)
                          BoxShadow(
                            color: ring.withValues(alpha: 0.35),
                            blurRadius: 12,
                          ),
                      ],
                    ),
                    child: Icon(
                      locked ? Icons.lock_rounded : node.icon,
                      color: locked ? palette.textSecondary : Colors.white,
                      size: 26,
                    ),
                  ),
                  // completed check badge
                  if (completed)
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.success.withValues(alpha: 0.4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.check_circle_rounded,
                            color: AppColors.success, size: 18),
                      ),
                    ),
                  // "current" play chip
                  if (current)
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow_rounded,
                            color: AppColors.gold, size: 16),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              node.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppText.label(
                context,
                size: 11,
                weight: current ? FontWeight.w800 : FontWeight.w600,
                color: locked ? palette.textSecondary : palette.textPrimary,
              ),
            ),
            if (!locked && !completed)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  '${(node.progress * 100).round()}%',
                  style: AppText.label(context,
                      size: 10, color: AppColors.gold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Draws the progress arc ring around a node.
class _NodeRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color track;
  _NodeRingPainter(
      {required this.progress, required this.color, required this.track});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = track,
    );
    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * progress.clamp(0, 1),
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..color = color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _NodeRingPainter old) =>
      old.progress != progress || old.color != color;
}

/// Draws the flowing dashed trail connecting the nodes, with a moving shimmer.
class _TrailPainter extends CustomPainter {
  final List<Offset> positions;
  final List<PathNode> nodes;
  final double t;
  final bool isDark;

  _TrailPainter({
    required this.positions,
    required this.nodes,
    required this.t,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < positions.length - 1; i++) {
      final a = positions[i];
      final b = positions[i + 1];
      final reached = nodes[i + 1].state != PathState.locked;

      final path = Path()..moveTo(a.dx, a.dy + 30);
      final midY = (a.dy + b.dy) / 2;
      path.cubicTo(a.dx, midY, b.dx, midY, b.dx, b.dy - 30);

      // base dashed trail
      _drawDashed(
        canvas,
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round
          ..color = reached
              ? AppColors.success.withValues(alpha: 0.35)
              : (isDark ? Colors.white : AppColors.primaryDark)
                  .withValues(alpha: 0.10),
        dash: 3,
        gap: 14,
        phase: 0,
      );

      // moving shimmer dashes on reached segments
      if (reached) {
        _drawDashed(
          canvas,
          path,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..strokeCap = StrokeCap.round
            ..color = AppColors.gold.withValues(alpha: 0.9),
          dash: 3,
          gap: 60,
          phase: -t * 63,
        );
      }
    }
  }

  void _drawDashed(Canvas canvas, Path source, Paint paint,
      {required double dash, required double gap, required double phase}) {
    for (final metric in source.computeMetrics()) {
      double distance = phase % (dash + gap);
      if (distance < 0) distance += (dash + gap);
      // start slightly before 0 so the pattern is continuous
      distance -= (dash + gap);
      while (distance < metric.length) {
        final start = distance.clamp(0, metric.length).toDouble();
        final end = (distance + dash).clamp(0, metric.length).toDouble();
        if (end > start) {
          canvas.drawPath(metric.extractPath(start, end), paint);
        }
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TrailPainter old) => old.t != t;
}
