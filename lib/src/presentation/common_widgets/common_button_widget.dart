import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mining_application/src/core/resource/r.dart';

class ButtonWithRadiusWidget extends StatelessWidget {
  final String buttonTitle;
  final Color? backColor;
  final Color overlayColor;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool enableShadow;
  final double borderRadius;
  final EdgeInsets padding;
  final VoidCallback callback;
  final bool isDisabled;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? disabledBackColor; // Custom color for disabled state
  final Color? disabledOverlayColor; // Custom overlay color for disabled state
  final Color? disabledTextColor; // Custom overlay color for disabled state
  const ButtonWithRadiusWidget({
    super.key,
    this.borderRadius = 0,
    this.padding = EdgeInsets.zero,
    this.buttonTitle = "",
    this.overlayColor = Colors.white,
    this.backColor,
    this.width = double.maxFinite,
    this.height = 48,
    this.textStyle,
    this.splashFactory,
    this.enableShadow = true,
    required this.callback,
    this.isDisabled = false,
    this.disabledBackColor,
    this.disabledOverlayColor,
    this.disabledTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: width,
      height: height,
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledBackColor ??
                  Color.fromRGBO(229, 231, 241, 1); // Color when disabled
            }
            return backColor ?? R.palette.primary; // Regular button color
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledTextColor ??
                  Color.fromRGBO(177, 179, 179, 1); // Text color when disabled
            }
            return overlayColor; // Regular text color
          }),
          padding: MaterialStateProperty.all(padding),
          splashFactory: splashFactory,
          elevation: MaterialStateProperty.all(enableShadow ? 4 : 0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          fixedSize: MaterialStateProperty.all(Size(width, height)),
        ),
        onPressed: !isDisabled ? (() => callback()) : null,
        child: AutoSizeText(
          buttonTitle,
          style:
              textStyle ??
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }
}
