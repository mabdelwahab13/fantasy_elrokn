import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_widget/add_teams_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/txtfield_border.dart';
import 'package:flutter/material.dart';

import '../../shared/shared_theme/shared_fonts.dart';

List<String> playerIDList =[];

class AddPlayersScreen extends StatefulWidget {
  const AddPlayersScreen({super.key});

  @override
  State<AddPlayersScreen> createState() => _AddPlayersScreenState();
}

class _AddPlayersScreenState extends State<AddPlayersScreen> {
  TextEditingController addedPlayerID = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SharedColors.backgroundGreyColor,
        title: Text(
          'Add Player',
          style: SharedFonts.yellowFont,
        ),
      ),
      body: GrediantBackgroundWidget(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddPlayerTextField(
                textFieldController: addedPlayerID,
                hint: 'Enter the entered player ID',
              ),
              SizedBox(height: 20,),
              EnabledButtonWidget(
                buttonText: 'Add player',
                onPressed: () {
                  if (playerIDList.length < 5) {
                  playerIDList.add(addedPlayerID.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    snack('Sucsses', SharedColors.greenTable),
                  );
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(
                    snack('You already entered 5 Team', SharedColors.redTable),
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