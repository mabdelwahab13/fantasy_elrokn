import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/player_data_widget.dart';
import 'package:flutter/material.dart';

class TeamProfileScreen extends StatefulWidget {
  const TeamProfileScreen({super.key});

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TeamName',
          style: SharedFonts.yellowFont,
        ),
        backgroundColor: SharedColors.backgroundGreyColor,
        actions: [
          TextButton(
            onPressed: () {
              showMenu(
                  color: SharedColors.backgroundBlackColor,
                  context: context,
                  position: const RelativeRect.fromLTRB(60.0, 40.0, 40.0, 40.0),
                  items: [
                    for (int i = 0; i < 38; i++)
                      PopupMenuItem(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Gameweek ${i + 1}',
                            style: SharedFonts.subYellowFont,
                          ),
                        ),
                      ),
                  ]);
            },
            child: Row(
              children: [
                Text(
                  'Gameweek 1',
                  style: SharedFonts.subYellowFont,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: SharedColors.yellowColor,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
      body: GrediantBackgroundWidget(
        child: ListView(
          children: [
            PlayerDataTopRow(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return PlayerDataWidget();
              },
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Replaced',
              style: SharedFonts.whiteFont,
            ),
            PlayerDataWidget(),
            SizedBox(
              height: 50,
            ),
            Text(
              'Awards',
              style: SharedFonts.whiteFont,
            ),
            AwardsData(title: 'Team Of Week', num: 2),
            AwardsData(title: 'Team Of Month', num: 2),
          ],
        ),
      ),
    );
  }
}
