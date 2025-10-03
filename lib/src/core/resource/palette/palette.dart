part of '../r.dart';

class Palette {
  Palette._();

  static const _primary = Color(0xff0083CA);
  static const _darkBlue = Color(0xff0063B4);
  static const _black29 = Color(0xff292929);
  static const _black = Color(0xff222222);
  static final _lightGrey = Colors.grey.shade300;
  static const _greyColor = Colors.grey;
  static const _customGreyColor = Color(0xFFCECECE);
  static const _redColor = Colors.red;
  static const _lightBlue = Color(0xff65899D);
  static const _white = Color(0xffffffff);
  static const _red = Color(0xFFA81010);
  static const _transparent = Color(0x00000000);
  static const _greyTextColor = Color(0xFF999999);
  static const _borderColor = Color(0xFFA4A4A4);
  static const _lightGrayColor = Color(0xFFFAFAFA);
  static const _disableButtonColor = Color(0xFF65899D);
  static const _dialogBackground = Color(0xFF424242);

  Color get transparent => _transparent;

  Color get white => _white;

  Color get background => _lightGrey;

  Color get cardBackground => _black29;

  Color get iconColor => _white;

  Color get iconColorInverse => _white;

  Color get buttonDisabled => _lightBlue;

  Color get primary => _primary;

  Color get darkBlue => _darkBlue;

  Color get textWhite => _white;

  Color get error => _red;

  Color get checkBoxCheck => _white;

  Color get divider => _borderColor;

  Color get greyTextColor => _greyTextColor;

  Color get blackTextColor => _black29;

  Color get cardBackgroundColor => _lightGrayColor;

  Color get blackColor => _black;

  Color get greyColor => _greyColor;

  Color get redColor => _redColor;

  Color get customGreyColor => _customGreyColor;

  Color get disableButtonColor => _disableButtonColor;

  Color get dialogBackground => _dialogBackground;
}
