// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/player_data_widget.dart';

class TeamProfileScreen extends StatefulWidget {
  int index;
  String league;
  String teamId;
  int event;
  TeamProfileScreen({
    Key? key,
    required this.index,
    required this.league,
    required this.teamId,
    required this.event,
  }) : super(key: key);

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
  List<String> options = [for (int i = 1; i <= 38; i++) 'Gameweek $i'];
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        String currentItemSelected = 'Gameweek ${model.currentEvent}';
        // int _current = model.currentEvent; 
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
              style: SharedFonts.babyBlueFont,
            ),
            backgroundColor: SharedColors.backgroundGreyColor,
            actions: [
              Align(
                alignment: Alignment.center,
                child: DropdownButton(
                  dropdownColor: SharedColors.backgroundGreyColor,
                  isDense: true,
                  isExpanded: false,
                  iconEnabledColor: SharedColors.babyBlueColor,
                  focusColor: SharedColors.babyBlueColor,
                  items: options.map((String dropDownItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownItem,
                      child:
                          Text(dropDownItem, style: SharedFonts.subBabyBlueFont),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      currentItemSelected = newValueSelected!;
                      widget.event =
                          int.parse(newValueSelected.replaceAll('Gameweek ', ''));
                    });
                  },
                  value: currentItemSelected,
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     showMenu(
              //         color: SharedColors.backgroundBlackColor,
              //         context: context,
              //         position:
              //             const RelativeRect.fromLTRB(60.0, 40.0, 40.0, 40.0),
              //         items: [
              //           for (int i = 1; i < 39; i++)
              //             PopupMenuItem(
              //               child: TextButton(
              //                 onPressed: () {
              //                   setState(() {
              //                     widget.event = i;
              //                     _current =i;
              //                   });
              //                 },
              //                 child: Text(
              //                   'Gameweek $i',
              //                   style: SharedFonts.subBabyBlueFont,
              //                 ),
              //               ),
              //             ),
              //         ]);
              //   },
              //   child: Row(
              //     children: [
              //       Text(
              //         'Gameweek $_current',
              //         style: SharedFonts.subBabyBlueFont,
              //       ),
              //       Icon(
              //         Icons.arrow_drop_down,
              //         color: SharedColors.babyBlueColor,
              //         size: 25,
              //       ),
              //     ],
              //   ),
              // ),
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
                      playerName:
                          '${model.playerInfo[index].playerFirstName} ${model.playerInfo[index].playerLastName}',
                      playerTeamName: model.playerInfo[index].name,
                      points: model.playerPoints[index].current,
                      event: widget.event,
                    );
                  },
                ),
                // SizedBox(
                //   height: 50,
                // ),
                // Text(
                //   'Replaced',
                //   style: SharedFonts.whiteFont,
                // ),
                // PlayerDataWidget(),
                // SizedBox(
                //   height: 50,
                // ),
                // Text(
                //   'Awards',
                //   style: SharedFonts.whiteFont,
                // ),
                // AwardsData(title: 'Team Of Week', num: 2),
                // AwardsData(title: 'Team Of Month', num: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
