import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_application/src/core/resource/r.dart';
import 'package:mining_application/src/presentation/common_widgets/common_label_text_widget.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const CommonTextFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: R.palette.cardBackground,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: R.palette.borderOrDivider,
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonLabelTextWidget(
            text: labelText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            textColor: R.palette.primary,
            padding: 0,
          ),
          2.verticalSpace,
          TextField(
            controller: controller,
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintStyle: GoogleFonts.poppins(),
              hint: CommonLabelTextWidget(
                text: hintText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textColor: R.palette.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
