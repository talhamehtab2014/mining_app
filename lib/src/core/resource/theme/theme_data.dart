part of '../r.dart';

ThemeData _createThemeData(Palette palette) {
  final colorScheme = const ColorScheme.light().copyWith(
    onSurface: palette.background,
  );
  return ThemeData(
    colorScheme: colorScheme.copyWith(
      primary: palette.primary,
      surface: palette.background,
    ),
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.divider,
    unselectedWidgetColor: palette.buttonDisabled,
    buttonTheme: ButtonThemeData(
      buttonColor: palette.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
      displayMedium: const TextStyle(fontSize: 60, fontWeight: FontWeight.w300),
      displaySmall: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
      titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: palette.greyTextColor,
      ),
    ),
    dialogTheme: DialogThemeData(backgroundColor: palette.background),
  );
}
