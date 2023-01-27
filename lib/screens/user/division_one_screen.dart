// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:fantasy_elrokn/shared/shared_widget/division_one_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';


class DivisionOneScreen extends StatefulWidget {
  const DivisionOneScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DivisionOneScreen> createState() => _DivisionOneScreenState();
}

class _DivisionOneScreenState extends State<DivisionOneScreen> {
  final List<Widget> _children = [
    MatchesScreenWidget(
      division: 'Premier League',
      numOfMatches: 10,
    ),
    TableWidget(
       numOfTeams: 20,
      // teamName: ['Team1'],
      // matchPlayed: 0,
      // wins: 0,
      // draw: 0,
      // lose: 0,
      // points: 0,
      // pointsScored: 0,
      // pointsAgainst: 0,
      // pointsDiff: 0,
      isUser:true,
      league: 'D1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DivisionOneWidget(
      divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      children: _children,
    );
  }
}
