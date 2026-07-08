import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../buttons/app_buttons.dart';
import 'celebration_overlay.dart';

/// A full-screen milestone celebration: a badge drops in with a bounce over an
/// expanding ripple, confetti bursts, and a share action is offered.
class MilestoneScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData badgeIcon;
  final Color color;
  final String shareText;

  const MilestoneScreen({
    super.key,
    required this.title,
    required this.subtitle,
    this.badgeIcon = Icons.workspace_premium_rounded,
    this.color = AppColors.gold,
    required this.shareText,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String subtitle,
    IconData badgeIcon = Icons.workspace_premium_rounded,
    Color color = AppColors.gold,
    required String shareText,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black54,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, anim, secondaryAnim) => MilestoneScreen(
          title: title,
          subtitle: subtitle,
          badgeIcon: badgeIcon,
          color: color,
          shareText: shareText,
        ),
        transitionsBuilder: (context, anim, secondaryAnim, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  State<MilestoneScreen> createState() => _MilestoneScreenState();
}

class _MilestoneScreenState extends State<MilestoneScreen>
    with TickerProviderStateMixin {
  late final AnimationController _drop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  );
  late final AnimationController _ripple = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..repeat();

  @override
  void initState() {
    super.initState();
    _drop.forward();
    HapticFeedback.heavyImpact();
  }

  @override
  void dispose() {
    _drop.dispose();
    _ripple.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark.withValues(alpha: 0.96),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF124A34), AppColors.darkBackground],
              ),
            ),
          ),
          const ConfettiBurst(count: 120),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 220,
                  width: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // ripple rings
                      AnimatedBuilder(
                        animation: _ripple,
                        builder: (context, _) => CustomPaint(
                          size: const Size(220, 220),
                          painter: _RipplePainter(_ripple.value, widget.color),
                        ),
                      ),
                      // dropping badge
                      AnimatedBuilder(
                        animation: _drop,
                        builder: (context, child) {
                          final drop = Curves.bounceOut.transform(
                              _drop.value.clamp(0.0, 1.0));
                          return Transform.translate(
                            offset: Offset(0, -120 * (1 - drop)),
                            child: Transform.scale(
                              scale: 0.6 + 0.4 * drop,
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              widget.color,
                              widget.color.withValues(alpha: 0.7),
                            ]),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: widget.color.withValues(alpha: 0.6),
                                blurRadius: 40,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Icon(widget.badgeIcon,
                              color: Colors.white, size: 60),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                FadeTransition(
                  opacity: _drop,
                  child: Column(
                    children: [
                      Text(widget.title,
                          textAlign: TextAlign.center,
                          style: AppText.display(context,
                              size: 30, color: Colors.white)),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(widget.subtitle,
                            textAlign: TextAlign.center,
                            style: AppText.body(context,
                                size: 15, color: Colors.white70)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      PrimaryButton(
                        label: 'Share Achievement',
                        icon: Icons.ios_share_rounded,
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.shareText));
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Achievement copied — share it!'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Continue',
                            style: AppText.label(context,
                                size: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final double t;
  final Color color;
  _RipplePainter(this.t, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < 3; i++) {
      final progress = (t + i / 3) % 1.0;
      final radius = 60 + progress * 60;
      final opacity = (1 - progress) * 0.5;
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = color.withValues(alpha: opacity),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RipplePainter old) => old.t != t;
}
