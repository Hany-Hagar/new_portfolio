import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  // ───────── حالات ─────────
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);

  // ───────── Aliases قديمة (عشان أي كود قديم يفضل شغال) ─────────
  static const Color primaryBlue = accentDeep;
  static const Color secondaryBlue = accent2Deep;
  static const Color darkPrimary = accent;

  // ───────── Radius ─────────
  static const double radiusM = 12; // أزرار وحقول
  static const double radiusL = 16; // كروت

  /// ظل التيل الخفيف اللي بيظهر حوالين الكروت المهمة (زي الـ hero في الموقع)
  static final List<BoxShadow> accentGlow = [
    BoxShadow(
      color: accent.withValues(alpha: 0.30),
      blurRadius: 40,
      spreadRadius: -18,
      offset: const Offset(0, 18),
    ),
  ];

  static const String fontFamily = "SpaceGrotesk";

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

    OutlineInputBorder inputBorder(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: color, width: width),
        );

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

      // ───── AppBar ─────
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        foregroundColor: text,
        scrolledUnderElevation: 0,
        backgroundColor: background,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: text,
          fontSize: 20,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
      ),

      // ───── FAB ─────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: primary,
        foregroundColor: onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // ───── الأزرار ─────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: radius),
          disabledBackgroundColor: primary.withValues(alpha: 0.4),
          disabledForegroundColor: onPrimary.withValues(alpha: 0.6),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, 48),
          shape: RoundedRectangleBorder(borderRadius: radius),
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),

      // ───── حقول الإدخال ─────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: inputBorder(border),
        hintStyle: TextStyle(color: hint),
        errorBorder: inputBorder(error),
        labelStyle: TextStyle(color: hint),
        enabledBorder: inputBorder(border),
        focusedBorder: inputBorder(primary, 1.5),
        focusedErrorBorder: inputBorder(error, 1.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),

      // ───── Cards / Dialogs / SnackBar ─────
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
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: cardRadius,
          side: BorderSide(color: border),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radiusL)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? surface : lightText,
        contentTextStyle: TextStyle(color: isDark ? darkText : Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: isDark ? BorderSide(color: border) : BorderSide.none,
        ),
      ),
      dividerTheme: DividerThemeData(color: border, thickness: 1, space: 1),

      // ───── Chips (pill زي الموقع) ─────
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        selectedColor: primary.withValues(alpha: 0.16),
        side: BorderSide(color: border),
        shape: const StadiumBorder(),
        labelStyle: TextStyle(color: text, fontSize: 14),
        checkmarkColor: primary,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      ),

      // ───── عناصر تانية ─────
      listTileTheme: ListTileThemeData(iconColor: hint, textColor: text),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: primary),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? onPrimary : inactiveGrey,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? primary : border,
        ),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: hint, width: 1.5),
        checkColor: WidgetStateProperty.all(onPrimary),
        fillColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? primary : Colors.transparent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: primary,
        indicatorColor: primary,
        unselectedLabelColor: hint,
        dividerColor: Colors.transparent,
      ),

      // ───── Scrollbar (ظاهر طول الوقت) ─────
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll(true),
        trackVisibility: const WidgetStatePropertyAll(true),
        thickness: const WidgetStatePropertyAll(10),
        radius: const Radius.circular(8),
        crossAxisMargin: 2,
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.hovered) ||
                  s.contains(WidgetState.dragged)
              ? hint
              : hint.withValues(alpha: 0.6),
        ),
        trackColor: WidgetStatePropertyAll(
          isDark ? Colors.white.withValues(alpha: 0.04) : border.withValues(alpha: 0.4),
        ),
        trackBorderColor: WidgetStatePropertyAll(border),
      ),

      // ───── Bottom Navigation ─────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: surface,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        selectedItemColor: primary,
        unselectedItemColor: hint,
        unselectedLabelStyle: base.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: hint,
        ),
      ),
    );
  }
}