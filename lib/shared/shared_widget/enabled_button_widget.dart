// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';

import 'package:sizer/sizer.dart';

class EnabledButtonWidget extends StatefulWidget {
  String buttonText;
  final Function? onPressed;
  EnabledButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<EnabledButtonWidget> createState() => _EnabledButtonWidgetState();
}

class _EnabledButtonWidgetState extends State<EnabledButtonWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0.5.h, 20.w, 0.5.h),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: SharedColors.backgroundGreyColor,
            minimumSize: Size(1.w, 7.h),
            maximumSize: Size(1.w, 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            side: BorderSide(color: SharedColors.babyBlueColor, width: 2)),
        onPressed: () => widget.onPressed!(),
        child: Text(widget.buttonText, style: SharedFonts.whiteFont),
      ),
    );
  }
}
