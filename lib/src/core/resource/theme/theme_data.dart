part of '../r.dart';

ThemeData _createDarkThemeData(Palette palette) {
  final colorScheme = const ColorScheme.light().copyWith(
    onSurface: palette.background,
  );
  return ThemeData(
    colorScheme: colorScheme.copyWith(
      primary: palette.primary,
      onPrimary: palette.yellow600,
      surface: palette.yellow800,
      onSurface: palette.yellow900,
      tertiary: palette.labelColor,
      secondary: palette.cardBackground,
      onSecondary: palette.cardBackground,
      onPrimaryFixed: palette.yellow500,
      onPrimaryFixedVariant: palette.yellow100,
      onSecondaryFixed: palette.yellow300,
      onSecondaryFixedVariant: palette.yellow200,
      onTertiary: palette.white,
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
      onPrimary: Colors.grey.shade600,
      surface: palette.white,
      onSurface: palette.white,
      tertiary: palette.blackColor,
      secondary: Colors.grey.shade100,
      onSecondary: Colors.grey.shade300,
      onPrimaryFixed: Colors.grey.shade500,
      onPrimaryFixedVariant: palette.blackColor,
      onSecondaryFixed: Colors.grey.shade800,
      onSecondaryFixedVariant: Colors.grey.shade700,
      onTertiary: Colors.grey.shade800,
    ),
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.divider,
    dialogTheme: DialogThemeData(backgroundColor: palette.background),
  );
}
