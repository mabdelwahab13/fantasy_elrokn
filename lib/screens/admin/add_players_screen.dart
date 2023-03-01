// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_widget/add_teams_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';

import '../../shared/shared_theme/shared_fonts.dart';

class AddPlayersScreen extends StatefulWidget {
  String teamId;
  String league;
  AddPlayersScreen({
    Key? key,
    required this.teamId,
    required this.league,
  }) : super(key: key);

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  TextEditingController addedPlayer1ID = TextEditingController();
  TextEditingController addedPlayer2ID = TextEditingController();
  TextEditingController addedPlayer3ID = TextEditingController();
  TextEditingController addedPlayer4ID = TextEditingController();
  TextEditingController addedPlayer5ID = TextEditingController();
  List<String> playerIDList = [];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundGreyColor,
            title: Text(
              'Add Player',
              style: SharedFonts.yellowFont,
            ),
          ),
          body: GrediantBackgroundWidget(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AddPlayerTextField(
                      textFieldController: addedPlayer1ID,
                      hint: 'Enter player 1 ID',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AddPlayerTextField(
                      textFieldController: addedPlayer2ID,
                      hint: 'Enter player 2 ID',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AddPlayerTextField(
                      textFieldController: addedPlayer3ID,
                      hint: 'Enter player 3 ID',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AddPlayerTextField(
                      textFieldController: addedPlayer4ID,
                      hint: 'Enter player 4 ID',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AddPlayerTextField(
                      textFieldController: addedPlayer5ID,
                      hint: 'Enter player 5 ID',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    EnabledButtonWidget(
                      buttonText: 'Add player',
                      onPressed: () async {
                        if (playerIDList.length < 5) {
                          playerIDList.add(addedPlayer1ID.text.toString());
                          playerIDList.add(addedPlayer2ID.text.toString());
                          playerIDList.add(addedPlayer3ID.text.toString());
                          playerIDList.add(addedPlayer4ID.text.toString());
                          playerIDList.add(addedPlayer5ID.text.toString());
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.addPlayersIdG2({
                                      'playersId': playerIDList,
                                      'teamId': widget.teamId,
                                    })
                                  : model.addPlayersIdG1({
                                      'playersId': playerIDList,
                                      'teamId': widget.teamId,
                                    })
                              : model.addPlayersIdD1({
                                  'playersId': playerIDList,
                                  'teamId': widget.teamId,
                                });
                          ScaffoldMessenger.of(context).showSnackBar(
                            snack('Sucsses', SharedColors.greenTable),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            snack('You already entered 5 Payers',
                                SharedColors.redTable),
                          );
                        }
                        setState(() {});
                      },
                    ),
                    TextButton(
                      onPressed: () async {
                        bool isReset = await model.resetAllData();
                        isReset
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                snack('Sucsses', SharedColors.greenTable))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                snack('Failed', SharedColors.redTable),
                              );
                      },
                      child: Text(
                        'Reset',
                        style: SharedFonts.redFont,
                      ),
                    ),
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

class AddPlayerTextField extends StatefulWidget {
  TextEditingController textFieldController;
  String hint;
  AddPlayerTextField({
    Key? key,
    required this.textFieldController,
    required this.hint,
  }) : super(key: key);

  @override
  State<AddPlayerTextField> createState() => _AddPlayerTextFieldState();
}

class _AddPlayerTextFieldState extends State<AddPlayerTextField> {
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
