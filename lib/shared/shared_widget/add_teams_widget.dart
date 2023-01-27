// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';

class AddTeamsWidget extends StatefulWidget {
  int numOfTeams;
  String league;
  AddTeamsWidget({
    Key? key,
    required this.numOfTeams,
    required this.league,
  }) : super(key: key);

  @override
  State<AddTeamsWidget> createState() => _AddTeamsWidgetState();
}

class _AddTeamsWidgetState extends State<AddTeamsWidget> {
  TextEditingController teamNameController = TextEditingController();
  int _idD1 = 0;
  int _idG1 = 20;
  int _idG2 = 38;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Team',
              style: SharedFonts.yellowFont,
            ),
            backgroundColor: SharedColors.backgroundGreyColor,
            leading: IconButton(
              onPressed: () {
                if (widget.league != 'D1') {
                  if (widget.league != 'G1') {
                    model.allGroupTwoTeams.isNotEmpty &&
                            model.allGroupTwoTeams.length < 18
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            snack('Enter all teams', SharedColors.redTable),
                          )
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return alertDialog(
                        //         onPressedSure: () {
                        //           model.resetGroupTwoData();
                        //           Navigator.pushReplacement(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) {
                        //                 return AdminGroupTwoScreen();
                        //               },
                        //             ),
                        //           );
                        //         },
                        //         onPressedStay: () =>
                        //             Navigator.of(context).pop(),
                        //       );
                        //     },
                        //   )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AdminGroupTwoScreen();
                              },
                            ),
                          );
                  } else {
                    model.allGroupOneTeams.isNotEmpty &&
                            model.allGroupOneTeams.length < 18
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            snack('Enter all teams', SharedColors.redTable),
                          )
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return alertDialog(
                        //         onPressedSure: () {
                        //           model.resetGroupTwoData();
                        //           Navigator.pushReplacement(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) {
                        //                 return AdminGroupOneScreen();
                        //               },
                        //             ),
                        //           );
                        //         },
                        //         onPressedStay: () =>
                        //             Navigator.of(context).pop(),
                        //       );
                        //     },
                        //   )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AdminGroupOneScreen();
                              },
                            ),
                          );
                  }
                } else {
                  model.allDivOneTeams.isNotEmpty &&
                          model.allDivOneTeams.length < 20
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          snack('Enter all teams', SharedColors.redTable),
                        )
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return alertDialog(
                      //         onPressedSure: () {
                      //           model.resetGroupTwoData();
                      //           Navigator.pushReplacement(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) {
                      //                 return AdminDivisionOneScreen();
                      //               },
                      //             ),
                      //           );
                      //         },
                      //         onPressedStay: () => Navigator.of(context).pop(),
                      //       );
                      //     },
                      //   )
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AdminDivisionOneScreen();
                            },
                          ),
                        );
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: SharedColors.yellowColor,
              ),
            ),
          ),
          body: GrediantBackgroundWidget(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddTeamTextField(
                    hint: 'Team name',
                    textFieldController: teamNameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnabledButtonWidget(
                    buttonText: 'Add',
                    onPressed: () async {
                      if (widget.league != 'D1') {
                        if (widget.league != 'G1') {
                          if (model.allGroupTwoTeams.length <
                              widget.numOfTeams) {
                            bool isAddedG2 = await model.addTeamsGroupTwo({
                              'teamName': teamNameController.text,
                              'matchesPlayed': 0,
                              'wins': 0,
                              'draw': 0,
                              'lose': 0,
                              'pointsScored': 0,
                              'pointsAgainst': 0,
                              'pointsDiff': 0,
                              'points': 0,
                              'teamId': '$_idG2'
                            });
                            if (isAddedG2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snack('Sucsses', SharedColors.greenTable));
                              _idG2++;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                snack('Failed', SharedColors.redTable),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              snack(
                                  'You already entered ${widget.numOfTeams} Team',
                                  SharedColors.redTable),
                            );
                          }
                        } else {
                          if (model.allGroupOneTeams.length <
                              widget.numOfTeams) {
                            bool isAddedG1 = await model.addTeamsGroupOne({
                              'teamName': teamNameController.text,
                              'matchesPlayed': 0,
                              'wins': 0,
                              'draw': 0,
                              'lose': 0,
                              'pointsScored': 0,
                              'pointsAgainst': 0,
                              'pointsDiff': 0,
                              'points': 0,
                              'teamId': '$_idG1'
                            });
                            if (isAddedG1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snack('Sucsses', SharedColors.greenTable));
                              _idG1++;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                snack('Failed', SharedColors.redTable),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              snack(
                                  'You already entered ${widget.numOfTeams} Team',
                                  SharedColors.redTable),
                            );
                          }
                        }
                      } else {
                        if (model.allDivOneTeams.length < widget.numOfTeams) {
                          bool isAddedD1 = await model.addTeamsDivOne({
                            'teamName': teamNameController.text,
                            'matchesPlayed': 0,
                            'wins': 0,
                            'draw': 0,
                            'lose': 0,
                            'pointsScored': 0,
                            'pointsAgainst': 0,
                            'pointsDiff': 0,
                            'points': 0,
                            'teamId': '$_idD1'
                          });
                          if (isAddedD1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                snack('Sucsses', SharedColors.greenTable));
                            _idD1++;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              snack('Failed', SharedColors.redTable),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            snack(
                                'You already entered ${widget.numOfTeams} Team',
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
        );
      },
    );
  }
}

class AddTeamTextField extends StatefulWidget {
  TextEditingController textFieldController;
  String hint;
  AddTeamTextField({
    Key? key,
    required this.textFieldController,
    required this.hint,
  }) : super(key: key);

  @override
  State<AddTeamTextField> createState() => _AddTeamTextFieldState();
}

class _AddTeamTextFieldState extends State<AddTeamTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
        errorBorder: TextFieldBorder.fieldBorder(Colors.red),
        enabledBorder: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
        focusedBorder: TextFieldBorder.fieldBorder(SharedColors.yellowColor),
        labelText: widget.hint,
        labelStyle: SharedFonts.greyFont,
      ),
      keyboardType: TextInputType.text,
      style: SharedFonts.whiteFont,
      controller: widget.textFieldController,
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

AlertDialog alertDialog(
    {required Function onPressedSure, required Function onPressedStay}) {
  return AlertDialog(
    backgroundColor: SharedColors.backgroundBlackColor,
    content: Text(
        'You didn\'t enter all teams\n anything you added it will not save',
        style: SharedFonts.whiteTableFont),
    actions: [
      TextButton(
        onPressed: onPressedSure(),
        child: Text(
          'Sure',
          style: SharedFonts.redFont,
        ),
      ),
      TextButton(
        onPressed: onPressedStay(),
        child: Text(
          'Stay',
          style: SharedFonts.whiteTableFont,
        ),
      ),
    ],
  );
}
