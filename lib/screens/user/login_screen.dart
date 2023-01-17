import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/sinup_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/email_textfield_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/password_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  EmailTextFieldWidget emailTextFieldWidget = EmailTextFieldWidget();
  PasswordTextFieldWidget passwordTextFieldWidget = PasswordTextFieldWidget();
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
          body: GrediantBackgroundWidget(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Login\n',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  EmailTextFieldWidget(),
                  PasswordTextFieldWidget(),
                  // emailTextFieldWidget.isEmailEmptyGetter || passwordTextFieldWidget.isPasswordEmptyGetter
                  //     ? const DisabledButtonWidget()
                  //     : const EnabledButtonWidget(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: SharedFonts.subYellowFont,
                    ),
                  ),
                  EnabledButtonWidget(
                    buttonText: 'Login',
                    onPressed: () async{
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const DivisionOneScreen();
                          },
                        ),
                      );
                        await model.getTeamsDivOneData();
                     await model.getTeamsGroupOneData();
                     await model.getTeamsGroupTwoData();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do You Have Email? ',
                        style: SharedFonts.subYellowFont,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'SignUp',
                          style: SharedFonts.subYellowFont,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
