import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import '../../services/user_service.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../../widgets/illustrations/infinity_curve.dart';
import '../auth/welcome_screen.dart';

class OnboardingPageData {
  final String title;
  final String body;
  final Widget illustration;
  const OnboardingPageData(this.title, this.body, this.illustration);
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  late final List<OnboardingPageData> _pages = const [
    OnboardingPageData(
      'Master the Telecom Industry',
      "Learn how Nigeria's N9 trillion telecom sector works from the ground up "
          'with structured, practical courses designed for entrepreneurs.',
      _SignalTowerIllustration(),
    ),
    OnboardingPageData(
      'Watch Your Knowledge Grow',
      'Earn XP for every lesson, hit milestones, unlock badges and build a '
          'streak that keeps you consistent and motivated every day.',
      _InfinityIllustration(),
    ),
    OnboardingPageData(
      'Tools That Work for You',
      'Use our profit calculators, business checklists, pricing tools and goal '
          'trackers to plan and manage your telecom business better.',
      _ToolsIllustration(),
    ),
    OnboardingPageData(
      'You Are Not Alone',
      'Join a community of telecom entrepreneurs. Learn from experienced '
          'operators, ask questions, share your progress and grow together.',
      _NetworkIllustration(),
    ),
  ];

  void _finish() async {
    await UserService.instance.completeOnboarding();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  void _next() {
    if (_page == _pages.length - 1) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return GradientScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12, top: 8),
                child: TextButton(
                  onPressed: _finish,
                  child: Text('Skip',
                      style: AppText.label(context,
                          size: 14, color: palette.textSecondary)),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) {
                  HapticFeedback.selectionClick();
                  setState(() => _page = i);
                },
                itemCount: _pages.length,
                itemBuilder: (context, i) {
                  final p = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 240, child: p.illustration),
                        const SizedBox(height: 48),
                        Text(p.title,
                            textAlign: TextAlign.center,
                            style: AppText.display(context, size: 28)),
                        const SizedBox(height: 16),
                        Text(p.body,
                            textAlign: TextAlign.center,
                            style: AppText.body(context, size: 15)),
                      ],
                    ),
                  );
                },
              ),
            ),
            // dot indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _pages.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _page ? 26 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      gradient: i == _page ? AppGradients.progress : null,
                      color: i == _page
                          ? null
                          : palette.textSecondary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (_page > 0)
                    Expanded(
                      child: SecondaryButton(
                        label: 'Back',
                        onPressed: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutCubic,
                        ),
                      ),
                    ),
                  if (_page > 0) const SizedBox(width: 14),
                  Expanded(
                    flex: _page > 0 ? 1 : 1,
                    child: PrimaryButton(
                      label: _page == _pages.length - 1 ? 'Get Started' : 'Next',
                      icon: _page == _pages.length - 1
                          ? Icons.rocket_launch_rounded
                          : Icons.arrow_forward_rounded,
                      onPressed: _next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Onboarding illustrations (CustomPainter) ----

class _InfinityIllustration extends StatelessWidget {
  const _InfinityIllustration();
  @override
  Widget build(BuildContext context) =>
      const Center(child: InfinityCurve(progress: 0.62, height: 180));
}

class _SignalTowerIllustration extends StatefulWidget {
  const _SignalTowerIllustration();
  @override
  State<_SignalTowerIllustration> createState() => _SignalTowerState();
}

class _SignalTowerState extends State<_SignalTowerIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(
          size: const Size(240, 240),
          painter: _TowerPainter(_c.value),
        ),
      );
}

class _TowerPainter extends CustomPainter {
  final double t;
  _TowerPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final topY = size.height * 0.32;
    // pulse rings
    for (int i = 0; i < 3; i++) {
      final p = (t + i / 3) % 1.0;
      canvas.drawCircle(
        Offset(cx, topY),
        20 + p * 90,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = AppColors.accentEmerald.withValues(alpha: (1 - p) * 0.6),
      );
    }
    final paint = Paint()
      ..color = AppColors.primaryDark
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    // tower legs
    final baseY = size.height * 0.82;
    canvas.drawLine(Offset(cx - 34, baseY), Offset(cx - 6, topY + 10), paint);
    canvas.drawLine(Offset(cx + 34, baseY), Offset(cx + 6, topY + 10), paint);
    // cross braces
    for (double f = 0.2; f < 1; f += 0.22) {
      final ly = topY + 10 + (baseY - topY - 10) * f;
      final lx = 6 + (34 - 6) * f;
      canvas.drawLine(Offset(cx - lx, ly), Offset(cx + lx, ly), paint);
    }
    // top node
    canvas.drawCircle(Offset(cx, topY), 8, Paint()..color = AppColors.gold);
  }

  @override
  bool shouldRepaint(covariant _TowerPainter old) => old.t != t;
}

class _ToolsIllustration extends StatefulWidget {
  const _ToolsIllustration();
  @override
  State<_ToolsIllustration> createState() => _ToolsState();
}

class _ToolsState extends State<_ToolsIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(
          size: const Size(240, 240),
          painter: _ChartsPainter(_c.value),
        ),
      );
}

class _ChartsPainter extends CustomPainter {
  final double t;
  _ChartsPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final baseY = size.height * 0.78;
    final bars = [0.4, 0.7, 0.55, 0.9];
    final bw = 34.0;
    final gap = 16.0;
    final totalW = bars.length * bw + (bars.length - 1) * gap;
    var x = (size.width - totalW) / 2;
    for (final b in bars) {
      final h = size.height * 0.5 * b * t;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, baseY - h, bw, h),
        const Radius.circular(8),
      );
      canvas.drawRRect(
        rect,
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppColors.accentEmerald, AppColors.success],
          ).createShader(rect.outerRect),
      );
      x += bw + gap;
    }
    // rising trend line
    final path = Path();
    for (int i = 0; i <= 20; i++) {
      final px = size.width * 0.15 + (size.width * 0.7) * i / 20;
      final py = baseY - size.height * 0.42 * (i / 20) * t -
          math.sin(i / 3) * 6 * t;
      if (i == 0) {
        path.moveTo(px, py);
      } else {
        path.lineTo(px, py);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round
        ..color = AppColors.gold,
    );
  }

  @override
  bool shouldRepaint(covariant _ChartsPainter old) => old.t != t;
}

class _NetworkIllustration extends StatefulWidget {
  const _NetworkIllustration();
  @override
  State<_NetworkIllustration> createState() => _NetworkState();
}

class _NetworkState extends State<_NetworkIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _c,
        builder: (context, _) => CustomPaint(
          size: const Size(240, 240),
          painter: _NetworkPainter(_c.value),
        ),
      );
}

class _NetworkPainter extends CustomPainter {
  final double t;
  _NetworkPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final nodes = <Offset>[center];
    const count = 6;
    for (int i = 0; i < count; i++) {
      final a = (i / count) * 2 * math.pi + t * 2 * math.pi * 0.1;
      nodes.add(Offset(
        center.dx + math.cos(a) * 80,
        center.dy + math.sin(a) * 80,
      ));
    }
    // links
    for (int i = 1; i < nodes.length; i++) {
      canvas.drawLine(
        center,
        nodes[i],
        Paint()
          ..strokeWidth = 2
          ..color = AppColors.accentEmerald.withValues(alpha: 0.4),
      );
    }
    // nodes
    for (int i = 0; i < nodes.length; i++) {
      final isCenter = i == 0;
      canvas.drawCircle(
        nodes[i],
        isCenter ? 22 : 15,
        Paint()
          ..shader = RadialGradient(
            colors: isCenter
                ? const [AppColors.gold, Color(0xFFB8860B)]
                : const [AppColors.accentEmerald, AppColors.primaryDark],
          ).createShader(
              Rect.fromCircle(center: nodes[i], radius: isCenter ? 22 : 15)),
      );
      canvas.drawCircle(
        nodes[i].translate(-4, -4),
        isCenter ? 6 : 4,
        Paint()..color = Colors.white.withValues(alpha: 0.5),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _NetworkPainter old) => old.t != t;
}
