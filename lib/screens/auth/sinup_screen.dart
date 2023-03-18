import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/auth/login_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/disabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';
import '../../shared/shared_theme/shared_icons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _adminPasswordController = TextEditingController();
  bool isPasswordMatch = false;
  bool isEmailEmpty = true;
  bool isEmailPasswordEmpty = true;
  bool isConfirmPasswordEmpty = true;
  bool isAdminPasswordEmpty = false;
  final String _adminPassword = '10314420002001';
  String _currentItemSelected = 'user';
  bool isObsecureEmailPassword = true;
  bool isObsecureConfirmEmailPassword = true;
  bool isObsecureAdminPassword = true;
  String rool = 'user';
  List<String> options = [
    'user',
    'admin',
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundSubGreyColor,
            title: Text(
              'Fantasy El-Rokn',
              style: SharedFonts.babyBlueFont,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: SharedFonts.whiteFont,
                ),
              ),
            ],
          ),
          body: GrediantBackgroundWidget(
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      child: Image.asset(SharedImages.appLogo),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: SharedColors.backgroundGreyColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                      child: TextField(
                        decoration: InputDecoration(
                          border: TextFieldBorder.fieldBorder(
                              SharedColors.babyBlueColor),
                          errorBorder: TextFieldBorder.fieldBorder(Colors.red),
                          // enabledBorder: TextFieldBorder.fieldBorder(
                          //     SharedColors.babyBlueColor),
                          focusedBorder: TextFieldBorder.fieldBorder(
                              SharedColors.babyBlueColor),
                          prefixIcon: SharedIcons.emailIcon,
                          labelText: 'Email',
                          labelStyle: SharedFonts.greyFont,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: SharedFonts.whiteFont,
                        controller: _emailController,
                        onChanged: (x) async {
                          isEmailEmpty = (_emailController.text.isEmpty);
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: SharedColors.backgroundGreyColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: TextFieldBorder.fieldBorder(
                                SharedColors.babyBlueColor),
                            errorBorder:
                                TextFieldBorder.fieldBorder(Colors.red),
                            // enabledBorder: TextFieldBorder.fieldBorder(
                            //     SharedColors.babyBlueColor),
                            focusedBorder: TextFieldBorder.fieldBorder(
                                SharedColors.babyBlueColor),
                            prefixIcon: SharedIcons.PasswordIcon,
                            labelText: 'Password',
                            labelStyle: SharedFonts.greyFont,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              color: Colors.white,
                              iconSize: 20.0,
                              onPressed: () {
                                isObsecureEmailPassword =
                                    !isObsecureEmailPassword;
                                setState(() {});
                              },
                            )),
                        keyboardType: TextInputType.text,
                        style: SharedFonts.whiteFont,
                        obscureText: isObsecureEmailPassword,
                        controller: _passwordController,
                        onChanged: (x) {
                          isEmailPasswordEmpty =
                              _passwordController.text.isEmpty;
                          setState(() {});
                        },
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (!regex.hasMatch(value)) {
                            return ('please enter valid password min. 6 character');
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: SharedColors.backgroundGreyColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: TextFieldBorder.fieldBorder(
                                SharedColors.babyBlueColor),
                            errorBorder:
                                TextFieldBorder.fieldBorder(Colors.red),
                            // enabledBorder: TextFieldBorder.fieldBorder(
                            //     SharedColors.babyBlueColor),
                            focusedBorder: TextFieldBorder.fieldBorder(
                                SharedColors.babyBlueColor),
                            prefixIcon: SharedIcons.PasswordIcon,
                            labelText: 'Confirm Password',
                            labelStyle: SharedFonts.greyFont,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              color: Colors.white,
                              iconSize: 20.0,
                              onPressed: () {
                                isObsecureConfirmEmailPassword =
                                    !isObsecureConfirmEmailPassword;
                                setState(() {});
                              },
                            )),
                        keyboardType: TextInputType.text,
                        style: SharedFonts.whiteFont,
                        obscureText: isObsecureConfirmEmailPassword,
                        controller: _confirmPasswordController,
                        onChanged: (x) {
                          isConfirmPasswordEmpty =
                              _confirmPasswordController.text.isEmpty;
                          setState(() {});
                        },
                        validator: (value) {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            return 'Password did not match';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(38.w, 0.5.h, 38.w, 0.5.h),
                      child: DropdownButton(
                        dropdownColor: SharedColors.backgroundGreyColor,
                        isDense: true,
                        isExpanded: false,
                        iconEnabledColor: SharedColors.babyBlueColor,
                        focusColor: SharedColors.babyBlueColor,
                        items: options.map((String dropDownItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownItem,
                            child: Text(dropDownItem,
                                style: SharedFonts.whiteFont),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            _currentItemSelected = newValueSelected!;
                            rool = newValueSelected;
                            if (newValueSelected == 'admin') {
                              isAdminPasswordEmpty = true;
                            } else {
                              isAdminPasswordEmpty = false;
                            }
                          });
                        },
                        value: _currentItemSelected,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    rool == 'admin'
                        ? Container(
                            decoration: BoxDecoration(
                              color: SharedColors.backgroundGreyColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: TextFieldBorder.fieldBorder(
                                      SharedColors.babyBlueColor),
                                  errorBorder:
                                      TextFieldBorder.fieldBorder(Colors.red),
                                  // enabledBorder: TextFieldBorder.fieldBorder(
                                  //     SharedColors.babyBlueColor),
                                  focusedBorder: TextFieldBorder.fieldBorder(
                                      SharedColors.babyBlueColor),
                                  prefixIcon: SharedIcons.PasswordIcon,
                                  labelText: 'Admin Password',
                                  labelStyle: SharedFonts.greyFont,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.remove_red_eye),
                                    color: Colors.white,
                                    iconSize: 20.0,
                                    onPressed: () {
                                      setState(() {
                                        isObsecureAdminPassword =
                                            !isObsecureAdminPassword;
                                      });
                                    },
                                  )),
                              keyboardType: TextInputType.text,
                              style: SharedFonts.whiteFont,
                              obscureText: isObsecureAdminPassword,
                              controller: _adminPasswordController,
                              onChanged: (x) {
                                isAdminPasswordEmpty =
                                    _adminPasswordController.text.isEmpty;
                                setState(() {});
                              },
                              validator: (value) {
                                if ((_adminPasswordController.text).trim() !=
                                    _adminPassword) {
                                  return 'You are not Admin Please Change to User';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          )
                        : Container(),
                    isEmailEmpty ||
                            isEmailPasswordEmpty ||
                            isConfirmPasswordEmpty ||
                            isAdminPasswordEmpty
                        ? DisabledButtonWidget(title: 'SignUp')
                        : EnabledButtonWidget(
                            buttonText: 'SignUp',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool isValid = model
                                    .checkEmailValidate(_emailController.text);
                                if (isValid) {
                                  await model.registerCreateUsre(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    rool: rool,
                                    context: context,
                                  );
                                  await Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    snack('Email not valid',
                                        SharedColors.redTable),
                                  );
                                }
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

SnackBar snack(String title, Color color) {
  return SnackBar(
    content: Text('$title', style: SharedFonts.subWhiteFont),
    backgroundColor: color,
    duration: Duration(seconds: 3),
  );
}
