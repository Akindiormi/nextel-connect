import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central design system for Nextel.
///
/// Clash Display and Satoshi are not available through Google Fonts, so we use
/// Plus Jakarta Sans (the declared fallback) which is served by Google Fonts and
/// carries the same premium, editorial character. Headings use a tight tracking
/// treatment; body copy uses a comfortable line height.
class AppColors {
  AppColors._();

  // Brand
  static const Color background = Color(0xFFF0F4F0);
  static const Color primaryDark = Color(0xFF0D3D2B);
  static const Color secondaryGreen = Color(0xFF1A5C3A);
  static const Color accentEmerald = Color(0xFF2E8B57);
  static const Color gold = Color(0xFFD4A017);
  static const Color textPrimary = Color(0xFF0D3D2B);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color success = Color(0xFF22C55E);

  // Glass (light)
  static const Color cardSurface = Color(0xA6FFFFFF); // white @ 65%
  static const Color cardSurfaceStrong = Color(0xBFFFFFFF); // white @ 75%
  static const Color glassBorder = Color(0xCCFFFFFF); // white @ 80%
  static const Color inputFill = Color(0x99FFFFFF); // white @ 60%
  static const Color inputBorder = Color(0x260D3D2B); // green @ 15%

  // Dark mode
  static const Color darkBackground = Color(0xFF0A1A0F);
  static const Color darkCard = Color(0x0FFFFFFF); // white @ 6%
  static const Color darkBorder = Color(0x1AFFFFFF); // white @ 10%
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0x99FFFFFF); // white @ 60%

  // Shadows
  static const Color shadow = Color(0x140D3D2B); // green @ 8%
  static const Color buttonShadow = Color(0x4D0D3D2B); // green @ 30%
}

/// Resolves palette values against the active brightness so widgets can theme
/// themselves without branching everywhere.
class AppPalette {
  final bool isDark;
  const AppPalette(this.isDark);

  Color get background =>
      isDark ? AppColors.darkBackground : AppColors.background;
  Color get card => isDark ? AppColors.darkCard : AppColors.cardSurface;
  Color get cardStrong =>
      isDark ? const Color(0x1FFFFFFF) : AppColors.cardSurfaceStrong;
  Color get border => isDark ? AppColors.darkBorder : AppColors.glassBorder;
  Color get inputFill => isDark ? const Color(0x14FFFFFF) : AppColors.inputFill;
  Color get inputBorder =>
      isDark ? const Color(0x1FFFFFFF) : AppColors.inputBorder;
  Color get textPrimary =>
      isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
  Color get textSecondary =>
      isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
  Color get topHighlight =>
      isDark ? const Color(0x1FFFFFFF) : const Color(0xE6FFFFFF);

  static AppPalette of(BuildContext context) =>
      AppPalette(Theme.of(context).brightness == Brightness.dark);
}

class AppGradients {
  AppGradients._();

  static const LinearGradient primaryButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.accentEmerald, AppColors.primaryDark],
  );

  static const LinearGradient greenHeader = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.secondaryGreen, AppColors.primaryDark],
  );

  static const LinearGradient progress = LinearGradient(
    colors: [AppColors.success, AppColors.accentEmerald],
  );

  static const LinearGradient gold = LinearGradient(
    colors: [Color(0xFFE9C55A), AppColors.gold],
  );

  static LinearGradient screen(bool isDark) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? const [Color(0xFF0C2015), AppColors.darkBackground]
            : const [Color(0xFFF4F8F3), AppColors.background],
      );
}

class AppRadius {
  AppRadius._();
  static const double card = 24;
  static const double button = 16;
  static const double input = 14;
  static const double pill = 100;
  static const double small = 12;
}

/// Typography helpers. `display`/`heading` map to the editorial Clash-Display
/// role; `body`/`label`/`number` map to the Satoshi UI role.
class AppText {
  AppText._();

  static TextStyle display(BuildContext c,
      {double size = 32, FontWeight weight = FontWeight.w700, Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: size >= 28 ? -1.0 : -0.5,
      height: 1.1,
      color: color ?? AppPalette.of(c).textPrimary,
    );
  }

  static TextStyle heading(BuildContext c,
      {double size = 20, FontWeight weight = FontWeight.w700, Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: -0.5,
      height: 1.2,
      color: color ?? AppPalette.of(c).textPrimary,
    );
  }

  static TextStyle body(BuildContext c,
      {double size = 15, FontWeight weight = FontWeight.w400, Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      height: 1.6,
      color: color ?? AppPalette.of(c).textSecondary,
    );
  }

  static TextStyle label(BuildContext c,
      {double size = 12, FontWeight weight = FontWeight.w600, Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: 0.3,
      height: 1.3,
      color: color ?? AppPalette.of(c).textSecondary,
    );
  }

  static TextStyle number(BuildContext c,
      {double size = 24, FontWeight weight = FontWeight.w800, Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: -0.5,
      fontFeatures: const [FontFeature.tabularFigures()],
      color: color ?? AppPalette.of(c).textPrimary,
    );
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData light() => _base(Brightness.light);
  static ThemeData dark() => _base(Brightness.dark);

  static ThemeData _base(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final palette = AppPalette(isDark);
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: AppColors.accentEmerald,
      brightness: brightness,
    ).copyWith(
      primary: AppColors.accentEmerald,
      surface: palette.background,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.background,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ).apply(
        bodyColor: palette.textPrimary,
        displayColor: palette.textPrimary,
      ),
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: palette.textPrimary,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
    );
  }
}
