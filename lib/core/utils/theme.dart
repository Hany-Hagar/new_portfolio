import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ───────── ألوان الهوية ─────────
  static const Color accent = Color(0xFF5EEAD4);
  static const Color accentDeep = Color(0xFF0F766E);
  static const Color accent2 = Color(0xFF2DD4BF);
  static const Color accent2Deep = Color(0xFF0D9488);
  static const Color onAccent = Color(0xFF0B0F14);
  static const Color inactiveGrey = Color(0xFFA3ADBA);

  // ───────── Light ─────────
  static const Color lightBackground = Color(0xFFF6F8FA);
  static const Color lightSurface = Colors.white;
  static const Color lightBorder = Color(0xFFD8DEE6);
  static const Color lightText = Color(0xFF0F1318);
  static const Color lightHint = Color(0xFF5B6673);

  // ───────── Dark ─────────
  static const Color darkBackground = Color(0xFF0F1318);
  static const Color darkSurface = Color(0xFF171C23);
  static const Color darkBorder = Color(0xFF2A323D);
  static const Color darkText = Color(0xFFE8ECF1);

  static const Color error = Color(0xFFEF4444);

  // ───────── Radius ─────────
  static const double radiusM = 12;
  static const double radiusL = 16;

  static final List<BoxShadow> accentGlow = [
    BoxShadow(
      color: accent.withValues(alpha: 0.30),
      blurRadius: 40,
      spreadRadius: -18,
      offset: const Offset(0, 18),
    ),
  ];

  static const String fontFamily = 'SpaceGrotesk';

  static ThemeData dark = _build(isDark: true);
  static ThemeData light = _build(isDark: false);

  static ThemeData _build({required bool isDark}) {
    final text = isDark ? darkText : lightText;
    final primary = isDark ? accent : accentDeep;
    final hint = isDark ? inactiveGrey : lightHint;
    final border = isDark ? darkBorder : lightBorder;
    final onPrimary = isDark ? onAccent : Colors.white;
    final surface = isDark ? darkSurface : lightSurface;
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final background = isDark ? darkBackground : lightBackground;

    final scheme =
        ColorScheme.fromSeed(
          seedColor: accentDeep,
          brightness: brightness,
        ).copyWith(
          error: error,
          onSurface: text,
          outline: border,
          primary: primary,
          surface: surface,
          onPrimary: onPrimary,
          onSurfaceVariant: hint,
          outlineVariant: border,
          onError: Colors.white,
          secondary: isDark ? accent2 : accent2Deep,
          onSecondary: isDark ? onAccent : Colors.white,
        );

    final radius = BorderRadius.circular(radiusM);
    final cardRadius = BorderRadius.circular(radiusL);

    final base = ThemeData(
      brightness: brightness,
      fontFamily: fontFamily,
      useMaterial3: true,
    );

    return ThemeData(
      hintColor: hint,
      cardColor: surface,
      useMaterial3: true,
      colorScheme: scheme,
      dividerColor: border,
      primaryColor: primary,
      fontFamily: fontFamily,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      iconTheme: IconThemeData(color: text),
      splashFactory: InkRipple.splashFactory,
      textTheme: base.textTheme.apply(bodyColor: text, displayColor: text),

      // ───── الأزرار ─────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: radius),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          minimumSize: const Size(0, 48),
          side: BorderSide(color: border),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: radius),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),

      // ───── Card / Divider / Chip ─────
      cardTheme: CardThemeData(
        elevation: 0,
        color: surface,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: cardRadius,
          side: BorderSide(color: border),
        ),
      ),
      dividerTheme: DividerThemeData(color: border, thickness: 1, space: 1),
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        side: BorderSide(color: border),
        shape: const StadiumBorder(),
        labelStyle: TextStyle(color: text, fontSize: 14),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      ),

      // ───── Scrollbar ─────
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll(true),
        trackVisibility: const WidgetStatePropertyAll(true),
        thickness: const WidgetStatePropertyAll(10),
        radius: const Radius.circular(8),
        crossAxisMargin: 2,
        thumbColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.hovered) || s.contains(WidgetState.dragged)
              ? hint
              : hint.withValues(alpha: 0.6),
        ),
        trackColor: WidgetStatePropertyAll(
          isDark
              ? Colors.white.withValues(alpha: 0.04)
              : border.withValues(alpha: 0.4),
        ),
        trackBorderColor: WidgetStatePropertyAll(border),
      ),
    );
  }
}
