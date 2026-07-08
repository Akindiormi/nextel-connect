import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'app_cards.dart';

/// A friendly empty-state block with an icon, title and message.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassCard(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.accentEmerald.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 34, color: AppColors.accentEmerald),
            ),
            const SizedBox(height: 18),
            Text(title,
                style: AppText.heading(context, size: 18),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(message,
                style: AppText.body(context, size: 14),
                textAlign: TextAlign.center),
            if (action != null) ...[
              const SizedBox(height: 20),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
