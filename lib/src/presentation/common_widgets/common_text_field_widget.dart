import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CommonTextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLabelTextWidget(
          text: labelText,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          textColor: R.palette.labelColor,
          padding: 0,
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: R.palette.cardBackground,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: R.palette.borderOrDivider, width: 1.w),
          ),
          child: TextField(
            controller: controller,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: R.palette.primary,
            ),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintStyle: GoogleFonts.poppins(),
              hint: CommonLabelTextWidget(
                text: hintText,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                textColor: R.palette.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
