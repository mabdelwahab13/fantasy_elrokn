// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class DivisionOneWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  String league;
  String division;
  bool isUser;
  DivisionOneWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
    required this.league,
    required this.division,
    required this.isUser,
  }) : super(key: key);

  @override
  State<DivisionOneWidget> createState() => _DivisionOneWidgetState();
}

class _DivisionOneWidgetState extends State<DivisionOneWidget> {
  int _currentBottomIndex = 0;

  _changeBottomTab(int index) {
    setState(() {
      _currentBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return DefaultTabController(
          initialIndex: model.currentEvent-1,
          length: _currentBottomIndex == 0 ? 38 : 0,
          child: Scaffold(
            backgroundColor: SharedColors.backgroundBlackColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: SharedColors.yellowColor),
              backgroundColor: SharedColors.backgroundGreyColor,
              title: Text(
                'Permier League',
                style: SharedFonts.yellowFont,
              ),
              bottom: _currentBottomIndex == 0
                  ? TabBar(
                      // controller: _ChangeTabBar,
                      unselectedLabelStyle: SharedFonts.greyFont,
                      isScrollable: true,
                      indicatorColor: SharedColors.subYellowColor,
                      tabs: SharedLeagueGameWeeks.tabs,
                    )
                  : null,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme:
                  IconThemeData(color: SharedColors.UnSelectedIconColor),
              unselectedItemColor: SharedColors.UnSelectedIconColor,
              unselectedLabelStyle: SharedFonts.greyFont,
              iconSize: 25,
              showUnselectedLabels: true,
              fixedColor: SharedColors.yellowColor,
              backgroundColor: SharedColors.backgroundBlackColor,
              currentIndex: _currentBottomIndex,
              onTap: _changeBottomTab,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    SharedImages.greyMatchesIcon,
                    height: 30,
                    width: 40,
                  ),
                  activeIcon: Image.asset(
                    SharedImages.yellowMatchesIcon,
                    height: 28,
                    width: 38,
                  ),
                  label: 'Matches',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.table_rows_outlined),
                  label: 'Table',
                ),
              ],
            ),
            drawer: DrawerWidget(
              divisionOne: widget.divisionOne,
              groupOne: widget.groupOne,
              groupTwo: widget.groupTwo,
            ),
            body: GrediantBackgroundWidget(
              child: ListView(
                children: [
                  _currentBottomIndex == 1
                      ? TableWidget(
                          numOfTeams: 20,
                          isUser: widget.isUser,
                          league: widget.league,
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height,
                          child: TabBarView(
                            children: <Widget>[
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw1,
                                numOfPlayers: model.teamsPoints.isEmpty
                                    ? 0
                                    : model
                                        .teamsPoints[0].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.isEmpty
                                    ? 0
                                    : model
                                        .teamsPoints[0].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.isEmpty
                                    ? []
                                    : model.teamsPoints[0].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.isEmpty
                                    ? []
                                    : model.teamsPoints[0].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.isEmpty
                                    ? ''
                                    : model.teamsPoints[0].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.isEmpty
                                    ? ''
                                    : model.teamsPoints[0].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw2,
                                numOfPlayers: model.teamsPoints.length < 2
                                    ? 0
                                    : model
                                        .teamsPoints[1].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 2
                                    ? 0
                                    : model
                                        .teamsPoints[1].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 2
                                    ? []
                                    : model.teamsPoints[1].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 2
                                    ? []
                                    : model.teamsPoints[1].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 2
                                    ? ''
                                    : model.teamsPoints[1].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 2
                                    ? ''
                                    : model.teamsPoints[1].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw3,
                                numOfPlayers: model.teamsPoints.length < 3
                                    ? 0
                                    : model
                                        .teamsPoints[2].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 3
                                    ? 0
                                    : model
                                        .teamsPoints[2].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 3
                                    ? []
                                    : model.teamsPoints[2].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 3
                                    ? []
                                    : model.teamsPoints[2].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 3
                                    ? ''
                                    : model.teamsPoints[2].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 3
                                    ? ''
                                    : model.teamsPoints[2].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw4,
                                numOfPlayers: model.teamsPoints.length < 4
                                    ? 0
                                    : model
                                        .teamsPoints[3].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 4
                                    ? 0
                                    : model
                                        .teamsPoints[3].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 4
                                    ? []
                                    : model.teamsPoints[3].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 4
                                    ? []
                                    : model.teamsPoints[3].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 4
                                    ? ''
                                    : model.teamsPoints[3].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 4
                                    ? ''
                                    : model.teamsPoints[3].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw5,
                                numOfPlayers: model.teamsPoints.length < 5
                                    ? 0
                                    : model
                                        .teamsPoints[4].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 5
                                    ? 0
                                    : model
                                        .teamsPoints[4].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 5
                                    ? []
                                    : model.teamsPoints[4].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 5
                                    ? []
                                    : model.teamsPoints[4].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 5
                                    ? ''
                                    : model.teamsPoints[4].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 5
                                    ? ''
                                    : model.teamsPoints[4].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw6,
                                numOfPlayers: model.teamsPoints.length < 6
                                    ? 0
                                    : model
                                        .teamsPoints[5].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 6
                                    ? 0
                                    : model
                                        .teamsPoints[5].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 6
                                    ? []
                                    : model.teamsPoints[5].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 6
                                    ? []
                                    : model.teamsPoints[5].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 6
                                    ? ''
                                    : model.teamsPoints[5].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 6
                                    ? ''
                                    : model.teamsPoints[5].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw7,
                                numOfPlayers: model.teamsPoints.length < 19
                                    ? 0
                                    : model
                                        .teamsPoints[18].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 19
                                    ? 0
                                    : model
                                        .teamsPoints[18].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 19
                                    ? []
                                    : model.teamsPoints[18].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 19
                                    ? []
                                    : model.teamsPoints[18].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 19
                                    ? ''
                                    : model.teamsPoints[18].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 19
                                    ? ''
                                    : model.teamsPoints[18].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw8,
                                numOfPlayers: model.teamsPoints.length < 8
                                    ? 0
                                    : model
                                        .teamsPoints[7].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 8
                                    ? 0
                                    : model
                                        .teamsPoints[7].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 8
                                    ? []
                                    : model.teamsPoints[7].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 8
                                    ? []
                                    : model.teamsPoints[7].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 8
                                    ? ''
                                    : model.teamsPoints[7].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 8
                                    ? ''
                                    : model.teamsPoints[7].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw9,
                                numOfPlayers: model.teamsPoints.length < 9
                                    ? 0
                                    : model
                                        .teamsPoints[8].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 9
                                    ? 0
                                    : model
                                        .teamsPoints[8].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 9
                                    ? []
                                    : model.teamsPoints[8].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 9
                                    ? []
                                    : model.teamsPoints[8].teamOfWeekName,
                                playerOfWeekPoints: model.teamsPoints.length < 9
                                    ? ''
                                    : model.teamsPoints[8].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 9
                                    ? ''
                                    : model.teamsPoints[8].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw10,
                                numOfPlayers: model.teamsPoints.length < 10
                                    ? 0
                                    : model
                                        .teamsPoints[9].playerOfWeekName.length,
                                numOfTeams: model.teamsPoints.length < 10
                                    ? 0
                                    : model
                                        .teamsPoints[9].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 10
                                    ? []
                                    : model.teamsPoints[9].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 10
                                    ? []
                                    : model.teamsPoints[9].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 10
                                        ? ''
                                        : model.teamsPoints[9].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 10
                                    ? ''
                                    : model.teamsPoints[9].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw11,
                                numOfPlayers: model.teamsPoints.length < 11
                                    ? 0
                                    : model.teamsPoints[10].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 11
                                    ? 0
                                    : model
                                        .teamsPoints[10].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 11
                                    ? []
                                    : model.teamsPoints[10].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 11
                                    ? []
                                    : model.teamsPoints[10].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 11
                                        ? ''
                                        : model.teamsPoints[10].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 11
                                    ? ''
                                    : model.teamsPoints[10].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw12,
                                numOfPlayers: model.teamsPoints.length < 12
                                    ? 0
                                    : model.teamsPoints[11].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 12
                                    ? 0
                                    : model
                                        .teamsPoints[11].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 12
                                    ? []
                                    : model.teamsPoints[11].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 12
                                    ? []
                                    : model.teamsPoints[11].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 12
                                        ? ''
                                        : model.teamsPoints[11].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 12
                                    ? ''
                                    : model.teamsPoints[11].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw13,
                                numOfPlayers: model.teamsPoints.length < 13
                                    ? 0
                                    : model.teamsPoints[12].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 13
                                    ? 0
                                    : model
                                        .teamsPoints[12].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 13
                                    ? []
                                    : model.teamsPoints[12].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 13
                                    ? []
                                    : model.teamsPoints[12].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 13
                                        ? ''
                                        : model.teamsPoints[12].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 13
                                    ? ''
                                    : model.teamsPoints[12].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw14,
                                numOfPlayers: model.teamsPoints.length < 14
                                    ? 0
                                    : model.teamsPoints[13].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 14
                                    ? 0
                                    : model
                                        .teamsPoints[13].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 14
                                    ? []
                                    : model.teamsPoints[13].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 14
                                    ? []
                                    : model.teamsPoints[13].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 14
                                        ? ''
                                        : model.teamsPoints[13].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 14
                                    ? ''
                                    : model.teamsPoints[13].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw15,
                                numOfPlayers: model.teamsPoints.length < 15
                                    ? 0
                                    : model.teamsPoints[14].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 15
                                    ? 0
                                    : model
                                        .teamsPoints[14].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 15
                                    ? []
                                    : model.teamsPoints[14].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 15
                                    ? []
                                    : model.teamsPoints[14].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 15
                                        ? ''
                                        : model.teamsPoints[14].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 15
                                    ? ''
                                    : model.teamsPoints[14].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw16,
                                numOfPlayers: model.teamsPoints.length < 16
                                    ? 0
                                    : model.teamsPoints[15].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 16
                                    ? 0
                                    : model
                                        .teamsPoints[15].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 16
                                    ? []
                                    : model.teamsPoints[15].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 16
                                    ? []
                                    : model.teamsPoints[15].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 16
                                        ? ''
                                        : model.teamsPoints[15].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 16
                                    ? ''
                                    : model.teamsPoints[15].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw17,
                                numOfPlayers: model.teamsPoints.length < 17
                                    ? 0
                                    : model.teamsPoints[16].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 17
                                    ? 0
                                    : model
                                        .teamsPoints[16].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 17
                                    ? []
                                    : model.teamsPoints[16].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 17
                                    ? []
                                    : model.teamsPoints[16].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 17
                                        ? ''
                                        : model.teamsPoints[16].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 17
                                    ? ''
                                    : model.teamsPoints[16].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw18,
                                numOfPlayers: model.teamsPoints.length < 18
                                    ? 0
                                    : model.teamsPoints[17].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 18
                                    ? 0
                                    : model
                                        .teamsPoints[17].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 18
                                    ? []
                                    : model.teamsPoints[17].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 18
                                    ? []
                                    : model.teamsPoints[17].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 18
                                        ? ''
                                        : model.teamsPoints[17].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 18
                                    ? ''
                                    : model.teamsPoints[17].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw19,
                                numOfPlayers: model.teamsPoints.length < 19
                                    ? 0
                                    : model.teamsPoints[18].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 19
                                    ? 0
                                    : model
                                        .teamsPoints[18].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 19
                                    ? []
                                    : model.teamsPoints[18].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 19
                                    ? []
                                    : model.teamsPoints[18].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 19
                                        ? ''
                                        : model.teamsPoints[18].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 19
                                    ? ''
                                    : model.teamsPoints[18].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw20,
                                numOfPlayers: model.teamsPoints.length < 20
                                    ? 0
                                    : model.teamsPoints[19].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 20
                                    ? 0
                                    : model
                                        .teamsPoints[19].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 20
                                    ? []
                                    : model.teamsPoints[19].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 20
                                    ? []
                                    : model.teamsPoints[19].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 20
                                        ? ''
                                        : model.teamsPoints[19].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 20
                                    ? ''
                                    : model.teamsPoints[19].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw21,
                                numOfPlayers: model.teamsPoints.length < 21
                                    ? 0
                                    : model.teamsPoints[20].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 21
                                    ? 0
                                    : model
                                        .teamsPoints[20].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 21
                                    ? []
                                    : model.teamsPoints[20].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 21
                                    ? []
                                    : model.teamsPoints[20].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 21
                                        ? ''
                                        : model.teamsPoints[20].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 21
                                    ? ''
                                    : model.teamsPoints[20].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw22,
                                numOfPlayers: model.teamsPoints.length < 22
                                    ? 0
                                    : model.teamsPoints[21].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 22
                                    ? 0
                                    : model
                                        .teamsPoints[21].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 22
                                    ? []
                                    : model.teamsPoints[21].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 22
                                    ? []
                                    : model.teamsPoints[21].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 22
                                        ? ''
                                        : model.teamsPoints[21].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 22
                                    ? ''
                                    : model.teamsPoints[21].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw23,
                                numOfPlayers: model.teamsPoints.length < 23
                                    ? 0
                                    : model.teamsPoints[22].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 23
                                    ? 0
                                    : model
                                        .teamsPoints[22].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 23
                                    ? []
                                    : model.teamsPoints[22].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 23
                                    ? []
                                    : model.teamsPoints[22].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 23
                                        ? ''
                                        : model.teamsPoints[22].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 23
                                    ? ''
                                    : model.teamsPoints[22].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw24,
                                numOfPlayers: model.teamsPoints.length < 24
                                    ? 0
                                    : model.teamsPoints[23].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 24
                                    ? 0
                                    : model
                                        .teamsPoints[23].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 24
                                    ? []
                                    : model.teamsPoints[23].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 24
                                    ? []
                                    : model.teamsPoints[23].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 24
                                        ? ''
                                        : model.teamsPoints[23].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 24
                                    ? ''
                                    : model.teamsPoints[23].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw25,
                                numOfPlayers: model.teamsPoints.length < 25
                                    ? 0
                                    : model.teamsPoints[24].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 25
                                    ? 0
                                    : model
                                        .teamsPoints[24].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 25
                                    ? []
                                    : model.teamsPoints[24].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 25
                                    ? []
                                    : model.teamsPoints[24].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 25
                                        ? ''
                                        : model.teamsPoints[24].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 25
                                    ? ''
                                    : model.teamsPoints[24].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw26,
                                numOfPlayers: model.teamsPoints.length < 26
                                    ? 0
                                    : model.teamsPoints[25].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 26
                                    ? 0
                                    : model
                                        .teamsPoints[25].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 26
                                    ? []
                                    : model.teamsPoints[25].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 26
                                    ? []
                                    : model.teamsPoints[25].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 26
                                        ? ''
                                        : model.teamsPoints[25].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 26
                                    ? ''
                                    : model.teamsPoints[25].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw27,
                                numOfPlayers: model.teamsPoints.length < 27
                                    ? 0
                                    : model.teamsPoints[26].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 27
                                    ? 0
                                    : model
                                        .teamsPoints[26].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 27
                                    ? []
                                    : model.teamsPoints[26].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 27
                                    ? []
                                    : model.teamsPoints[26].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 27
                                        ? ''
                                        : model.teamsPoints[26].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 27
                                    ? ''
                                    : model.teamsPoints[26].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw28,
                                numOfPlayers: model.teamsPoints.length < 28
                                    ? 0
                                    : model.teamsPoints[27].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 28
                                    ? 0
                                    : model
                                        .teamsPoints[27].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 28
                                    ? []
                                    : model.teamsPoints[27].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 28
                                    ? []
                                    : model.teamsPoints[27].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 28
                                        ? ''
                                        : model.teamsPoints[27].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 28
                                    ? ''
                                    : model.teamsPoints[27].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw29,
                                numOfPlayers: model.teamsPoints.length < 29
                                    ? 0
                                    : model.teamsPoints[28].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 29
                                    ? 0
                                    : model
                                        .teamsPoints[28].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 29
                                    ? []
                                    : model.teamsPoints[28].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 29
                                    ? []
                                    : model.teamsPoints[28].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 29
                                        ? ''
                                        : model.teamsPoints[28].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 29
                                    ? ''
                                    : model.teamsPoints[28].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw30,
                                numOfPlayers: model.teamsPoints.length < 30
                                    ? 0
                                    : model.teamsPoints[29].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 30
                                    ? 0
                                    : model
                                        .teamsPoints[29].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 30
                                    ? []
                                    : model.teamsPoints[29].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 30
                                    ? []
                                    : model.teamsPoints[29].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 30
                                        ? ''
                                        : model.teamsPoints[29].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 30
                                    ? ''
                                    : model.teamsPoints[29].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw31,
                                numOfPlayers: model.teamsPoints.length < 31
                                    ? 0
                                    : model.teamsPoints[30].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 31
                                    ? 0
                                    : model
                                        .teamsPoints[30].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 31
                                    ? []
                                    : model.teamsPoints[30].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 31
                                    ? []
                                    : model.teamsPoints[30].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 31
                                        ? ''
                                        : model.teamsPoints[30].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 31
                                    ? ''
                                    : model.teamsPoints[30].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw32,
                                numOfPlayers: model.teamsPoints.length < 32
                                    ? 0
                                    : model.teamsPoints[31].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 32
                                    ? 0
                                    : model
                                        .teamsPoints[31].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 32
                                    ? []
                                    : model.teamsPoints[31].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 32
                                    ? []
                                    : model.teamsPoints[31].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 32
                                        ? ''
                                        : model.teamsPoints[31].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 32
                                    ? ''
                                    : model.teamsPoints[31].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw33,
                                numOfPlayers: model.teamsPoints.length < 33
                                    ? 0
                                    : model.teamsPoints[32].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 33
                                    ? 0
                                    : model
                                        .teamsPoints[32].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 33
                                    ? []
                                    : model.teamsPoints[32].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 33
                                    ? []
                                    : model.teamsPoints[32].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 33
                                        ? ''
                                        : model.teamsPoints[32].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 33
                                    ? ''
                                    : model.teamsPoints[32].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw34,
                                numOfPlayers: model.teamsPoints.length < 34
                                    ? 0
                                    : model.teamsPoints[33].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 34
                                    ? 0
                                    : model
                                        .teamsPoints[33].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 34
                                    ? []
                                    : model.teamsPoints[33].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 34
                                    ? []
                                    : model.teamsPoints[33].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 34
                                        ? ''
                                        : model.teamsPoints[33].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 34
                                    ? ''
                                    : model.teamsPoints[33].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw35,
                                numOfPlayers: model.teamsPoints.length < 35
                                    ? 0
                                    : model.teamsPoints[34].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 35
                                    ? 0
                                    : model
                                        .teamsPoints[34].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 35
                                    ? []
                                    : model.teamsPoints[34].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 35
                                    ? []
                                    : model.teamsPoints[34].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 35
                                        ? ''
                                        : model.teamsPoints[34].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 35
                                    ? ''
                                    : model.teamsPoints[34].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw36,
                                numOfPlayers: model.teamsPoints.length < 36
                                    ? 0
                                    : model.teamsPoints[35].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 36
                                    ? 0
                                    : model
                                        .teamsPoints[35].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 36
                                    ? []
                                    : model.teamsPoints[35].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 36
                                    ? []
                                    : model.teamsPoints[35].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 36
                                        ? ''
                                        : model.teamsPoints[35].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 36
                                    ? ''
                                    : model.teamsPoints[35].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw37,
                                numOfPlayers: model.teamsPoints.length < 37
                                    ? 0
                                    : model.teamsPoints[36].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 37
                                    ? 0
                                    : model
                                        .teamsPoints[36].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 37
                                    ? []
                                    : model.teamsPoints[36].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 37
                                    ? []
                                    : model.teamsPoints[36].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 37
                                        ? ''
                                        : model.teamsPoints[36].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 37
                                    ? ''
                                    : model.teamsPoints[36].teamOfWeek,
                              ),
                              MatchesScreenWidget(
                                division: widget.division,
                                numOfMatches: 10,
                                teams: model.gw38,
                                numOfPlayers: model.teamsPoints.length < 38
                                    ? 0
                                    : model.teamsPoints[37].playerOfWeekName
                                        .length,
                                numOfTeams: model.teamsPoints.length < 38
                                    ? 0
                                    : model
                                        .teamsPoints[37].teamOfWeekName.length,
                                playerOfWeek: model.teamsPoints.length < 38
                                    ? []
                                    : model.teamsPoints[37].playerOfWeekName,
                                teamOfWeek: model.teamsPoints.length < 38
                                    ? []
                                    : model.teamsPoints[37].teamOfWeekName,
                                playerOfWeekPoints:
                                    model.teamsPoints.length < 38
                                        ? ''
                                        : model.teamsPoints[37].playerOfWeek,
                                teamOfWeekPoints: model.teamsPoints.length < 38
                                    ? ''
                                    : model.teamsPoints[37].teamOfWeek,
                              ),
                            ],
                          ),
                        ),
                  TextButton(
                    child: Text(
                      'Add',
                      style: SharedFonts.redFont,
                    ),
                    onPressed: () async {
                    
                      // await model.getGW22Data();
                      // await model.addPlayersData({
                      //   'teamPoints': model.totalGW22Points,
                      // });
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
