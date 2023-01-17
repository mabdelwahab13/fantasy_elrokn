import 'package:fantasy_elrokn/screens/admin/add_players_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';
import 'package:flutter/material.dart';

class PlayerSubScreen extends StatefulWidget {
  const PlayerSubScreen({super.key});

  @override
  State<PlayerSubScreen> createState() => _PlayerSubScreenState();
}

class _PlayerSubScreenState extends State<PlayerSubScreen> {
  TextEditingController enteredPlayerID = TextEditingController();
  TextEditingController outputtedPlayerID = TextEditingController();
  List<String> subedPlayers =[];
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 20,),
            SubtitutionTextField(
              textFieldController: outputtedPlayerID,
              hint: 'Enter the outputted player ID',
            ),
            SizedBox(height: 20,),
            EnabledButtonWidget(
                buttonText: 'Add player',
                onPressed: () {
                  if (playerIDList.contains(outputtedPlayerID.text)) {
                    subedPlayers.add(outputtedPlayerID.text);
                    playerIDList.remove(outputtedPlayerID.text);
                    playerIDList.add(enteredPlayerID.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    snack('Sucsses', SharedColors.greenTable),
                  );
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(
                    snack('Player is not member', SharedColors.redTable),
                  );
                }
                setState(() {});
                },
              ),
          ],
        ),
      ),
    ),
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