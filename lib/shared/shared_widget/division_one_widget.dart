// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';

class DivisionOneWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  List children;
  DivisionOneWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
    required this.children,
  }) : super(key: key);

  @override
  State<DivisionOneWidget> createState() => _DivisionOneWidgetState();
}

class _DivisionOneWidgetState extends State<DivisionOneWidget> {
  int _currentIndex = 0;


  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _currentIndex == 0 ? 38 : 0,
      child: Scaffold(
        backgroundColor: SharedColors.backgroundBlackColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: SharedColors.yellowColor),
          backgroundColor: SharedColors.backgroundGreyColor,
          title: Text(
            'Permier League',
            style: SharedFonts.yellowFont,
          ),
          bottom: _currentIndex == 0
              ? TabBar(
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
          currentIndex: _currentIndex,
          onTap: _changeTab,
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
              widget.children[_currentIndex],
              if (_currentIndex == 0)
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      AwardsWidget(
                          winner: 'Folan',
                          award: 'Player of The week',
                          points: '120'),
                      SizedBox(
                        height: 20,
                      ),
                      AwardsWidget(
                          winner: 'Folan',
                          award: 'Team of The week',
                          points: '500'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
