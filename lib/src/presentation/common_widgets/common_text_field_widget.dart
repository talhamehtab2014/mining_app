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
  final bool isPassword;
  final bool isEnabled;

  const CommonTextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isEnabled = true,
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
          textColor: Theme.of(context).colorScheme.tertiary,
          padding: 0,
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: isEnabled ? R.palette.cardBackground : R.palette.yellow800,
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
            enabled: isEnabled,
            keyboardType: keyboardType,
            obscureText: isPassword,
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
