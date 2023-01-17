import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/email_textfield_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/password_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundSubGreyColor,
            title: Text(
              'Fantasy El-Rokn',
              style: SharedFonts.yellowFont,
            ),
          ),
          backgroundColor: SharedColors.backgroundBlackColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SignUp\n',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                EmailTextFieldWidget(),
                PasswordTextFieldWidget(),
                PasswordTextFieldWidget(),
                EnabledButtonWidget(
                  buttonText: 'SignUp',
                  onPressed: () async{
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const AdminDivisionOneScreen();
                        },
                      ),
                    );
                    await model.getTeamsDivOneData();
                     await model.getTeamsGroupOneData();
                     await model.getTeamsGroupTwoData();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
