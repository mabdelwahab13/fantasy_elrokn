// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/player_data_widget.dart';

class TeamProfileScreen extends StatefulWidget {
  int index;
  String league;
  String teamId;
  TeamProfileScreen({
    Key? key,
    required this.index,
    required this.league,
    required this.teamId,
  }) : super(key: key);

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.league != 'D1'
                  ? widget.league != 'G1'
                      ? model.allGroupTwoTeams.isEmpty
                          ? 'teamName'
                          : model.allGroupTwoTeams[widget.index].teamName
                      : model.allGroupOneTeams.isEmpty
                          ? 'teamName'
                          : model.allGroupOneTeams[widget.index].teamName
                  : model.allDivOneTeams.isEmpty
                      ? 'teamName'
                      : model.allDivOneTeams[widget.index].teamName,
              style: SharedFonts.yellowFont,
            ),
            backgroundColor: SharedColors.backgroundGreyColor,
            actions: [
              TextButton(
                onPressed: () {
                  showMenu(
                      color: SharedColors.backgroundBlackColor,
                      context: context,
                      position:
                          const RelativeRect.fromLTRB(60.0, 40.0, 40.0, 40.0),
                      items: [
                        for (int i = 0; i < 38; i++)
                          PopupMenuItem(
                            child: TextButton(
                              onPressed: () {
                                model.getPerviousData(widget.teamId,(i+1).toString());
                              },
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
                      'Gameweek',
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
                  itemCount: model.playerPoints.length,
                  itemBuilder: (context, index) {
                    return PlayerDataWidget(
                      playerName: '${model.playerInfo[index].playerFirstName} ${model.playerInfo[index].playerLastName}',
                      playerTeamName: model.playerInfo[index].name,
                      points: model.playerPoints[index].entryHistory,
                      
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                // Text(
                //   'Replaced',
                //   style: SharedFonts.whiteFont,
                // ),
                // PlayerDataWidget(),
                // SizedBox(
                //   height: 50,
                // ),
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
      },
    );
  }
}
