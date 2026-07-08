import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A branded circular loading indicator.
class AppLoader extends StatelessWidget {
  final double size;
  const AppLoader({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(AppColors.accentEmerald),
        ),
      ),
    );
  }
}

/// A shimmering skeleton placeholder block.
class SkeletonBox extends StatefulWidget {
  final double height;
  final double? width;
  final double radius;
  const SkeletonBox({
    super.key,
    required this.height,
    this.width,
    this.radius = 16,
  });

  @override
  State<SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<SkeletonBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: (palette.isDark ? Colors.white : AppColors.primaryDark)
                .withValues(alpha: 0.04 + 0.05 * _c.value),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        );
      },
    );
  }
}
