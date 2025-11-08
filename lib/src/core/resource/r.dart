import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'asset/assets.dart';
part 'palette/palette.dart';
part 'theme/theme_data.dart';

class R {
  const R._();

  static late Assets _assets;
  static late Palette _palette;
  static late ThemeData _themeData;
  static late ThemeData _darkThemeData;

  /// will be called first
  static void setData() {
    _assets = Assets._();
    _palette = Palette._();
    _themeData = _createLightThemeData(_palette);
    _darkThemeData = _createDarkThemeData(_palette);
  }

  static Assets get assets => _assets;

  static ThemeData get themeData => _themeData;

  static ThemeData get darkThemeData => _darkThemeData;

  static Palette get palette => _palette;
}
