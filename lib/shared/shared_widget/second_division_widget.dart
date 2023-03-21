// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';

class SecondDivisionWidget extends StatefulWidget {
  String title;
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  Widget playOff;
  String league;
  String division;
  bool isUser;
  SecondDivisionWidget({
    Key? key,
    required this.title,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
    required this.playOff,
    required this.league,
    required this.division,
    required this.isUser,
  }) : super(key: key);

  @override
  State<SecondDivisionWidget> createState() => _SecondDivisionWidgetState();
}

class _SecondDivisionWidgetState extends State<SecondDivisionWidget> {
  int _currentBottomIndex = 0;
  int _currentTabBarIndex = 0;
  bool _isG2Done = false;
  _changeBottomTab(int index) {
    setState(() {
      _currentBottomIndex = index;
    });
  }

  _ChangeTabBar(int index) {
    setState(() {
      _currentTabBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return DefaultTabController(
          initialIndex: model.currentEvent - 1,
          length: _currentBottomIndex == 0 ? 34 : 0,
          child: Scaffold(
            backgroundColor: SharedColors.backgroundBlackColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: SharedColors.babyBlueColor),
              backgroundColor: SharedColors.backgroundGreyColor,
              title: Text(
                widget.title,
                style: SharedFonts.babyBlueFont,
              ),
              bottom: _currentBottomIndex == 0
                  ? TabBar(
                      labelStyle: SharedFonts.subBabyBlueFont,
                      unselectedLabelColor: SharedColors.greyColor,
                      labelColor: SharedColors.babyBlueColor,
                      unselectedLabelStyle: SharedFonts.greyFont,
                      isScrollable: true,
                      indicatorColor: SharedColors.subBabyBlueColor,
                      tabs: SharedLeagueD2GameWeeks.tabs,
                    )
                  : null,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme:
                  IconThemeData(color: SharedColors.unSelectedIconColor),
              unselectedItemColor: SharedColors.unSelectedIconColor,
              unselectedLabelStyle: SharedFonts.greyFont,
              iconSize: 25,
              showUnselectedLabels: true,
              fixedColor: SharedColors.babyBlueColor,
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
                    SharedImages.babyBlueMatchesIcon,
                    height: 30,
                    width: 40,
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
              playOff: widget.playOff,
              isUser: widget.isUser,
            ),
            body: GrediantBackgroundWidget(
              child: RefreshIndicator(
                onRefresh: () async {
                  if (_currentBottomIndex == 0) {
                    if (widget.league == 'G1') {
                      if (!model.isLoadingG1) {
                        await model.getTeamsGroupOneData();
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
                            await model.getTeamsDataG1();
                            await model.gameweekCreationG1();
                          } else {
                            await model.gameweekCreationG1();
                            return;
                          }
                        } else {
                          await model.getCurrentGWDataGroupOne();
                          await model.getTeamsDataG1();
                          await model.gameweekCreationG1();
                        }
                      } else {
                        null;
                      }
                    } else {
                      if (!model.isLoadingG2) {
                        await model.getTeamsGroupTwoData();
                        await model.getTeamsGroupTwoTeams();
                        if (model.isGwFinished) {
                          await model.getTeamsDataG2();
                          if (model.teamsPointsG2.length < model.currentEvent) {
                            await model.getCurrentGWDataGroupTwo();
                            await model.addPlayersDataG2({
                              'gwPoints': model.totalCurrentGWPointsG2,
                              'playerOfWeekName': model.playerOfWeekNameG2,
                              'playerOfWeek': '${model.playerOfWeekG2}',
                              'teamOfWeekName': model.teamOfWeekNameG2,
                              'teamOfWeek': '${model.teamOfWeekG2}',
                            });
                            await model.getTeamsDataG2();
                            await model.gameweekCreationG2();
                          } else {
                            await model.gameweekCreationG2();
                            return;
                          }
                        } else {
                          await model.getCurrentGWDataGroupTwo();
                          await model.getTeamsDataG2();
                          await model.gameweekCreationG2();
                        }
                      } else {
                        null;
                      }
                    }
                  } else if (_currentBottomIndex == 1) {
                    widget.league == 'G1'
                        ? await model.getTeamsGroupOneData()
                        : await model.getTeamsGroupTwoData();
                  } else {}
                },
                child: ListView(
                  children: [
                    _currentBottomIndex == 1
                        ? widget.league == 'G1'
                            ? model.isTableG1Loading
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: SharedColors.babyBlueColor,
                                      ),
                                    ],
                                  )
                                : TableWidget(
                                    numOfTeams: 18,
                                    isUser: widget.isUser,
                                    league: widget.league,
                                  )
                            : model.isTableD1Loading
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: SharedColors.babyBlueColor,
                                      ),
                                    ],
                                  )
                                : TableWidget(
                                    numOfTeams: 18,
                                    isUser: widget.isUser,
                                    league: widget.league,
                                  )
                        : widget.league == 'G1'
                            ? model.isLoadingG1
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: SharedColors.babyBlueColor,
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 100.h,
                                    child: TabBarView(
                                      children: [
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw1G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.isEmpty
                                                  ? 0
                                                  : model.teamsPointsG1[0]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.isEmpty
                                                  ? 0
                                                  : model.teamsPointsG1[0]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw1CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.isEmpty
                                                  ? []
                                                  : model.teamsPointsG1[0]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw1CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.isEmpty
                                                  ? []
                                                  : model.teamsPointsG1[0]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw1CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.isEmpty
                                                  ? ''
                                                  : model.teamsPointsG1[0]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw1CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.isEmpty
                                                  ? ''
                                                  : model.teamsPointsG1[0]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw2G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 2
                                                  ? 0
                                                  : model.teamsPointsG1[1]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 2
                                                  ? 0
                                                  : model.teamsPointsG1[1]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw2CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 2
                                                  ? []
                                                  : model.teamsPointsG1[1]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw2CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 2
                                                  ? []
                                                  : model.teamsPointsG1[1]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw2CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 2
                                                  ? ''
                                                  : model.teamsPointsG1[1]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw2CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 2
                                                  ? ''
                                                  : model.teamsPointsG1[1]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw3G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 3
                                                  ? 0
                                                  : model.teamsPointsG1[2]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 3
                                                  ? 0
                                                  : model.teamsPointsG1[2]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw3CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 3
                                                  ? []
                                                  : model.teamsPointsG1[2]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw3CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 3
                                                  ? []
                                                  : model.teamsPointsG1[2]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw3CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 3
                                                  ? ''
                                                  : model.teamsPointsG1[2]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw3CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 3
                                                  ? ''
                                                  : model.teamsPointsG1[2]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw4G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 4
                                                  ? 0
                                                  : model.teamsPointsG1[3]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 4
                                                  ? 0
                                                  : model.teamsPointsG1[3]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw4CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 4
                                                  ? []
                                                  : model.teamsPointsG1[3]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw4CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 4
                                                  ? []
                                                  : model.teamsPointsG1[3]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw4CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 4
                                                  ? ''
                                                  : model.teamsPointsG1[3]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw4CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 4
                                                  ? ''
                                                  : model.teamsPointsG1[3]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw5G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 5
                                                  ? 0
                                                  : model.teamsPointsG1[4]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 5
                                                  ? 0
                                                  : model.teamsPointsG1[4]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw5CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 5
                                                  ? []
                                                  : model.teamsPointsG1[4]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw5CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 5
                                                  ? []
                                                  : model.teamsPointsG1[4]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw5CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 5
                                                  ? ''
                                                  : model.teamsPointsG1[4]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw5CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 5
                                                  ? ''
                                                  : model.teamsPointsG1[4]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw6G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 6
                                                  ? 0
                                                  : model.teamsPointsG1[5]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 6
                                                  ? 0
                                                  : model.teamsPointsG1[5]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw6CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 6
                                                  ? []
                                                  : model.teamsPointsG1[5]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw6CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 6
                                                  ? []
                                                  : model.teamsPointsG1[5]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw6CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 6
                                                  ? ''
                                                  : model.teamsPointsG1[5]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw6CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 6
                                                  ? ''
                                                  : model.teamsPointsG1[5]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw7G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 19
                                                  ? 0
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 19
                                                  ? 0
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw7CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 19
                                                  ? []
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw7CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 19
                                                  ? []
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw7CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 19
                                                  ? ''
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw7CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 19
                                                  ? ''
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw8G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 8
                                                  ? 0
                                                  : model.teamsPointsG1[7]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 8
                                                  ? 0
                                                  : model.teamsPointsG1[7]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw8CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 8
                                                  ? []
                                                  : model.teamsPointsG1[7]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw8CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 8
                                                  ? []
                                                  : model.teamsPointsG1[7]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw8CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 8
                                                  ? ''
                                                  : model.teamsPointsG1[7]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw8CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 8
                                                  ? ''
                                                  : model.teamsPointsG1[7]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw9G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 9
                                                  ? 0
                                                  : model.teamsPointsG1[8]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 9
                                                  ? 0
                                                  : model.teamsPointsG1[8]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw9CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 9
                                                  ? []
                                                  : model.teamsPointsG1[8]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw9CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 9
                                                  ? []
                                                  : model.teamsPointsG1[8]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw9CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 9
                                                  ? ''
                                                  : model.teamsPointsG1[8]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw9CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 9
                                                  ? ''
                                                  : model.teamsPointsG1[8]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw10G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 10
                                                  ? 0
                                                  : model.teamsPointsG1[9]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 10
                                                  ? 0
                                                  : model.teamsPointsG1[9]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw10CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 10
                                                  ? []
                                                  : model.teamsPointsG1[9]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw10CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 10
                                                  ? []
                                                  : model.teamsPointsG1[9]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw10CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 10
                                                  ? ''
                                                  : model.teamsPointsG1[9]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw10CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 10
                                                  ? ''
                                                  : model.teamsPointsG1[9]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw11G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 11
                                                  ? 0
                                                  : model.teamsPointsG1[10]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 11
                                                  ? 0
                                                  : model.teamsPointsG1[10]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw11CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 11
                                                  ? []
                                                  : model.teamsPointsG1[10]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw11CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 11
                                                  ? []
                                                  : model.teamsPointsG1[10]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw11CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 11
                                                  ? ''
                                                  : model.teamsPointsG1[10]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw11CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 11
                                                  ? ''
                                                  : model.teamsPointsG1[10]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw12G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 12
                                                  ? 0
                                                  : model.teamsPointsG1[11]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 12
                                                  ? 0
                                                  : model.teamsPointsG1[11]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw12CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 12
                                                  ? []
                                                  : model.teamsPointsG1[11]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw12CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 12
                                                  ? []
                                                  : model.teamsPointsG1[11]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw12CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 12
                                                  ? ''
                                                  : model.teamsPointsG1[11]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw12CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 12
                                                  ? ''
                                                  : model.teamsPointsG1[11]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw13G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 13
                                                  ? 0
                                                  : model.teamsPointsG1[12]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 13
                                                  ? 0
                                                  : model.teamsPointsG1[12]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw13CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 13
                                                  ? []
                                                  : model.teamsPointsG1[12]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw13CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 13
                                                  ? []
                                                  : model.teamsPointsG1[12]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw13CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 13
                                                  ? ''
                                                  : model.teamsPointsG1[12]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw13CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 13
                                                  ? ''
                                                  : model.teamsPointsG1[12]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw14G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 14
                                                  ? 0
                                                  : model.teamsPointsG1[13]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 14
                                                  ? 0
                                                  : model.teamsPointsG1[13]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw14CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 14
                                                  ? []
                                                  : model.teamsPointsG1[13]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw14CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 14
                                                  ? []
                                                  : model.teamsPointsG1[13]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw14CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 14
                                                  ? ''
                                                  : model.teamsPointsG1[13]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw14CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 14
                                                  ? ''
                                                  : model.teamsPointsG1[13]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw15G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 15
                                                  ? 0
                                                  : model.teamsPointsG1[14]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 15
                                                  ? 0
                                                  : model.teamsPointsG1[14]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw15CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 15
                                                  ? []
                                                  : model.teamsPointsG1[14]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw15CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 15
                                                  ? []
                                                  : model.teamsPointsG1[14]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw15CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 15
                                                  ? ''
                                                  : model.teamsPointsG1[14]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw15CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 15
                                                  ? ''
                                                  : model.teamsPointsG1[14]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw16G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 16
                                                  ? 0
                                                  : model.teamsPointsG1[15]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 16
                                                  ? 0
                                                  : model.teamsPointsG1[15]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw16CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 16
                                                  ? []
                                                  : model.teamsPointsG1[15]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw16CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 16
                                                  ? []
                                                  : model.teamsPointsG1[15]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw16CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 16
                                                  ? ''
                                                  : model.teamsPointsG1[15]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw16CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 16
                                                  ? ''
                                                  : model.teamsPointsG1[15]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw17G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 17
                                                  ? 0
                                                  : model.teamsPointsG1[16]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 17
                                                  ? 0
                                                  : model.teamsPointsG1[16]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw17CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 17
                                                  ? []
                                                  : model.teamsPointsG1[16]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw17CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 17
                                                  ? []
                                                  : model.teamsPointsG1[16]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw17CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 17
                                                  ? ''
                                                  : model.teamsPointsG1[16]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw17CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 17
                                                  ? ''
                                                  : model.teamsPointsG1[16]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw18G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 18
                                                  ? 0
                                                  : model.teamsPointsG1[17]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 18
                                                  ? 0
                                                  : model.teamsPointsG1[17]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw18CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 18
                                                  ? []
                                                  : model.teamsPointsG1[17]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw18CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 18
                                                  ? []
                                                  : model.teamsPointsG1[17]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw18CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 18
                                                  ? ''
                                                  : model.teamsPointsG1[17]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw18CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 18
                                                  ? ''
                                                  : model.teamsPointsG1[17]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw19G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 19
                                                  ? 0
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 19
                                                  ? 0
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw19CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 19
                                                  ? []
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw19CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 19
                                                  ? []
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw19CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 19
                                                  ? ''
                                                  : model.teamsPointsG1[18]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw19CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 19
                                                  ? ''
                                                  : model.teamsPointsG1[18]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw20G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 20
                                                  ? 0
                                                  : model.teamsPointsG1[19]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 20
                                                  ? 0
                                                  : model.teamsPointsG1[19]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw20CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 20
                                                  ? []
                                                  : model.teamsPointsG1[19]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw20CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 20
                                                  ? []
                                                  : model.teamsPointsG1[19]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw20CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 20
                                                  ? ''
                                                  : model.teamsPointsG1[19]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw20CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 20
                                                  ? ''
                                                  : model.teamsPointsG1[19]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw21G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 21
                                                  ? 0
                                                  : model.teamsPointsG1[20]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 21
                                                  ? 0
                                                  : model.teamsPointsG1[20]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw21CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 21
                                                  ? []
                                                  : model.teamsPointsG1[20]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw21CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 21
                                                  ? []
                                                  : model.teamsPointsG1[20]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw21CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 21
                                                  ? ''
                                                  : model.teamsPointsG1[20]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw21CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 21
                                                  ? ''
                                                  : model.teamsPointsG1[20]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw22G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 22
                                                  ? 0
                                                  : model.teamsPointsG1[21]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 22
                                                  ? 0
                                                  : model.teamsPointsG1[21]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw22CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 22
                                                  ? []
                                                  : model.teamsPointsG1[21]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw22CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 22
                                                  ? []
                                                  : model.teamsPointsG1[21]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw22CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 22
                                                  ? ''
                                                  : model.teamsPointsG1[21]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw22CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 22
                                                  ? ''
                                                  : model.teamsPointsG1[21]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw23G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 23
                                                  ? 0
                                                  : model.teamsPointsG1[22]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 23
                                                  ? 0
                                                  : model.teamsPointsG1[22]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw23CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 23
                                                  ? []
                                                  : model.teamsPointsG1[22]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw23CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 23
                                                  ? []
                                                  : model.teamsPointsG1[22]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw23CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 23
                                                  ? ''
                                                  : model.teamsPointsG1[22]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw23CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 23
                                                  ? ''
                                                  : model.teamsPointsG1[22]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw24G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 24
                                                  ? 0
                                                  : model.teamsPointsG1[23]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 24
                                                  ? 0
                                                  : model.teamsPointsG1[23]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw24CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 24
                                                  ? []
                                                  : model.teamsPointsG1[23]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw24CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 24
                                                  ? []
                                                  : model.teamsPointsG1[23]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw24CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 24
                                                  ? ''
                                                  : model.teamsPointsG1[23]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw24CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 24
                                                  ? ''
                                                  : model.teamsPointsG1[23]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw25G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 25
                                                  ? 0
                                                  : model.teamsPointsG1[24]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 25
                                                  ? 0
                                                  : model.teamsPointsG1[24]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw25CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 25
                                                  ? []
                                                  : model.teamsPointsG1[24]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw25CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 25
                                                  ? []
                                                  : model.teamsPointsG1[24]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw25CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 25
                                                  ? ''
                                                  : model.teamsPointsG1[24]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw25CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 25
                                                  ? ''
                                                  : model.teamsPointsG1[24]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw26G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 26
                                                  ? 0
                                                  : model.teamsPointsG1[25]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 26
                                                  ? 0
                                                  : model.teamsPointsG1[25]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw26CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 26
                                                  ? []
                                                  : model.teamsPointsG1[25]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw26CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 26
                                                  ? []
                                                  : model.teamsPointsG1[25]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw26CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 26
                                                  ? ''
                                                  : model.teamsPointsG1[25]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw26CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 26
                                                  ? ''
                                                  : model.teamsPointsG1[25]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw27G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 27
                                                  ? 0
                                                  : model.teamsPointsG1[26]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 27
                                                  ? 0
                                                  : model.teamsPointsG1[26]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw27CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 27
                                                  ? []
                                                  : model.teamsPointsG1[26]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw27CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 27
                                                  ? []
                                                  : model.teamsPointsG1[26]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw27CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 27
                                                  ? ''
                                                  : model.teamsPointsG1[26]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw27CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 27
                                                  ? ''
                                                  : model.teamsPointsG1[26]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw28G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 28
                                                  ? 0
                                                  : model.teamsPointsG1[27]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 28
                                                  ? 0
                                                  : model.teamsPointsG1[27]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw28CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 28
                                                  ? []
                                                  : model.teamsPointsG1[27]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw28CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 28
                                                  ? []
                                                  : model.teamsPointsG1[27]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw28CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 28
                                                  ? ''
                                                  : model.teamsPointsG1[27]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw28CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 28
                                                  ? ''
                                                  : model.teamsPointsG1[27]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw29G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 29
                                                  ? 0
                                                  : model.teamsPointsG1[28]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 29
                                                  ? 0
                                                  : model.teamsPointsG1[28]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw29CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 29
                                                  ? []
                                                  : model.teamsPointsG1[28]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw29CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 29
                                                  ? []
                                                  : model.teamsPointsG1[28]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw29CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 29
                                                  ? ''
                                                  : model.teamsPointsG1[28]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw29CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 29
                                                  ? ''
                                                  : model.teamsPointsG1[28]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw30G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 30
                                                  ? 0
                                                  : model.teamsPointsG1[29]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 30
                                                  ? 0
                                                  : model.teamsPointsG1[29]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw30CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 30
                                                  ? []
                                                  : model.teamsPointsG1[29]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw30CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 30
                                                  ? []
                                                  : model.teamsPointsG1[29]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw30CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 30
                                                  ? ''
                                                  : model.teamsPointsG1[29]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw30CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 30
                                                  ? ''
                                                  : model.teamsPointsG1[29]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw31G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 31
                                                  ? 0
                                                  : model.teamsPointsG1[30]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 31
                                                  ? 0
                                                  : model.teamsPointsG1[30]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw31CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 31
                                                  ? []
                                                  : model.teamsPointsG1[30]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw31CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 31
                                                  ? []
                                                  : model.teamsPointsG1[30]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw31CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 31
                                                  ? ''
                                                  : model.teamsPointsG1[30]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw31CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 31
                                                  ? ''
                                                  : model.teamsPointsG1[30]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw32G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 32
                                                  ? 0
                                                  : model.teamsPointsG1[31]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 32
                                                  ? 0
                                                  : model.teamsPointsG1[31]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw32CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 32
                                                  ? []
                                                  : model.teamsPointsG1[31]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw32CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 32
                                                  ? []
                                                  : model.teamsPointsG1[31]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw32CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 32
                                                  ? ''
                                                  : model.teamsPointsG1[31]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw32CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 32
                                                  ? ''
                                                  : model.teamsPointsG1[31]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw33G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 33
                                                  ? 0
                                                  : model.teamsPointsG1[32]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 33
                                                  ? 0
                                                  : model.teamsPointsG1[32]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw33CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 33
                                                  ? []
                                                  : model.teamsPointsG1[32]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw33CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 33
                                                  ? []
                                                  : model.teamsPointsG1[32]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw33CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 33
                                                  ? ''
                                                  : model.teamsPointsG1[32]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw33CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 33
                                                  ? ''
                                                  : model.teamsPointsG1[32]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw34G1,
                                          numOfPlayers:
                                              model.teamsPointsG1.length < 34
                                                  ? 0
                                                  : model.teamsPointsG1[33]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG1.length < 34
                                                  ? 0
                                                  : model.teamsPointsG1[33]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw34CurrentG1
                                              ? model.playerOfWeekNameG1
                                              : model.teamsPointsG1.length < 34
                                                  ? []
                                                  : model.teamsPointsG1[33]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw34CurrentG1
                                              ? model.teamOfWeekNameG1
                                              : model.teamsPointsG1.length < 34
                                                  ? []
                                                  : model.teamsPointsG1[33]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw34CurrentG1
                                              ? '${model.playerOfWeekG1}'
                                              : model.teamsPointsG1.length < 34
                                                  ? ''
                                                  : model.teamsPointsG1[33]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw34CurrentG1
                                              ? '${model.teamOfWeekG1}'
                                              : model.teamsPointsG1.length < 34
                                                  ? ''
                                                  : model.teamsPointsG1[33]
                                                      .teamOfWeek,
                                        ),
                                      ],
                                    ),
                                  )
                            : model.isLoadingG2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: SharedColors.babyBlueColor,
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: TabBarView(
                                      children: [
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw1G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.isEmpty
                                                  ? 0
                                                  : model.teamsPointsG2[0]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.isEmpty
                                                  ? 0
                                                  : model.teamsPointsG2[0]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw1CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.isEmpty
                                                  ? []
                                                  : model.teamsPointsG2[0]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw1CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.isEmpty
                                                  ? []
                                                  : model.teamsPointsG2[0]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw1CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.isEmpty
                                                  ? ''
                                                  : model.teamsPointsG2[0]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw1CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.isEmpty
                                                  ? ''
                                                  : model.teamsPointsG2[0]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw2G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 2
                                                  ? 0
                                                  : model.teamsPointsG2[1]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 2
                                                  ? 0
                                                  : model.teamsPointsG2[1]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw2CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 2
                                                  ? []
                                                  : model.teamsPointsG2[1]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw2CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 2
                                                  ? []
                                                  : model.teamsPointsG2[1]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw2CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 2
                                                  ? ''
                                                  : model.teamsPointsG2[1]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw2CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 2
                                                  ? ''
                                                  : model.teamsPointsG2[1]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw3G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 3
                                                  ? 0
                                                  : model.teamsPointsG2[2]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 3
                                                  ? 0
                                                  : model.teamsPointsG2[2]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw3CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 3
                                                  ? []
                                                  : model.teamsPointsG2[2]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw3CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 3
                                                  ? []
                                                  : model.teamsPointsG2[2]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw3CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 3
                                                  ? ''
                                                  : model.teamsPointsG2[2]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw3CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 3
                                                  ? ''
                                                  : model.teamsPointsG2[2]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw4G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 4
                                                  ? 0
                                                  : model.teamsPointsG2[3]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 4
                                                  ? 0
                                                  : model.teamsPointsG2[3]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw4CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 4
                                                  ? []
                                                  : model.teamsPointsG2[3]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw4CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 4
                                                  ? []
                                                  : model.teamsPointsG2[3]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw4CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 4
                                                  ? ''
                                                  : model.teamsPointsG2[3]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw4CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 4
                                                  ? ''
                                                  : model.teamsPointsG2[3]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw5G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 5
                                                  ? 0
                                                  : model.teamsPointsG2[4]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 5
                                                  ? 0
                                                  : model.teamsPointsG2[4]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw5CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 5
                                                  ? []
                                                  : model.teamsPointsG2[4]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw5CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 5
                                                  ? []
                                                  : model.teamsPointsG2[4]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw5CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 5
                                                  ? ''
                                                  : model.teamsPointsG2[4]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw5CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 5
                                                  ? ''
                                                  : model.teamsPointsG2[4]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw6G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 6
                                                  ? 0
                                                  : model.teamsPointsG2[5]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 6
                                                  ? 0
                                                  : model.teamsPointsG2[5]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw6CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 6
                                                  ? []
                                                  : model.teamsPointsG2[5]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw6CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 6
                                                  ? []
                                                  : model.teamsPointsG2[5]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw6CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 6
                                                  ? ''
                                                  : model.teamsPointsG2[5]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw6CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 6
                                                  ? ''
                                                  : model.teamsPointsG2[5]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw7G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 19
                                                  ? 0
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 19
                                                  ? 0
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw7CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 19
                                                  ? []
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw7CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 19
                                                  ? []
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw7CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 19
                                                  ? ''
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw7CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 19
                                                  ? ''
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw8G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 8
                                                  ? 0
                                                  : model.teamsPointsG2[7]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 8
                                                  ? 0
                                                  : model.teamsPointsG2[7]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw8CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 8
                                                  ? []
                                                  : model.teamsPointsG2[7]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw8CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 8
                                                  ? []
                                                  : model.teamsPointsG2[7]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw8CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 8
                                                  ? ''
                                                  : model.teamsPointsG2[7]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw8CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 8
                                                  ? ''
                                                  : model.teamsPointsG2[7]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw9G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 9
                                                  ? 0
                                                  : model.teamsPointsG2[8]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 9
                                                  ? 0
                                                  : model.teamsPointsG2[8]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw9CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 9
                                                  ? []
                                                  : model.teamsPointsG2[8]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw9CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 9
                                                  ? []
                                                  : model.teamsPointsG2[8]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model.gw9CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 9
                                                  ? ''
                                                  : model.teamsPointsG2[8]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw9CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 9
                                                  ? ''
                                                  : model.teamsPointsG2[8]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw10G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 10
                                                  ? 0
                                                  : model.teamsPointsG2[9]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 10
                                                  ? 0
                                                  : model.teamsPointsG2[9]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw10CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 10
                                                  ? []
                                                  : model.teamsPointsG2[9]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw10CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 10
                                                  ? []
                                                  : model.teamsPointsG2[9]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw10CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 10
                                                  ? ''
                                                  : model.teamsPointsG2[9]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw10CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 10
                                                  ? ''
                                                  : model.teamsPointsG2[9]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw11G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 11
                                                  ? 0
                                                  : model.teamsPointsG2[10]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 11
                                                  ? 0
                                                  : model.teamsPointsG2[10]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw11CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 11
                                                  ? []
                                                  : model.teamsPointsG2[10]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw11CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 11
                                                  ? []
                                                  : model.teamsPointsG2[10]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw11CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 11
                                                  ? ''
                                                  : model.teamsPointsG2[10]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw11CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 11
                                                  ? ''
                                                  : model.teamsPointsG2[10]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw12G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 12
                                                  ? 0
                                                  : model.teamsPointsG2[11]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 12
                                                  ? 0
                                                  : model.teamsPointsG2[11]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw12CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 12
                                                  ? []
                                                  : model.teamsPointsG2[11]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw12CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 12
                                                  ? []
                                                  : model.teamsPointsG2[11]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw12CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 12
                                                  ? ''
                                                  : model.teamsPointsG2[11]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw12CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 12
                                                  ? ''
                                                  : model.teamsPointsG2[11]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw13G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 13
                                                  ? 0
                                                  : model.teamsPointsG2[12]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 13
                                                  ? 0
                                                  : model.teamsPointsG2[12]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw13CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 13
                                                  ? []
                                                  : model.teamsPointsG2[12]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw13CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 13
                                                  ? []
                                                  : model.teamsPointsG2[12]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw13CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 13
                                                  ? ''
                                                  : model.teamsPointsG2[12]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw13CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 13
                                                  ? ''
                                                  : model.teamsPointsG2[12]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw14G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 14
                                                  ? 0
                                                  : model.teamsPointsG2[13]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 14
                                                  ? 0
                                                  : model.teamsPointsG2[13]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw14CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 14
                                                  ? []
                                                  : model.teamsPointsG2[13]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw14CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 14
                                                  ? []
                                                  : model.teamsPointsG2[13]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw14CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 14
                                                  ? ''
                                                  : model.teamsPointsG2[13]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw14CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 14
                                                  ? ''
                                                  : model.teamsPointsG2[13]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw15G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 15
                                                  ? 0
                                                  : model.teamsPointsG2[14]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 15
                                                  ? 0
                                                  : model.teamsPointsG2[14]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw15CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 15
                                                  ? []
                                                  : model.teamsPointsG2[14]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw15CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 15
                                                  ? []
                                                  : model.teamsPointsG2[14]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw15CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 15
                                                  ? ''
                                                  : model.teamsPointsG2[14]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw15CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 15
                                                  ? ''
                                                  : model.teamsPointsG2[14]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw16G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 16
                                                  ? 0
                                                  : model.teamsPointsG2[15]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 16
                                                  ? 0
                                                  : model.teamsPointsG2[15]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw16CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 16
                                                  ? []
                                                  : model.teamsPointsG2[15]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw16CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 16
                                                  ? []
                                                  : model.teamsPointsG2[15]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw16CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 16
                                                  ? ''
                                                  : model.teamsPointsG2[15]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw16CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 16
                                                  ? ''
                                                  : model.teamsPointsG2[15]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw17G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 17
                                                  ? 0
                                                  : model.teamsPointsG2[16]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 17
                                                  ? 0
                                                  : model.teamsPointsG2[16]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw17CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 17
                                                  ? []
                                                  : model.teamsPointsG2[16]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw17CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 17
                                                  ? []
                                                  : model.teamsPointsG2[16]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw17CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 17
                                                  ? ''
                                                  : model.teamsPointsG2[16]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw17CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 17
                                                  ? ''
                                                  : model.teamsPointsG2[16]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw18G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 18
                                                  ? 0
                                                  : model.teamsPointsG2[17]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 18
                                                  ? 0
                                                  : model.teamsPointsG2[17]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw18CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 18
                                                  ? []
                                                  : model.teamsPointsG2[17]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw18CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 18
                                                  ? []
                                                  : model.teamsPointsG2[17]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw18CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 18
                                                  ? ''
                                                  : model.teamsPointsG2[17]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw18CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 18
                                                  ? ''
                                                  : model.teamsPointsG2[17]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw19G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 19
                                                  ? 0
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 19
                                                  ? 0
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw19CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 19
                                                  ? []
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw19CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 19
                                                  ? []
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw19CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 19
                                                  ? ''
                                                  : model.teamsPointsG2[18]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw19CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 19
                                                  ? ''
                                                  : model.teamsPointsG2[18]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw20G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 20
                                                  ? 0
                                                  : model.teamsPointsG2[19]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 20
                                                  ? 0
                                                  : model.teamsPointsG2[19]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw20CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 20
                                                  ? []
                                                  : model.teamsPointsG2[19]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw20CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 20
                                                  ? []
                                                  : model.teamsPointsG2[19]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw20CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 20
                                                  ? ''
                                                  : model.teamsPointsG2[19]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw20CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 20
                                                  ? ''
                                                  : model.teamsPointsG2[19]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw21G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 21
                                                  ? 0
                                                  : model.teamsPointsG2[20]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 21
                                                  ? 0
                                                  : model.teamsPointsG2[20]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw21CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 21
                                                  ? []
                                                  : model.teamsPointsG2[20]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw21CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 21
                                                  ? []
                                                  : model.teamsPointsG2[20]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw21CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 21
                                                  ? ''
                                                  : model.teamsPointsG2[20]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw21CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 21
                                                  ? ''
                                                  : model.teamsPointsG2[20]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw22G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 22
                                                  ? 0
                                                  : model.teamsPointsG2[21]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 22
                                                  ? 0
                                                  : model.teamsPointsG2[21]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw22CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 22
                                                  ? []
                                                  : model.teamsPointsG2[21]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw22CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 22
                                                  ? []
                                                  : model.teamsPointsG2[21]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw22CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 22
                                                  ? ''
                                                  : model.teamsPointsG2[21]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw22CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 22
                                                  ? ''
                                                  : model.teamsPointsG2[21]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw23G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 23
                                                  ? 0
                                                  : model.teamsPointsG2[22]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 23
                                                  ? 0
                                                  : model.teamsPointsG2[22]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw23CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 23
                                                  ? []
                                                  : model.teamsPointsG2[22]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw23CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 23
                                                  ? []
                                                  : model.teamsPointsG2[22]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw23CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 23
                                                  ? ''
                                                  : model.teamsPointsG2[22]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw23CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 23
                                                  ? ''
                                                  : model.teamsPointsG2[22]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw24G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 24
                                                  ? 0
                                                  : model.teamsPointsG2[23]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 24
                                                  ? 0
                                                  : model.teamsPointsG2[23]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw24CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 24
                                                  ? []
                                                  : model.teamsPointsG2[23]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw24CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 24
                                                  ? []
                                                  : model.teamsPointsG2[23]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw24CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 24
                                                  ? ''
                                                  : model.teamsPointsG2[23]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw24CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 24
                                                  ? ''
                                                  : model.teamsPointsG2[23]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw25G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 25
                                                  ? 0
                                                  : model.teamsPointsG2[24]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 25
                                                  ? 0
                                                  : model.teamsPointsG2[24]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw25CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 25
                                                  ? []
                                                  : model.teamsPointsG2[24]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw25CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 25
                                                  ? []
                                                  : model.teamsPointsG2[24]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw25CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 25
                                                  ? ''
                                                  : model.teamsPointsG2[24]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw25CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 25
                                                  ? ''
                                                  : model.teamsPointsG2[24]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw26G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 26
                                                  ? 0
                                                  : model.teamsPointsG2[25]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 26
                                                  ? 0
                                                  : model.teamsPointsG2[25]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw26CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 26
                                                  ? []
                                                  : model.teamsPointsG2[25]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw26CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 26
                                                  ? []
                                                  : model.teamsPointsG2[25]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw26CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 26
                                                  ? ''
                                                  : model.teamsPointsG2[25]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw26CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 26
                                                  ? ''
                                                  : model.teamsPointsG2[25]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw27G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 27
                                                  ? 0
                                                  : model.teamsPointsG2[26]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 27
                                                  ? 0
                                                  : model.teamsPointsG2[26]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw27CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 27
                                                  ? []
                                                  : model.teamsPointsG2[26]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw27CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 27
                                                  ? []
                                                  : model.teamsPointsG2[26]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw27CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 27
                                                  ? ''
                                                  : model.teamsPointsG2[26]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw27CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 27
                                                  ? ''
                                                  : model.teamsPointsG2[26]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw28G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 28
                                                  ? 0
                                                  : model.teamsPointsG2[27]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 28
                                                  ? 0
                                                  : model.teamsPointsG2[27]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw28CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 28
                                                  ? []
                                                  : model.teamsPointsG2[27]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw28CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 28
                                                  ? []
                                                  : model.teamsPointsG2[27]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw28CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 28
                                                  ? ''
                                                  : model.teamsPointsG2[27]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw28CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 28
                                                  ? ''
                                                  : model.teamsPointsG2[27]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw29G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 29
                                                  ? 0
                                                  : model.teamsPointsG2[28]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 29
                                                  ? 0
                                                  : model.teamsPointsG2[28]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw29CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 29
                                                  ? []
                                                  : model.teamsPointsG2[28]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw29CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 29
                                                  ? []
                                                  : model.teamsPointsG2[28]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw29CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 29
                                                  ? ''
                                                  : model.teamsPointsG2[28]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw29CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 29
                                                  ? ''
                                                  : model.teamsPointsG2[28]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw30G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 30
                                                  ? 0
                                                  : model.teamsPointsG2[29]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 30
                                                  ? 0
                                                  : model.teamsPointsG2[29]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw30CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 30
                                                  ? []
                                                  : model.teamsPointsG2[29]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw30CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 30
                                                  ? []
                                                  : model.teamsPointsG2[29]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw30CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 30
                                                  ? ''
                                                  : model.teamsPointsG2[29]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw30CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 30
                                                  ? ''
                                                  : model.teamsPointsG2[29]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw31G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 31
                                                  ? 0
                                                  : model.teamsPointsG2[30]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 31
                                                  ? 0
                                                  : model.teamsPointsG2[30]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw31CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 31
                                                  ? []
                                                  : model.teamsPointsG2[30]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw31CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 31
                                                  ? []
                                                  : model.teamsPointsG2[30]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw31CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 31
                                                  ? ''
                                                  : model.teamsPointsG2[30]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw31CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 31
                                                  ? ''
                                                  : model.teamsPointsG2[30]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw32G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 32
                                                  ? 0
                                                  : model.teamsPointsG2[31]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 32
                                                  ? 0
                                                  : model.teamsPointsG2[31]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw32CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 32
                                                  ? []
                                                  : model.teamsPointsG2[31]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw32CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 32
                                                  ? []
                                                  : model.teamsPointsG2[31]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw32CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 32
                                                  ? ''
                                                  : model.teamsPointsG2[31]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw32CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 32
                                                  ? ''
                                                  : model.teamsPointsG2[31]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw33G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 33
                                                  ? 0
                                                  : model.teamsPointsG2[32]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 33
                                                  ? 0
                                                  : model.teamsPointsG2[32]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw33CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 33
                                                  ? []
                                                  : model.teamsPointsG2[32]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw33CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 33
                                                  ? []
                                                  : model.teamsPointsG2[32]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw33CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 33
                                                  ? ''
                                                  : model.teamsPointsG2[32]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw33CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 33
                                                  ? ''
                                                  : model.teamsPointsG2[32]
                                                      .teamOfWeek,
                                        ),
                                        MatchesScreenWidget(
                                          division: widget.division,
                                          numOfMatches: 9,
                                          teams: model.gw34G2,
                                          numOfPlayers:
                                              model.teamsPointsG2.length < 34
                                                  ? 0
                                                  : model.teamsPointsG2[33]
                                                      .playerOfWeekName.length,
                                          numOfTeams:
                                              model.teamsPointsG2.length < 34
                                                  ? 0
                                                  : model.teamsPointsG2[33]
                                                      .teamOfWeekName.length,
                                          playerOfWeek: model.gw34CurrentG2
                                              ? model.playerOfWeekNameG2
                                              : model.teamsPointsG2.length < 34
                                                  ? []
                                                  : model.teamsPointsG2[33]
                                                      .playerOfWeekName,
                                          teamOfWeek: model.gw34CurrentG2
                                              ? model.teamOfWeekNameG2
                                              : model.teamsPointsG2.length < 34
                                                  ? []
                                                  : model.teamsPointsG2[33]
                                                      .teamOfWeekName,
                                          playerOfWeekPoints: model
                                                  .gw34CurrentG2
                                              ? '${model.playerOfWeekG2}'
                                              : model.teamsPointsG2.length < 34
                                                  ? ''
                                                  : model.teamsPointsG2[33]
                                                      .playerOfWeek,
                                          teamOfWeekPoints: model.gw34CurrentG2
                                              ? '${model.teamOfWeekG2}'
                                              : model.teamsPointsG2.length < 34
                                                  ? ''
                                                  : model.teamsPointsG2[33]
                                                      .teamOfWeek,
                                        ),
                                      ],
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
