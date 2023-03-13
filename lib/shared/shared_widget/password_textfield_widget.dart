// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_icons.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  // late bool? _isPasswordEmpty;
  // void isPassEmptySetter(bool isPassEmpty) => _isPasswordEmpty =isPassEmpty;
  // bool get isPasswordEmptyGetter => _isPasswordEmpty!;
  String Function(String?) validate;
  TextEditingController passwordController;
  PasswordTextFieldWidget({
    Key? key,
    required this.validate,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SharedColors.backgroundGreyColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            border: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
            errorBorder: TextFieldBorder.fieldBorder(Colors.red),
            enabledBorder:
                TextFieldBorder.fieldBorder(SharedColors.yellowColor),
            focusedBorder:
                TextFieldBorder.fieldBorder(SharedColors.yellowColor),
            prefixIcon: SharedIcons.PasswordIcon,
            labelText: 'Password',
            labelStyle: SharedFonts.greyFont,
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye),
              color: Colors.white,
              iconSize: 20.0,
              onPressed: () {
                isObsecure = !isObsecure;
                setState(() {});
              },
            )),
        keyboardType: TextInputType.text,
        style: SharedFonts.whiteFont,
        obscureText: isObsecure,
        controller: widget.passwordController,
        onChanged: (x) {
          // widget.isPassEmptySetter(!passwordController.text.isNotEmpty);
          // setState(() {});
        },
        validator: widget.validate,
      ),
    );
  }
}
