// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class DrawerWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  DrawerWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isD2Choosen = false;
  bool _isG1Done = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Drawer(
          child: GrediantBackgroundWidget(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(100, 80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: SharedColors.UnSelectedIconColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Premier League',
                            style: SharedFonts.whiteFont,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return widget.divisionOne;
                        }),
                      );
                    },
                  ),
                  Container(
                    height: isD2Choosen ? 180 : 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(100, 80)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: SharedColors.UnSelectedIconColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Second Division League',
                                  style: SharedFonts.whiteFont,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            isD2Choosen = !isD2Choosen;
                            setState(() {});
                          },
                        ),
                        if (isD2Choosen)
                          TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size(100, 40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: SharedColors.UnSelectedIconColor,
                                ),
                                Text(
                                  'Group 1',
                                  style: SharedFonts.whiteFont,
                                ),
                              ],
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return widget.groupOne;
                                }),
                              );
                              await model.getTeamsGroupOneTeams();
                      if (model.isGwFinished) {
                        await model.getTeamsDataG1();
                        if (model.teamsPointsG1.length < model.currentEvent) {
                          await model.getCurrentGWDataGroupOne();
                          await model.addPlayersDataG1({
                            'gwPoints': model.totalCurrentGWPointsG1,
                            'playerOfWeekName': model.playerOfWeekNameG1,
                            'playerOfWeek': '${model.playerOfWeekG1}',
                            'teamOfWeekName': model.teamOfWeekNameG1,
                            'teamOfWeek': '${model.teamOfWeekG1}',
                          });
                        } else {
                          return;
                        }
                      } else {
                        await model.getCurrentGWDataGroupOne();
                      }
                      await model.getTeamsDataG1();
                      await model.gameweekCreationG1();
                      if (model.isGwFinished) {
                        if (model.gw1CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 1
                              ? await model.makingTableG1(
                                  gw: model.gw1G1,
                                  team1Index: 4,
                                  team2Index: 1,
                                  team3Index: 9,
                                  team4Index: 2,
                                  team5Index: 7,
                                  team6Index: 12,
                                  team7Index: 11,
                                  team8Index: 15,
                                  team9Index: 0,
                                  team10Index: 8,
                                  team11Index: 5,
                                  team12Index: 6,
                                  team13Index: 17,
                                  team14Index: 16,
                                  team15Index: 14,
                                  team16Index: 13,
                                  team17Index: 3,
                                  team18Index: 10,
                                )
                              : _isG1Done = true;
                        } else if (model.gw2CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 2
                              ? await model.makingTableG1(
                                  gw: model.gw2G1,
                                  team1Index: 13,
                                  team2Index: 3,
                                  team3Index: 10,
                                  team4Index: 4,
                                  team5Index: 16,
                                  team6Index: 14,
                                  team7Index: 6,
                                  team8Index: 17,
                                  team9Index: 8,
                                  team10Index: 5,
                                  team11Index: 15,
                                  team12Index: 0,
                                  team13Index: 12,
                                  team14Index: 11,
                                  team15Index: 2,
                                  team16Index: 7,
                                  team17Index: 1,
                                  team18Index: 9,
                                )
                              : _isG1Done = true;
                        } else if (model.gw3CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 3
                              ? await model.makingTableG1(
                                  gw: model.gw3G1,
                                  team1Index: 11,
                                  team2Index: 2,
                                  team3Index: 7,
                                  team4Index: 1,
                                  team5Index: 4,
                                  team6Index: 9,
                                  team7Index: 0,
                                  team8Index: 12,
                                  team9Index: 5,
                                  team10Index: 15,
                                  team11Index: 17,
                                  team12Index: 8,
                                  team13Index: 14,
                                  team14Index: 6,
                                  team15Index: 3,
                                  team16Index: 16,
                                  team17Index: 10,
                                  team18Index: 13,
                                )
                              : _isG1Done = true;
                        } else if (model.gw4CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 4
                              ? await model.makingTableG1(
                                  gw: model.gw4G1,
                                  team1Index: 8,
                                  team2Index: 14,
                                  team3Index: 16,
                                  team4Index: 10,
                                  team5Index: 6,
                                  team6Index: 3,
                                  team7Index: 13,
                                  team8Index: 4,
                                  team9Index: 15,
                                  team10Index: 17,
                                  team11Index: 12,
                                  team12Index: 5,
                                  team13Index: 2,
                                  team14Index: 0,
                                  team15Index: 1,
                                  team16Index: 11,
                                  team17Index: 9,
                                  team18Index: 7,
                                )
                              : _isG1Done = true;
                        } else if (model.gw5CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 5
                              ? await model.makingTableG1(
                                  gw: model.gw5G1,
                                  team1Index: 17,
                                  team2Index: 12,
                                  team3Index: 11,
                                  team4Index: 9,
                                  team5Index: 0,
                                  team6Index: 1,
                                  team7Index: 5,
                                  team8Index: 2,
                                  team9Index: 4,
                                  team10Index: 7,
                                  team11Index: 14,
                                  team12Index: 15,
                                  team13Index: 3,
                                  team14Index: 8,
                                  team15Index: 10,
                                  team16Index: 6,
                                  team17Index: 13,
                                  team18Index: 16,
                                )
                              : _isG1Done = true;
                        } else if (model.gw6CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 6
                              ? await model.makingTableG1(
                                  gw: model.gw6G1,
                                  team1Index: 2,
                                  team2Index: 17,
                                  team3Index: 6,
                                  team4Index: 13,
                                  team5Index: 8,
                                  team6Index: 10,
                                  team7Index: 15,
                                  team8Index: 3,
                                  team9Index: 12,
                                  team10Index: 14,
                                  team11Index: 16,
                                  team12Index: 4,
                                  team13Index: 1,
                                  team14Index: 5,
                                  team15Index: 9,
                                  team16Index: 0,
                                  team17Index: 7,
                                  team18Index: 11,
                                )
                              : _isG1Done = true;
                        } else if (model.gw7CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 7
                              ? await model.makingTableG1(
                                  gw: model.gw7G1,
                                  team1Index: 10,
                                  team2Index: 15,
                                  team3Index: 0,
                                  team4Index: 7,
                                  team5Index: 5,
                                  team6Index: 9,
                                  team7Index: 17,
                                  team8Index: 1,
                                  team9Index: 14,
                                  team10Index: 2,
                                  team11Index: 3,
                                  team12Index: 12,
                                  team13Index: 4,
                                  team14Index: 11,
                                  team15Index: 13,
                                  team16Index: 8,
                                  team17Index: 16,
                                  team18Index: 6,
                                )
                              : _isG1Done = true;
                        } else if (model.gw8CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 8
                              ? await model.makingTableG1(
                                  gw: model.gw8G1,
                                  team1Index: 7,
                                  team2Index: 5,
                                  team3Index: 8,
                                  team4Index: 16,
                                  team5Index: 15,
                                  team6Index: 13,
                                  team7Index: 12,
                                  team8Index: 10,
                                  team9Index: 2,
                                  team10Index: 3,
                                  team11Index: 1,
                                  team12Index: 14,
                                  team13Index: 9,
                                  team14Index: 17,
                                  team15Index: 6,
                                  team16Index: 4,
                                  team17Index: 11,
                                  team18Index: 0,
                                )
                              : _isG1Done = true;
                        } else if (model.gw9CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 9
                              ? await model.makingTableG1(
                                  gw: model.gw9G1,
                                  team1Index: 6,
                                  team2Index: 8,
                                  team3Index: 5,
                                  team4Index: 11,
                                  team5Index: 17,
                                  team6Index: 7,
                                  team7Index: 14,
                                  team8Index: 9,
                                  team9Index: 3,
                                  team10Index: 1,
                                  team11Index: 10,
                                  team12Index: 2,
                                  team13Index: 13,
                                  team14Index: 12,
                                  team15Index: 16,
                                  team16Index: 15,
                                  team17Index: 4,
                                  team18Index: 0,
                                )
                              : _isG1Done = true;
                        } else if (model.gw10CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 10
                              ? await model.makingTableG1(
                                  gw: model.gw10G1,
                                  team1Index: 0,
                                  team2Index: 5,
                                  team3Index: 15,
                                  team4Index: 6,
                                  team5Index: 12,
                                  team6Index: 16,
                                  team7Index: 2,
                                  team8Index: 13,
                                  team9Index: 1,
                                  team10Index: 10,
                                  team11Index: 9,
                                  team12Index: 3,
                                  team13Index: 7,
                                  team14Index: 14,
                                  team15Index: 11,
                                  team16Index: 17,
                                  team17Index: 8,
                                  team18Index: 7,
                                )
                              : _isG1Done = true;
                        } else if (model.gw11CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 11
                              ? await model.makingTableG1(
                                  gw: model.gw11G1,
                                  team1Index: 6,
                                  team2Index: 12,
                                  team3Index: 17,
                                  team4Index: 0,
                                  team5Index: 14,
                                  team6Index: 11,
                                  team7Index: 3,
                                  team8Index: 7,
                                  team9Index: 10,
                                  team10Index: 9,
                                  team11Index: 13,
                                  team12Index: 1,
                                  team13Index: 16,
                                  team14Index: 2,
                                  team15Index: 4,
                                  team16Index: 5,
                                  team17Index: 8,
                                  team18Index: 15,
                                )
                              : _isG1Done = true;
                        } else if (model.gw12CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 12
                              ? await model.makingTableG1(
                                  gw: model.gw12G1,
                                  team1Index: 11,
                                  team2Index: 3,
                                  team3Index: 12,
                                  team4Index: 8,
                                  team5Index: 2,
                                  team6Index: 6,
                                  team7Index: 1,
                                  team8Index: 16,
                                  team9Index: 9,
                                  team10Index: 13,
                                  team11Index: 7,
                                  team12Index: 10,
                                  team13Index: 15,
                                  team14Index: 4,
                                  team15Index: 0,
                                  team16Index: 14,
                                  team17Index: 5,
                                  team18Index: 17,
                                )
                              : _isG1Done = true;
                        } else if (model.gw13CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 13
                              ? await model.makingTableG1(
                                  gw: model.gw13G1,
                                  team1Index: 16,
                                  team2Index: 9,
                                  team3Index: 14,
                                  team4Index: 5,
                                  team5Index: 3,
                                  team6Index: 0,
                                  team7Index: 10,
                                  team8Index: 11,
                                  team9Index: 13,
                                  team10Index: 7,
                                  team11Index: 4,
                                  team12Index: 17,
                                  team13Index: 6,
                                  team14Index: 1,
                                  team15Index: 8,
                                  team16Index: 2,
                                  team17Index: 15,
                                  team18Index: 12,
                                )
                              : _isG1Done = true;
                        } else if (model.gw14CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 14
                              ? await model.makingTableG1(
                                  gw: model.gw14G1,
                                  team1Index: 7,
                                  team2Index: 16,
                                  team3Index: 2,
                                  team4Index: 15,
                                  team5Index: 1,
                                  team6Index: 8,
                                  team7Index: 9,
                                  team8Index: 6,
                                  team9Index: 12,
                                  team10Index: 4,
                                  team11Index: 11,
                                  team12Index: 13,
                                  team13Index: 0,
                                  team14Index: 10,
                                  team15Index: 5,
                                  team16Index: 3,
                                  team17Index: 17,
                                  team18Index: 14,
                                )
                              : _isG1Done = true;
                        } else if (model.gw15CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 15
                              ? await model.makingTableG1(
                                  gw: model.gw15G1,
                                  team1Index: 13,
                                  team2Index: 0,
                                  team3Index: 3,
                                  team4Index: 17,
                                  team5Index: 10,
                                  team6Index: 5,
                                  team7Index: 4,
                                  team8Index: 14,
                                  team9Index: 16,
                                  team10Index: 11,
                                  team11Index: 6,
                                  team12Index: 7,
                                  team13Index: 8,
                                  team14Index: 9,
                                  team15Index: 15,
                                  team16Index: 1,
                                  team17Index: 12,
                                  team18Index: 2,
                                )
                              : _isG1Done = true;
                        } else if (model.gw16CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 16
                              ? await model.makingTableG1(
                                  gw: model.gw16G1,
                                  team1Index: 9,
                                  team2Index: 15,
                                  team3Index: 1,
                                  team4Index: 12,
                                  team5Index: 2,
                                  team6Index: 4,
                                  team7Index: 7,
                                  team8Index: 8,
                                  team9Index: 11,
                                  team10Index: 6,
                                  team11Index: 0,
                                  team12Index: 16,
                                  team13Index: 5,
                                  team14Index: 13,
                                  team15Index: 17,
                                  team16Index: 10,
                                  team17Index: 14,
                                  team18Index: 3,
                                )
                              : _isG1Done = true;
                        } else if (model.gw17CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 17
                              ? await model.makingTableG1(
                                  gw: model.gw17G1,
                                  team1Index: 10,
                                  team2Index: 14,
                                  team3Index: 4,
                                  team4Index: 3,
                                  team5Index: 13,
                                  team6Index: 7,
                                  team7Index: 16,
                                  team8Index: 5,
                                  team9Index: 6,
                                  team10Index: 0,
                                  team11Index: 8,
                                  team12Index: 11,
                                  team13Index: 15,
                                  team14Index: 7,
                                  team15Index: 12,
                                  team16Index: 9,
                                  team17Index: 2,
                                  team18Index: 1,
                                )
                              : _isG1Done = true;
                        } else if (model.gw18CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 18
                              ? await model.makingTableG1(
                                  gw: model.gw18G1,
                                  team1Index: 4,
                                  team2Index: 1,
                                  team3Index: 9,
                                  team4Index: 2,
                                  team5Index: 7,
                                  team6Index: 12,
                                  team7Index: 11,
                                  team8Index: 15,
                                  team9Index: 0,
                                  team10Index: 8,
                                  team11Index: 5,
                                  team12Index: 6,
                                  team13Index: 17,
                                  team14Index: 16,
                                  team15Index: 14,
                                  team16Index: 13,
                                  team17Index: 3,
                                  team18Index: 10,
                                )
                              : _isG1Done = true;
                        } else if (model.gw19CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 19
                              ? await model.makingTableG1(
                                  gw: model.gw19G1,
                                  team1Index: 13,
                                  team2Index: 3,
                                  team3Index: 10,
                                  team4Index: 4,
                                  team5Index: 16,
                                  team6Index: 14,
                                  team7Index: 6,
                                  team8Index: 17,
                                  team9Index: 8,
                                  team10Index: 5,
                                  team11Index: 15,
                                  team12Index: 0,
                                  team13Index: 12,
                                  team14Index: 11,
                                  team15Index: 2,
                                  team16Index: 7,
                                  team17Index: 1,
                                  team18Index: 9,
                                )
                              : _isG1Done = true;
                        } else if (model.gw20CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 20
                              ? await model.makingTableG1(
                                  gw: model.gw20G1,
                                  team1Index: 11,
                                  team2Index: 2,
                                  team3Index: 7,
                                  team4Index: 1,
                                  team5Index: 4,
                                  team6Index: 9,
                                  team7Index: 0,
                                  team8Index: 12,
                                  team9Index: 5,
                                  team10Index: 15,
                                  team11Index: 17,
                                  team12Index: 8,
                                  team13Index: 14,
                                  team14Index: 6,
                                  team15Index: 3,
                                  team16Index: 16,
                                  team17Index: 10,
                                  team18Index: 13,
                                )
                              : _isG1Done = true;
                        } else if (model.gw21CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 21
                              ? await model.makingTableG1(
                                  gw: model.gw21G1,
                                  team1Index: 8,
                                  team2Index: 14,
                                  team3Index: 16,
                                  team4Index: 10,
                                  team5Index: 6,
                                  team6Index: 3,
                                  team7Index: 13,
                                  team8Index: 4,
                                  team9Index: 15,
                                  team10Index: 17,
                                  team11Index: 12,
                                  team12Index: 5,
                                  team13Index: 2,
                                  team14Index: 0,
                                  team15Index: 1,
                                  team16Index: 11,
                                  team17Index: 9,
                                  team18Index: 7,
                                )
                              : _isG1Done = true;
                        } else if (model.gw22CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 22
                              ? await model.makingTableG1(
                                  gw: model.gw22G1,
                                  team1Index: 17,
                                  team2Index: 12,
                                  team3Index: 11,
                                  team4Index: 9,
                                  team5Index: 0,
                                  team6Index: 1,
                                  team7Index: 5,
                                  team8Index: 2,
                                  team9Index: 4,
                                  team10Index: 7,
                                  team11Index: 14,
                                  team12Index: 15,
                                  team13Index: 3,
                                  team14Index: 8,
                                  team15Index: 10,
                                  team16Index: 6,
                                  team17Index: 13,
                                  team18Index: 16,
                                )
                              : _isG1Done = true;
                        } else if (model.gw23CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 23
                              ? await model.makingTableG1(
                                  gw: model.gw23G1,
                                  team1Index: 2,
                                  team2Index: 17,
                                  team3Index: 6,
                                  team4Index: 13,
                                  team5Index: 8,
                                  team6Index: 10,
                                  team7Index: 15,
                                  team8Index: 3,
                                  team9Index: 12,
                                  team10Index: 14,
                                  team11Index: 16,
                                  team12Index: 4,
                                  team13Index: 1,
                                  team14Index: 5,
                                  team15Index: 9,
                                  team16Index: 0,
                                  team17Index: 7,
                                  team18Index: 11,
                                )
                              : _isG1Done = true;
                        } else if (model.gw24CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 24
                              ? await model.makingTableG1(
                                  gw: model.gw24G1,
                                  team1Index: 10,
                                  team2Index: 15,
                                  team3Index: 0,
                                  team4Index: 7,
                                  team5Index: 5,
                                  team6Index: 9,
                                  team7Index: 17,
                                  team8Index: 1,
                                  team9Index: 14,
                                  team10Index: 2,
                                  team11Index: 3,
                                  team12Index: 12,
                                  team13Index: 4,
                                  team14Index: 11,
                                  team15Index: 13,
                                  team16Index: 8,
                                  team17Index: 16,
                                  team18Index: 6,
                                )
                              : _isG1Done = true;
                        } else if (model.gw25CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 25
                              ? await model.makingTableG1(
                                  gw: model.gw25G1,
                                  team1Index: 7,
                                  team2Index: 5,
                                  team3Index: 8,
                                  team4Index: 16,
                                  team5Index: 15,
                                  team6Index: 13,
                                  team7Index: 12,
                                  team8Index: 10,
                                  team9Index: 2,
                                  team10Index: 3,
                                  team11Index: 1,
                                  team12Index: 14,
                                  team13Index: 9,
                                  team14Index: 17,
                                  team15Index: 6,
                                  team16Index: 4,
                                  team17Index: 11,
                                  team18Index: 0,
                                )
                              : _isG1Done = true;
                        } else if (model.gw26CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 26
                              ? await model.makingTableG1(
                                  gw: model.gw26G1,
                                  team1Index: 6,
                                  team2Index: 8,
                                  team3Index: 5,
                                  team4Index: 11,
                                  team5Index: 17,
                                  team6Index: 7,
                                  team7Index: 14,
                                  team8Index: 9,
                                  team9Index: 3,
                                  team10Index: 1,
                                  team11Index: 10,
                                  team12Index: 2,
                                  team13Index: 13,
                                  team14Index: 12,
                                  team15Index: 16,
                                  team16Index: 15,
                                  team17Index: 4,
                                  team18Index: 0,
                                )
                              : _isG1Done = true;
                        } else if (model.gw27CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 27
                              ? await model.makingTableG1(
                                  gw: model.gw27G1,
                                  team1Index: 0,
                                  team2Index: 5,
                                  team3Index: 15,
                                  team4Index: 6,
                                  team5Index: 12,
                                  team6Index: 16,
                                  team7Index: 2,
                                  team8Index: 13,
                                  team9Index: 1,
                                  team10Index: 10,
                                  team11Index: 9,
                                  team12Index: 3,
                                  team13Index: 7,
                                  team14Index: 14,
                                  team15Index: 11,
                                  team16Index: 17,
                                  team17Index: 8,
                                  team18Index: 7,
                                )
                              : _isG1Done = true;
                        } else if (model.gw28CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 28
                              ? await model.makingTableG1(
                                  gw: model.gw28G1,
                                  team1Index: 6,
                                  team2Index: 12,
                                  team3Index: 17,
                                  team4Index: 0,
                                  team5Index: 14,
                                  team6Index: 11,
                                  team7Index: 3,
                                  team8Index: 7,
                                  team9Index: 10,
                                  team10Index: 9,
                                  team11Index: 13,
                                  team12Index: 1,
                                  team13Index: 16,
                                  team14Index: 2,
                                  team15Index: 4,
                                  team16Index: 5,
                                  team17Index: 8,
                                  team18Index: 15,
                                )
                              : _isG1Done = true;
                        } else if (model.gw29CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 29
                              ? await model.makingTableG1(
                                  gw: model.gw29G1,
                                  team1Index: 11,
                                  team2Index: 3,
                                  team3Index: 12,
                                  team4Index: 8,
                                  team5Index: 2,
                                  team6Index: 6,
                                  team7Index: 1,
                                  team8Index: 16,
                                  team9Index: 9,
                                  team10Index: 13,
                                  team11Index: 7,
                                  team12Index: 10,
                                  team13Index: 15,
                                  team14Index: 4,
                                  team15Index: 0,
                                  team16Index: 14,
                                  team17Index: 5,
                                  team18Index: 17,
                                )
                              : _isG1Done = true;
                        } else if (model.gw30CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 30
                              ? await model.makingTableG1(
                                  gw: model.gw30G1,
                                  team1Index: 16,
                                  team2Index: 9,
                                  team3Index: 14,
                                  team4Index: 5,
                                  team5Index: 3,
                                  team6Index: 0,
                                  team7Index: 10,
                                  team8Index: 11,
                                  team9Index: 13,
                                  team10Index: 7,
                                  team11Index: 4,
                                  team12Index: 17,
                                  team13Index: 6,
                                  team14Index: 1,
                                  team15Index: 8,
                                  team16Index: 2,
                                  team17Index: 15,
                                  team18Index: 12,
                                )
                              : _isG1Done = true;
                        } else if (model.gw31CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 31
                              ? await model.makingTableG1(
                                  gw: model.gw31G1,
                                  team1Index: 7,
                                  team2Index: 16,
                                  team3Index: 2,
                                  team4Index: 15,
                                  team5Index: 1,
                                  team6Index: 8,
                                  team7Index: 9,
                                  team8Index: 6,
                                  team9Index: 12,
                                  team10Index: 4,
                                  team11Index: 11,
                                  team12Index: 13,
                                  team13Index: 0,
                                  team14Index: 10,
                                  team15Index: 5,
                                  team16Index: 3,
                                  team17Index: 17,
                                  team18Index: 14,
                                )
                              : _isG1Done = true;
                        } else if (model.gw32CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 32
                              ? await model.makingTableG1(
                                  gw: model.gw32G1,
                                  team1Index: 13,
                                  team2Index: 0,
                                  team3Index: 3,
                                  team4Index: 17,
                                  team5Index: 10,
                                  team6Index: 5,
                                  team7Index: 4,
                                  team8Index: 14,
                                  team9Index: 16,
                                  team10Index: 11,
                                  team11Index: 6,
                                  team12Index: 7,
                                  team13Index: 8,
                                  team14Index: 9,
                                  team15Index: 15,
                                  team16Index: 1,
                                  team17Index: 12,
                                  team18Index: 2,
                                )
                              : _isG1Done = true;
                        } else if (model.gw33CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 33
                              ? await model.makingTableG1(
                                  gw: model.gw33G1,
                                  team1Index: 9,
                                  team2Index: 15,
                                  team3Index: 1,
                                  team4Index: 12,
                                  team5Index: 2,
                                  team6Index: 4,
                                  team7Index: 7,
                                  team8Index: 8,
                                  team9Index: 11,
                                  team10Index: 6,
                                  team11Index: 0,
                                  team12Index: 16,
                                  team13Index: 5,
                                  team14Index: 13,
                                  team15Index: 17,
                                  team16Index: 10,
                                  team17Index: 14,
                                  team18Index: 3,
                                )
                              : _isG1Done = true;
                        } else if (model.gw34CurrentG1) {
                          model.allGroupOneTeams[0].matchesPlayed != 34
                              ? await model.makingTableG1(
                                  gw: model.gw34G1,
                                  team1Index: 10,
                                  team2Index: 14,
                                  team3Index: 4,
                                  team4Index: 3,
                                  team5Index: 13,
                                  team6Index: 7,
                                  team7Index: 16,
                                  team8Index: 5,
                                  team9Index: 6,
                                  team10Index: 0,
                                  team11Index: 8,
                                  team12Index: 11,
                                  team13Index: 15,
                                  team14Index: 7,
                                  team15Index: 12,
                                  team16Index: 9,
                                  team17Index: 2,
                                  team18Index: 1,
                                )
                              : _isG1Done = true;
                        }
                      } else {
                        null;
                      }
                            },
                          ),
                        if (isD2Choosen)
                          TextButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size(100, 40)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: SharedColors.UnSelectedIconColor,
                                ),
                                Text(
                                  'Group 2',
                                  style: SharedFonts.whiteFont,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return widget.groupTwo;
                                }),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: SharedColors.UnSelectedIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'El-Rokn League Cup',
                            style: SharedFonts.whiteFont,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: SharedColors.UnSelectedIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Champions League',
                            style: SharedFonts.whiteFont,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: SharedColors.UnSelectedIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Awards',
                            style: SharedFonts.whiteFont,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: SharedColors.UnSelectedIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rules',
                            style: SharedFonts.whiteFont,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {},
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
