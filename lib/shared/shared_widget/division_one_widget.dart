// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:async/async.dart';
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';

class DivisionOneWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  Widget playOff;
  String league;
  String division;
  bool isUser;
  DivisionOneWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
    required this.playOff,
    required this.league,
    required this.division,
    required this.isUser,
  }) : super(key: key);

  @override
  State<DivisionOneWidget> createState() => _DivisionOneWidgetState();
}

class _DivisionOneWidgetState extends State<DivisionOneWidget> {
  CancelableOperation? _myCancelableFuture;
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
          initialIndex: model.currentEvent - 1,
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
                      unselectedLabelStyle: SharedFonts.greyFont,
                      isScrollable: true,
                      indicatorColor: SharedColors.subYellowColor,
                      tabs: SharedLeagueD1GameWeeks.tabs,
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
              playOff: widget.playOff,
              isUser: widget.isUser,
            ),
            body: GrediantBackgroundWidget(
              child: RefreshIndicator(
                onRefresh: model.isLoadingD1
                    ? () async {}
                    : () async {
                        if (_currentBottomIndex == 0) {
                          await model.getTeamsDivOneData();
                          await model.getTeamsDivOneTeams();
                          if (model.isGwFinished) {
                            await model.getTeamsDataD1();
                            if (model.teamsPointsD1.length <
                                model.currentEvent) {
                              await model.getCurrentGWDataDevOne();
                              await model.addPlayersDataD1({
                                'gwPoints': model.totalCurrentGWPointsD1,
                                'playerOfWeekName': model.playerOfWeekNameD1,
                                'playerOfWeek': '${model.playerOfWeekD1}',
                                'teamOfWeekName': model.teamOfWeekNameD1,
                                'teamOfWeek': '${model.teamOfWeekD1}',
                              });
                              await model.getTeamsDataD1();
                              await model.gameweekCreationD1();
                            } else {
                              await model.gameweekCreationD1();
                              model.setLoadD1 = false;
                              return;
                            }
                          } else {
                            await model.getCurrentGWDataDevOne();
                            await model.getTeamsDataD1();
                            await model.gameweekCreationD1();
                          }
                        } else {
                          await model.getTeamsDivOneData();
                        }
                      },
                child: ListView(
                  children: [
                    _currentBottomIndex == 1
                        ? model.isTableD1Loading
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: SharedColors.yellowColor,
                                  ),
                                ],
                              )
                            : TableWidget(
                                numOfTeams: 20,
                                isUser: widget.isUser,
                                league: widget.league,
                              )
                        : model.isLoadingD1
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: SharedColors.yellowColor,
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: TabBarView(
                                  children: <Widget>[
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw1D1,
                                      numOfPlayers: model.teamsPointsD1.isEmpty
                                          ? 0
                                          : model.teamsPointsD1[0]
                                              .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.isEmpty
                                          ? 0
                                          : model.teamsPointsD1[0]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw1CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.isEmpty
                                              ? []
                                              : model.teamsPointsD1[0]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw1CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.isEmpty
                                              ? []
                                              : model.teamsPointsD1[0]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw1CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.isEmpty
                                              ? ''
                                              : model.teamsPointsD1[0]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw1CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.isEmpty
                                              ? ''
                                              : model
                                                  .teamsPointsD1[0].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw2D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 2
                                              ? 0
                                              : model.teamsPointsD1[1]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 2
                                          ? 0
                                          : model.teamsPointsD1[1]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw2CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 2
                                              ? []
                                              : model.teamsPointsD1[1]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw2CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 2
                                              ? []
                                              : model.teamsPointsD1[1]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw2CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 2
                                              ? ''
                                              : model.teamsPointsD1[1]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw2CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 2
                                              ? ''
                                              : model
                                                  .teamsPointsD1[1].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw3D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 3
                                              ? 0
                                              : model.teamsPointsD1[2]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 3
                                          ? 0
                                          : model.teamsPointsD1[2]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw3CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 3
                                              ? []
                                              : model.teamsPointsD1[2]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw3CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 3
                                              ? []
                                              : model.teamsPointsD1[2]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw3CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 3
                                              ? ''
                                              : model.teamsPointsD1[2]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw3CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 3
                                              ? ''
                                              : model
                                                  .teamsPointsD1[2].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw4D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 4
                                              ? 0
                                              : model.teamsPointsD1[3]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 4
                                          ? 0
                                          : model.teamsPointsD1[3]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw4CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 4
                                              ? []
                                              : model.teamsPointsD1[3]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw4CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 4
                                              ? []
                                              : model.teamsPointsD1[3]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw4CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 4
                                              ? ''
                                              : model.teamsPointsD1[3]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw4CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 4
                                              ? ''
                                              : model
                                                  .teamsPointsD1[3].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw5D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 5
                                              ? 0
                                              : model.teamsPointsD1[4]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 5
                                          ? 0
                                          : model.teamsPointsD1[4]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw5CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 5
                                              ? []
                                              : model.teamsPointsD1[4]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw5CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 5
                                              ? []
                                              : model.teamsPointsD1[4]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw5CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 5
                                              ? ''
                                              : model.teamsPointsD1[4]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw5CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 5
                                              ? ''
                                              : model
                                                  .teamsPointsD1[4].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw6D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 6
                                              ? 0
                                              : model.teamsPointsD1[5]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 6
                                          ? 0
                                          : model.teamsPointsD1[5]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw6CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 6
                                              ? []
                                              : model.teamsPointsD1[5]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw6CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 6
                                              ? []
                                              : model.teamsPointsD1[5]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw6CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 6
                                              ? ''
                                              : model.teamsPointsD1[5]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw6CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 6
                                              ? ''
                                              : model
                                                  .teamsPointsD1[5].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw7D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 19
                                              ? 0
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 19
                                              ? 0
                                              : model.teamsPointsD1[18]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw7CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 19
                                              ? []
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw7CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 19
                                              ? []
                                              : model.teamsPointsD1[18]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw7CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 19
                                              ? ''
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw7CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 19
                                              ? ''
                                              : model
                                                  .teamsPointsD1[18].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw8D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 8
                                              ? 0
                                              : model.teamsPointsD1[7]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 8
                                          ? 0
                                          : model.teamsPointsD1[7]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw8CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 8
                                              ? []
                                              : model.teamsPointsD1[7]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw8CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 8
                                              ? []
                                              : model.teamsPointsD1[7]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw8CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 8
                                              ? ''
                                              : model.teamsPointsD1[7]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw8CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 8
                                              ? ''
                                              : model
                                                  .teamsPointsD1[7].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw9D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 9
                                              ? 0
                                              : model.teamsPointsD1[8]
                                                  .playerOfWeekName.length,
                                      numOfTeams: model.teamsPointsD1.length < 9
                                          ? 0
                                          : model.teamsPointsD1[8]
                                              .teamOfWeekName.length,
                                      playerOfWeek: model.gw9CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 9
                                              ? []
                                              : model.teamsPointsD1[8]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw9CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 9
                                              ? []
                                              : model.teamsPointsD1[8]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw9CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 9
                                              ? ''
                                              : model.teamsPointsD1[8]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw9CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 9
                                              ? ''
                                              : model
                                                  .teamsPointsD1[8].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw10D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 10
                                              ? 0
                                              : model.teamsPointsD1[9]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 10
                                              ? 0
                                              : model.teamsPointsD1[9]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw10CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 10
                                              ? []
                                              : model.teamsPointsD1[9]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw10CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 10
                                              ? []
                                              : model.teamsPointsD1[9]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw10CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 10
                                              ? ''
                                              : model.teamsPointsD1[9]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw10CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 10
                                              ? ''
                                              : model
                                                  .teamsPointsD1[9].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw11D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 11
                                              ? 0
                                              : model.teamsPointsD1[10]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 11
                                              ? 0
                                              : model.teamsPointsD1[10]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw11CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 11
                                              ? []
                                              : model.teamsPointsD1[10]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw11CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 11
                                              ? []
                                              : model.teamsPointsD1[10]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw11CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 11
                                              ? ''
                                              : model.teamsPointsD1[10]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw11CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 11
                                              ? ''
                                              : model
                                                  .teamsPointsD1[10].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw12D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 12
                                              ? 0
                                              : model.teamsPointsD1[11]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 12
                                              ? 0
                                              : model.teamsPointsD1[11]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw12CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 12
                                              ? []
                                              : model.teamsPointsD1[11]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw12CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 12
                                              ? []
                                              : model.teamsPointsD1[11]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw12CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 12
                                              ? ''
                                              : model.teamsPointsD1[11]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw12CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 12
                                              ? ''
                                              : model
                                                  .teamsPointsD1[11].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw13D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 13
                                              ? 0
                                              : model.teamsPointsD1[12]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 13
                                              ? 0
                                              : model.teamsPointsD1[12]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw13CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 13
                                              ? []
                                              : model.teamsPointsD1[12]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw13CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 13
                                              ? []
                                              : model.teamsPointsD1[12]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw13CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 13
                                              ? ''
                                              : model.teamsPointsD1[12]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw13CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 13
                                              ? ''
                                              : model
                                                  .teamsPointsD1[12].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw14D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 14
                                              ? 0
                                              : model.teamsPointsD1[13]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 14
                                              ? 0
                                              : model.teamsPointsD1[13]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw14CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 14
                                              ? []
                                              : model.teamsPointsD1[13]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw14CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 14
                                              ? []
                                              : model.teamsPointsD1[13]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw14CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 14
                                              ? ''
                                              : model.teamsPointsD1[13]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw14CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 14
                                              ? ''
                                              : model
                                                  .teamsPointsD1[13].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw15D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 15
                                              ? 0
                                              : model.teamsPointsD1[14]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 15
                                              ? 0
                                              : model.teamsPointsD1[14]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw15CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 15
                                              ? []
                                              : model.teamsPointsD1[14]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw15CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 15
                                              ? []
                                              : model.teamsPointsD1[14]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw15CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 15
                                              ? ''
                                              : model.teamsPointsD1[14]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw15CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 15
                                              ? ''
                                              : model
                                                  .teamsPointsD1[14].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw16D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 16
                                              ? 0
                                              : model.teamsPointsD1[15]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 16
                                              ? 0
                                              : model.teamsPointsD1[15]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw16CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 16
                                              ? []
                                              : model.teamsPointsD1[15]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw16CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 16
                                              ? []
                                              : model.teamsPointsD1[15]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw16CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 16
                                              ? ''
                                              : model.teamsPointsD1[15]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw16CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 16
                                              ? ''
                                              : model
                                                  .teamsPointsD1[15].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw17D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 17
                                              ? 0
                                              : model.teamsPointsD1[16]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 17
                                              ? 0
                                              : model.teamsPointsD1[16]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw17CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 17
                                              ? []
                                              : model.teamsPointsD1[16]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw17CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 17
                                              ? []
                                              : model.teamsPointsD1[16]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw17CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 17
                                              ? ''
                                              : model.teamsPointsD1[16]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw17CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 17
                                              ? ''
                                              : model
                                                  .teamsPointsD1[16].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw18D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 18
                                              ? 0
                                              : model.teamsPointsD1[17]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 18
                                              ? 0
                                              : model.teamsPointsD1[17]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw18CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 18
                                              ? []
                                              : model.teamsPointsD1[17]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw18CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 18
                                              ? []
                                              : model.teamsPointsD1[17]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw18CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 18
                                              ? ''
                                              : model.teamsPointsD1[17]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw18CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 18
                                              ? ''
                                              : model
                                                  .teamsPointsD1[17].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw19D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 19
                                              ? 0
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 19
                                              ? 0
                                              : model.teamsPointsD1[18]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw19CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 19
                                              ? []
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw19CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 19
                                              ? []
                                              : model.teamsPointsD1[18]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw19CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 19
                                              ? ''
                                              : model.teamsPointsD1[18]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw19CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 19
                                              ? ''
                                              : model
                                                  .teamsPointsD1[18].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw20D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 20
                                              ? 0
                                              : model.teamsPointsD1[19]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 20
                                              ? 0
                                              : model.teamsPointsD1[19]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw20CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 20
                                              ? []
                                              : model.teamsPointsD1[19]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw20CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 20
                                              ? []
                                              : model.teamsPointsD1[19]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw20CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 20
                                              ? ''
                                              : model.teamsPointsD1[19]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw20CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 20
                                              ? ''
                                              : model
                                                  .teamsPointsD1[19].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw21D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 21
                                              ? 0
                                              : model.teamsPointsD1[20]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 21
                                              ? 0
                                              : model.teamsPointsD1[20]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw21CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 21
                                              ? []
                                              : model.teamsPointsD1[20]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw21CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 21
                                              ? []
                                              : model.teamsPointsD1[20]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw21CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 21
                                              ? ''
                                              : model.teamsPointsD1[20]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw21CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 21
                                              ? ''
                                              : model
                                                  .teamsPointsD1[20].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw22D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 22
                                              ? 0
                                              : model.teamsPointsD1[21]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 22
                                              ? 0
                                              : model.teamsPointsD1[21]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw22CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 22
                                              ? []
                                              : model.teamsPointsD1[21]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw22CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 22
                                              ? []
                                              : model.teamsPointsD1[21]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw22CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 22
                                              ? ''
                                              : model.teamsPointsD1[21]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw22CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 22
                                              ? ''
                                              : model
                                                  .teamsPointsD1[21].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw23D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 23
                                              ? 0
                                              : model.teamsPointsD1[22]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 23
                                              ? 0
                                              : model.teamsPointsD1[22]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw23CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 23
                                              ? []
                                              : model.teamsPointsD1[22]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw23CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 23
                                              ? []
                                              : model.teamsPointsD1[22]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw23CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 23
                                              ? ''
                                              : model.teamsPointsD1[22]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw23CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 23
                                              ? ''
                                              : model
                                                  .teamsPointsD1[22].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw24D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 24
                                              ? 0
                                              : model.teamsPointsD1[23]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 24
                                              ? 0
                                              : model.teamsPointsD1[23]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw24CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 24
                                              ? []
                                              : model.teamsPointsD1[23]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw24CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 24
                                              ? []
                                              : model.teamsPointsD1[23]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw24CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 24
                                              ? ''
                                              : model.teamsPointsD1[23]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw24CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 24
                                              ? ''
                                              : model
                                                  .teamsPointsD1[23].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw25D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 25
                                              ? 0
                                              : model.teamsPointsD1[24]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 25
                                              ? 0
                                              : model.teamsPointsD1[24]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw25CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 25
                                              ? []
                                              : model.teamsPointsD1[24]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw25CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 25
                                              ? []
                                              : model.teamsPointsD1[24]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw25CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 25
                                              ? ''
                                              : model.teamsPointsD1[24]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw25CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 25
                                              ? ''
                                              : model
                                                  .teamsPointsD1[24].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw26D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 26
                                              ? 0
                                              : model.teamsPointsD1[25]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 26
                                              ? 0
                                              : model.teamsPointsD1[25]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw26CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 26
                                              ? []
                                              : model.teamsPointsD1[25]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw26CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 26
                                              ? []
                                              : model.teamsPointsD1[25]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw26CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 26
                                              ? ''
                                              : model.teamsPointsD1[25]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw26CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 26
                                              ? ''
                                              : model
                                                  .teamsPointsD1[25].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw27D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 27
                                              ? 0
                                              : model.teamsPointsD1[26]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 27
                                              ? 0
                                              : model.teamsPointsD1[26]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw27CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 27
                                              ? []
                                              : model.teamsPointsD1[26]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw27CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 27
                                              ? []
                                              : model.teamsPointsD1[26]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw27CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 27
                                              ? ''
                                              : model.teamsPointsD1[26]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw27CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 27
                                              ? ''
                                              : model
                                                  .teamsPointsD1[26].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw28D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 28
                                              ? 0
                                              : model.teamsPointsD1[27]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 28
                                              ? 0
                                              : model.teamsPointsD1[27]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw28CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 28
                                              ? []
                                              : model.teamsPointsD1[27]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw28CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 28
                                              ? []
                                              : model.teamsPointsD1[27]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw28CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 28
                                              ? ''
                                              : model.teamsPointsD1[27]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw28CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 28
                                              ? ''
                                              : model
                                                  .teamsPointsD1[27].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw29D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 29
                                              ? 0
                                              : model.teamsPointsD1[28]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 29
                                              ? 0
                                              : model.teamsPointsD1[28]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw29CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 29
                                              ? []
                                              : model.teamsPointsD1[28]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw29CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 29
                                              ? []
                                              : model.teamsPointsD1[28]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw29CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 29
                                              ? ''
                                              : model.teamsPointsD1[28]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw29CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 29
                                              ? ''
                                              : model
                                                  .teamsPointsD1[28].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw30D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 30
                                              ? 0
                                              : model.teamsPointsD1[29]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 30
                                              ? 0
                                              : model.teamsPointsD1[29]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw30CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 30
                                              ? []
                                              : model.teamsPointsD1[29]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw30CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 30
                                              ? []
                                              : model.teamsPointsD1[29]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw30CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 30
                                              ? ''
                                              : model.teamsPointsD1[29]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw30CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 30
                                              ? ''
                                              : model
                                                  .teamsPointsD1[29].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw31D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 31
                                              ? 0
                                              : model.teamsPointsD1[30]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 31
                                              ? 0
                                              : model.teamsPointsD1[30]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw31CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 31
                                              ? []
                                              : model.teamsPointsD1[30]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw31CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 31
                                              ? []
                                              : model.teamsPointsD1[30]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw31CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 31
                                              ? ''
                                              : model.teamsPointsD1[30]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw31CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 31
                                              ? ''
                                              : model
                                                  .teamsPointsD1[30].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw32D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 32
                                              ? 0
                                              : model.teamsPointsD1[31]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 32
                                              ? 0
                                              : model.teamsPointsD1[31]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw32CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 32
                                              ? []
                                              : model.teamsPointsD1[31]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw32CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 32
                                              ? []
                                              : model.teamsPointsD1[31]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw32CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 32
                                              ? ''
                                              : model.teamsPointsD1[31]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw32CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 32
                                              ? ''
                                              : model
                                                  .teamsPointsD1[31].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw33D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 33
                                              ? 0
                                              : model.teamsPointsD1[32]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 33
                                              ? 0
                                              : model.teamsPointsD1[32]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw33CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 33
                                              ? []
                                              : model.teamsPointsD1[32]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw33CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 33
                                              ? []
                                              : model.teamsPointsD1[32]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw33CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 33
                                              ? ''
                                              : model.teamsPointsD1[32]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw33CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 33
                                              ? ''
                                              : model
                                                  .teamsPointsD1[32].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw34D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 34
                                              ? 0
                                              : model.teamsPointsD1[33]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 34
                                              ? 0
                                              : model.teamsPointsD1[33]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw34CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 34
                                              ? []
                                              : model.teamsPointsD1[33]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw34CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 34
                                              ? []
                                              : model.teamsPointsD1[33]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw34CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 34
                                              ? ''
                                              : model.teamsPointsD1[33]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw34CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 34
                                              ? ''
                                              : model
                                                  .teamsPointsD1[33].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw35D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 35
                                              ? 0
                                              : model.teamsPointsD1[34]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 35
                                              ? 0
                                              : model.teamsPointsD1[34]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw35CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 35
                                              ? []
                                              : model.teamsPointsD1[34]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw35CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 35
                                              ? []
                                              : model.teamsPointsD1[34]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw35CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 35
                                              ? ''
                                              : model.teamsPointsD1[34]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw35CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 35
                                              ? ''
                                              : model
                                                  .teamsPointsD1[34].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw36D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 36
                                              ? 0
                                              : model.teamsPointsD1[35]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 36
                                              ? 0
                                              : model.teamsPointsD1[35]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw36CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 36
                                              ? []
                                              : model.teamsPointsD1[35]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw36CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 36
                                              ? []
                                              : model.teamsPointsD1[35]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw36CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 36
                                              ? ''
                                              : model.teamsPointsD1[35]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw36CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 36
                                              ? ''
                                              : model
                                                  .teamsPointsD1[35].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw37D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 37
                                              ? 0
                                              : model.teamsPointsD1[36]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 37
                                              ? 0
                                              : model.teamsPointsD1[36]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw37CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 37
                                              ? []
                                              : model.teamsPointsD1[36]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw37CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 37
                                              ? []
                                              : model.teamsPointsD1[36]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw37CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 37
                                              ? ''
                                              : model.teamsPointsD1[36]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw37CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 37
                                              ? ''
                                              : model
                                                  .teamsPointsD1[36].teamOfWeek,
                                    ),
                                    MatchesScreenWidget(
                                      division: widget.division,
                                      numOfMatches: 10,
                                      teams: model.gw38D1,
                                      numOfPlayers:
                                          model.teamsPointsD1.length < 38
                                              ? 0
                                              : model.teamsPointsD1[37]
                                                  .playerOfWeekName.length,
                                      numOfTeams:
                                          model.teamsPointsD1.length < 38
                                              ? 0
                                              : model.teamsPointsD1[37]
                                                  .teamOfWeekName.length,
                                      playerOfWeek: model.gw38CurrentD1
                                          ? model.playerOfWeekNameD1
                                          : model.teamsPointsD1.length < 38
                                              ? []
                                              : model.teamsPointsD1[37]
                                                  .playerOfWeekName,
                                      teamOfWeek: model.gw38CurrentD1
                                          ? model.teamOfWeekNameD1
                                          : model.teamsPointsD1.length < 38
                                              ? []
                                              : model.teamsPointsD1[37]
                                                  .teamOfWeekName,
                                      playerOfWeekPoints: model.gw38CurrentD1
                                          ? '${model.playerOfWeekD1}'
                                          : model.teamsPointsD1.length < 38
                                              ? ''
                                              : model.teamsPointsD1[37]
                                                  .playerOfWeek,
                                      teamOfWeekPoints: model.gw38CurrentD1
                                          ? '${model.teamOfWeekD1}'
                                          : model.teamsPointsD1.length < 38
                                              ? ''
                                              : model
                                                  .teamsPointsD1[37].teamOfWeek,
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
