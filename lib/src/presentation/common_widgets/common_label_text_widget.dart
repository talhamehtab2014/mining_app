import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonLabelTextWidget extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  double fontSize;
  Color textColor;
  double textHeight;
  TextAlign textAlign;
  TextDirection? textDirection;
  double padding;
  String? fontFamily;
  int? maxLines;

  CommonLabelTextWidget({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    required this.textColor,
    this.fontFamily,
    this.textDirection,
    this.padding = 0,
    this.textAlign = TextAlign.start,
    this.textHeight = 1,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        textDirection: textDirection,
        maxLines: maxLines,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          height: textHeight,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
