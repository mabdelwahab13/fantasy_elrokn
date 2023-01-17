// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';

import '../../screens/user/division_one_screen.dart';

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
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: SharedColors.backgroundGreyColor,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(color: SharedColors.yellowColor, width: 2)
      ),
      onPressed: () => widget.onPressed!(),
      child:
           Text(widget.buttonText, style: TextStyle(color: Colors.white, fontSize: 20.0)),
    );
  }
}
