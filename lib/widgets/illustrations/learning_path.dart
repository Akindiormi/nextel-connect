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

/// A vertical winding journey map of course nodes. Completed nodes glow green,
/// the current node pulses, locked nodes are greyed out.
class LearningPathMap extends StatefulWidget {
  final List<PathNode> nodes;
  final double rowHeight;
  final bool mini;

  const LearningPathMap({
    super.key,
    required this.nodes,
    this.rowHeight = 108,
    this.mini = false,
  });

  @override
  State<LearningPathMap> createState() => _LearningPathMapState();
}

class _LearningPathMapState extends State<LearningPathMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.nodes.length;
    final height = count * widget.rowHeight;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final positions = <Offset>[];
        for (int i = 0; i < count; i++) {
          final t = i / math.max(1, count - 1);
          // gentle sine zigzag across the width
          final x = width / 2 + math.sin(i * 0.9) * (width * 0.30);
          final y = widget.rowHeight / 2 + i * widget.rowHeight;
          positions.add(Offset(x, y));
          t; // (kept for clarity)
        }

        return SizedBox(
          height: height,
          width: width,
          child: AnimatedBuilder(
            animation: _pulse,
            builder: (context, _) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(width, height),
                    painter: _PathPainter(
                      positions: positions,
                      nodes: widget.nodes,
                      isDark: AppPalette.of(context).isDark,
                    ),
                  ),
                  for (int i = 0; i < count; i++)
                    Positioned(
                      left: positions[i].dx - 34,
                      top: positions[i].dy - 34,
                      child: _NodeBubble(
                        node: widget.nodes[i],
                        pulse: _pulse.value,
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

class _NodeBubble extends StatelessWidget {
  final PathNode node;
  final double pulse;

  const _NodeBubble({required this.node, required this.pulse});

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    final completed = node.state == PathState.completed;
    final current = node.state == PathState.current;
    final locked = node.state == PathState.locked;

    Color ringColor;
    if (completed) {
      ringColor = AppColors.success;
    } else if (current) {
      ringColor = AppColors.gold;
    } else {
      ringColor = palette.textSecondary.withValues(alpha: 0.4);
    }

    return GestureDetector(
      onTap: locked
          ? null
          : () {
              HapticFeedback.selectionClick();
              node.onTap?.call();
            },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 68,
            height: 68,
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
                      : Colors.white.withValues(alpha: 0.5))
                  : null,
              border: Border.all(color: ringColor, width: 2),
              boxShadow: [
                if (completed || current)
                  BoxShadow(
                    color: ringColor.withValues(
                        alpha: current ? 0.3 + 0.4 * pulse : 0.35),
                    blurRadius: current ? 12 + 12 * pulse : 14,
                    spreadRadius: current ? 1 + 2 * pulse : 1,
                  ),
              ],
            ),
            child: Icon(
              locked ? Icons.lock_rounded : node.icon,
              color: locked ? palette.textSecondary : Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 96,
            child: Text(
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
          ),
        ],
      ),
    );
  }
}

class _PathPainter extends CustomPainter {
  final List<Offset> positions;
  final List<PathNode> nodes;
  final bool isDark;

  _PathPainter({
    required this.positions,
    required this.nodes,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < positions.length - 1; i++) {
      final a = positions[i];
      final b = positions[i + 1];
      final mid = Offset((a.dx + b.dx) / 2, (a.dy + b.dy) / 2);
      final path = Path()
        ..moveTo(a.dx, a.dy)
        ..quadraticBezierTo(a.dx, mid.dy, mid.dx, mid.dy)
        ..quadraticBezierTo(b.dx, mid.dy, b.dx, b.dy);

      final reached = nodes[i + 1].state != PathState.locked;
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round;
      if (reached) {
        paint.shader = const LinearGradient(
          colors: [AppColors.success, AppColors.accentEmerald],
        ).createShader(Rect.fromPoints(a, b));
      } else {
        paint.color = (isDark ? Colors.white : AppColors.primaryDark)
            .withValues(alpha: 0.10);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PathPainter old) => true;
}
