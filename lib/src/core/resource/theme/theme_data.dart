part of '../r.dart';

ThemeData _createDarkThemeData(Palette palette) {
  final colorScheme = const ColorScheme.light().copyWith(
    onSurface: palette.background,
  );
  return ThemeData(
    colorScheme: colorScheme.copyWith(
      primary: palette.primary,
      surface: palette.yellow800,
      onSurface: palette.yellow900,
      tertiary: palette.labelColor,
      secondary: palette.cardBackground,
      onSecondary: palette.cardBackground,
    ),
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.divider,
    dialogTheme: DialogThemeData(backgroundColor: palette.background),
  );
}

ThemeData _createLightThemeData(Palette palette) {
  final colorScheme = const ColorScheme.light().copyWith(
    onSurface: palette.background,
  );
  return ThemeData(
    colorScheme: colorScheme.copyWith(
      primary: palette.primary,
      surface: palette.white,
      onSurface: palette.white,
      tertiary: palette.blackColor,
      secondary: Colors.grey.shade100,
      onSecondary: Colors.grey.shade300,
    ),
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.divider,
    dialogTheme: DialogThemeData(backgroundColor: palette.background),
  );
}
