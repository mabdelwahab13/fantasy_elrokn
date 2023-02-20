// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/play_off_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class SecondDivisionWidget extends StatefulWidget {
  String title;
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  String league;
  String division;
  bool isUser;
  SecondDivisionWidget({
    Key? key,
    required this.title,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
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
          initialIndex: 0,
          length: _currentBottomIndex == 0
              ? 38
              : _currentBottomIndex == 1
                  ? 0
                  : 15,
          child: Scaffold(
            backgroundColor: SharedColors.backgroundBlackColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: SharedColors.yellowColor),
              backgroundColor: SharedColors.backgroundGreyColor,
              title: Text(
                '${widget.title}',
                style: SharedFonts.yellowFont,
              ),
              bottom: _currentBottomIndex == 0
                  ? TabBar(
                      unselectedLabelStyle: SharedFonts.greyFont,
                      isScrollable: true,
                      indicatorColor: SharedColors.subYellowColor,
                      tabs: SharedLeagueGameWeeks.tabs,
                    )
                  : _currentBottomIndex == 2
                      ? TabBar(
                          unselectedLabelStyle: SharedFonts.greyFont,
                          isScrollable: true,
                          indicatorColor: SharedColors.subYellowColor,
                          tabs: SharedCupGameWeeks.tabs,
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
                const BottomNavigationBarItem(
                  icon: Icon(Icons.table_rows_outlined),
                  label: 'Play Offs',
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
                          numOfTeams: 18,
                          isUser: widget.isUser,
                          league: widget.league,
                        )
                      : _currentBottomIndex == 2
                          ? const PlayOffWidget()
                          : const PlayOffWidget(),
                  // : TabBarView(
                  //     children: [
                  //       MatchesScreenWidget(
                  //         division: widget.division,
                  //         numOfMatches: 9,
                  //         team1Result: 0,
                  //         team2Result: 0,
                  //         teams: [],
                  //       ),
                  //       MatchesScreenWidget(
                  //         division: widget.division,
                  //         numOfMatches: 9,
                  //         team1Result: 0,
                  //         team2Result: 0,
                  //         teams: [],
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
