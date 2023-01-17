// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_icons.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';
import 'package:flutter/material.dart';


class EmailTextFieldWidget extends StatefulWidget {
  // late bool? _isEmailEmpty;
  // void isEmailEmptySetter(bool isEmailEmpty) => _isEmailEmpty =isEmailEmpty;
  // bool get isEmailEmptyGetter => _isEmailEmpty!;
  EmailTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailTextFieldWidget> createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SharedColors.backgroundGreyColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
          errorBorder: TextFieldBorder.fieldBorder(Colors.red),
          enabledBorder: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
          focusedBorder: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
          prefixIcon: SharedIcons.emailIcon,
          labelText: 'Email',
          labelStyle: SharedFonts.greyFont,
        ),
        keyboardType: TextInputType.emailAddress,
        style: SharedFonts.whiteFont,
        controller: emailController,
        onChanged: (x) async {
          // widget.isEmailEmptySetter(false);
          // setState(() {});
        },
      ),
    );
  }
}
