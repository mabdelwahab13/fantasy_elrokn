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
  

  @override
  Widget build(BuildContext context) {
    return SecondDivisionWidget(
      title: 'Second Divison League - Group Two',
       divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
        division: 'Group One',
      league: 'G2',
      isUser: true,
    );
  }
}