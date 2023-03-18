// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/auth/login_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/disabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  Timer? timer;
  bool canResendEmail = false;
  bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendEmailVerification();
    }

    timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) => checkEmailVerified(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 10));
      setState(() => canResendEmail = true);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundSubGreyColor,
            title: Text(
              'Verify Email',
              style: SharedFonts.babyBlueFont,
            ),
          ),
          backgroundColor: SharedColors.backgroundBlackColor,
          body: GrediantBackgroundWidget(
            child: Center(
              child: isEmailVerified
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Email Verified',
                          style: SharedFonts.whiteFont,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        EnabledButtonWidget(
                          buttonText: 'Login',
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Email has been sent .. \nplease check your Email',
                          style: SharedFonts.whiteFont,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        canResendEmail
                            ? EnabledButtonWidget(
                                buttonText: 'Resend Email',
                                onPressed: () {
                                  sendEmailVerification();
                                  setState(() {
                                    canResendEmail = false;
                                  });
                                },
                              )
                            : DisabledButtonWidget(title: 'Resend Email'),
                        SizedBox(height: 30),
                        EnabledButtonWidget(
                          buttonText: 'Cancel',
                          onPressed: () => FirebaseAuth.instance.signOut(),
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
