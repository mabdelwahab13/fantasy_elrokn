// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
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
                            });
                            isAddedG2
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    snack('Sucsses', SharedColors.greenTable))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    snack('Failed', SharedColors.redTable),
                                  );
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
                            });
                            isAddedG1
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    snack('Sucsses', SharedColors.greenTable))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    snack('Failed', SharedColors.redTable),
                                  );
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
                          });
                          isAddedD1
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  snack('Sucsses', SharedColors.greenTable))
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  snack('Failed', SharedColors.redTable),
                                );
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
