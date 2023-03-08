// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/admin/add_players_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';

class PlayerSubScreen extends StatefulWidget {
  String teamID;
  String league;
  PlayerSubScreen({
    Key? key,
    required this.teamID,
    required this.league,
  }) : super(key: key);

  @override
  State<PlayerSubScreen> createState() => _PlayerSubScreenState();
}

class _PlayerSubScreenState extends State<PlayerSubScreen> {
  TextEditingController enteredPlayerID = TextEditingController();
  TextEditingController outputtedPlayerID = TextEditingController();
  List<String> subedPlayers = [];
  bool isSuccsess = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundGreyColor,
            title: Text(
              'Substitute Player',
              style: SharedFonts.yellowFont,
            ),
          ),
          body: GrediantBackgroundWidget(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubtitutionTextField(
                    textFieldController: enteredPlayerID,
                    hint: 'Enter the entered player ID',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SubtitutionTextField(
                    textFieldController: outputtedPlayerID,
                    hint: 'Enter the outputted player ID',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EnabledButtonWidget(
                    buttonText: 'Add player',
                    onPressed: () async {
                      widget.league != 'D1'
                          ? widget.league != 'G1'
                              ? isSuccsess = await model.replacePlayerG2(
                                  enteredPlayerID: enteredPlayerID.text,
                                  outputtedPlayerID: outputtedPlayerID.text,
                                )
                              : isSuccsess = await model.replacePlayerG1(
                                  enteredPlayerID: enteredPlayerID.text,
                                  outputtedPlayerID: outputtedPlayerID.text,
                                )
                          : isSuccsess = await model.replacePlayerD1(
                              enteredPlayerID: enteredPlayerID.text,
                              outputtedPlayerID: outputtedPlayerID.text,
                            );
                      isSuccsess
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              snack('Sucsses', SharedColors.greenTable),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              snack('Failed', SharedColors.redTable),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SubtitutionTextField extends StatefulWidget {
  TextEditingController textFieldController;
  String hint;
  SubtitutionTextField({
    Key? key,
    required this.textFieldController,
    required this.hint,
  }) : super(key: key);

  @override
  State<SubtitutionTextField> createState() => _SubtitutionTextFieldState();
}

class _SubtitutionTextFieldState extends State<SubtitutionTextField> {
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
