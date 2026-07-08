import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// Glass-style text input with a focus glow and optional show/hide toggle.
class GlassTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool obscure;
  final bool toggleObscure;
  final TextInputType keyboardType;
  final IconData? icon;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const GlassTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.obscure = false,
    this.toggleObscure = false,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
  });

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  late bool _obscured = widget.obscure;
  final _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() => _focused = _focus.hasFocus));
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = AppPalette.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppText.label(context, size: 13)),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.input),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: AppColors.accentEmerald.withValues(alpha: 0.2),
                      blurRadius: 12,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.input),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focus,
                obscureText: _obscured,
                keyboardType: widget.keyboardType,
                maxLines: widget.obscure ? 1 : widget.maxLines,
                onChanged: widget.onChanged,
                validator: widget.validator,
                style: AppText.body(context,
                    size: 15, color: palette.textPrimary),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: AppText.body(context,
                      size: 15,
                      color: palette.textSecondary.withValues(alpha: 0.7)),
                  filled: true,
                  fillColor: palette.inputFill,
                  prefixIcon: widget.icon != null
                      ? Icon(widget.icon,
                          color: _focused
                              ? AppColors.accentEmerald
                              : palette.textSecondary,
                          size: 20)
                      : null,
                  suffixIcon: widget.toggleObscure
                      ? IconButton(
                          icon: Icon(
                            _obscured
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: palette.textSecondary,
                            size: 20,
                          ),
                          onPressed: () =>
                              setState(() => _obscured = !_obscured),
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.input),
                    borderSide: BorderSide(color: palette.inputBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.input),
                    borderSide: BorderSide(color: palette.inputBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.input),
                    borderSide: const BorderSide(
                        color: AppColors.accentEmerald, width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.input),
                    borderSide:
                        const BorderSide(color: Color(0xFFEF4444), width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.input),
                    borderSide:
                        const BorderSide(color: Color(0xFFEF4444), width: 1.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
