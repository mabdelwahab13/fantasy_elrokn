import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';

class PlayOffWidget extends StatefulWidget {
  const PlayOffWidget({super.key});

  @override
  State<PlayOffWidget> createState() => _PlayOffWidgetState();
}

class _PlayOffWidgetState extends State<PlayOffWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0), 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: SharedColors.backgroundGreyColor,
                  border: Border.all(
                    color: SharedColors.yellowColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Team1', style: SharedFonts.subWhiteFont),
                    Text(
                      '300',
                      style: SharedFonts.subWhiteFont,
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '300',
                      style: SharedFonts.subWhiteFont,
                    ),
                    Text(
                      'Team2',
                      style: SharedFonts.subWhiteFont,
                    ),
                  ],
                ),
              ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: SharedColors.backgroundGreyColor,
                  border: Border.all(
                    color: SharedColors.yellowColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Team1', style: SharedFonts.subWhiteFont),
                    Text(
                      '300',
                      style: SharedFonts.subWhiteFont,
                    ),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '300',
                      style: SharedFonts.subWhiteFont,
                    ),
                    Text(
                      'Team2',
                      style: SharedFonts.subWhiteFont,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
