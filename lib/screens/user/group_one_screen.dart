import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/play_off_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/second_division_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';

class GroupOneScreen extends StatefulWidget {
  const GroupOneScreen({super.key});

  @override
  State<GroupOneScreen> createState() => _GroupOneScreenState();
}

class _GroupOneScreenState extends State<GroupOneScreen> {
 
  @override
  Widget build(BuildContext context) {
    return SecondDivisionWidget(
      title: 'Second Divison League - Group One',
       divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      division: 'Group One',
      league: 'G1',
      isUser: true,
    );
  }
}
