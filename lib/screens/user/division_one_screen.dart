// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/screens/user/playoff_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return DivisionOneWidget(
      divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      playOff: const PlayOffScreen(),
      league: 'D1',
      division: 'Premier League',
      isUser: true,
    );
  }
}
