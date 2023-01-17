import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/play_off_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/second_division_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';

class GroupTwoScreen extends StatefulWidget {
  const GroupTwoScreen({super.key});

  @override
  State<GroupTwoScreen> createState() => _GroupTwoScreenState();
}

class _GroupTwoScreenState extends State<GroupTwoScreen> {
  final List<Widget> _children = [
    MatchesScreenWidget(
      division: 'Group Two',
      numOfMatches: 9,
    ),
    TableWidget(
       numOfTeams: 18,
      // teamName: ['Team1'],
      // matchPlayed: 0,
      // wins: 0,
      // draw: 0,
      // lose: 0,
      // points: 0,
      // pointsScored: 0,
      // pointsAgainst: 0,
      // pointsDiff: 0,
      navigatorScreen:  TeamProfileScreen(),
      league: 'G2',
    ),
    const PlayOffWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return SecondDivisionWidget(
      title: 'Second Divison League - Group Two',
       divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      children: _children,
    );
  }
}