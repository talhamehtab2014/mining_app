import 'package:flutter/material.dart';

part 'asset/assets.dart';

part 'palette/palette.dart';

part 'theme/theme_data.dart';

class R {
  const R._();

  static late Assets _assets;
  static late Palette _palette;
  static late ThemeData _themeData;

  /// will be called first
  static void setData() {
    _assets = Assets._();
    _palette = Palette._();
    _themeData = _createThemeData(_palette);
  }

  static Assets get assets => _assets;

  static ThemeData get themeData => _themeData;

  static Palette get palette => _palette;
}
