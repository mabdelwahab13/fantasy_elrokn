import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class DisabledButtonWidget extends StatelessWidget {
  String title;
  DisabledButtonWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w,0.5.h,20.w,0.5.h),
      child: TextButton(
        onPressed: null,
        style: TextButton.styleFrom(
          backgroundColor: SharedColors.backgroundGreyColor,
          minimumSize: Size(1.w, 7.h),
          maximumSize: Size(1.w, 12.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        child: Text(title, style: SharedFonts.whiteFont),
      ),
    );
  }
}
