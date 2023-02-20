import 'package:fantasy_elrokn/screens/admin/add_teams_g1_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_two_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_team_profile_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/play_off_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/second_division_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';

class AdminGroupOneScreen extends StatefulWidget {
  const AdminGroupOneScreen({super.key});

  @override
  State<AdminGroupOneScreen> createState() => _AdminGroupOneScreenState();
}

class _AdminGroupOneScreenState extends State<AdminGroupOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTeamsG1Screen();
              },
            ),
          );
        },
      ),
      body: SecondDivisionWidget(
        title: 'Group One',
        divisionOne: AdminDivisionOneScreen(),
        groupOne: AdminGroupOneScreen(),
        groupTwo: AdminGroupTwoScreen(),
        division: 'Group One',
        league: 'G1',
        isUser: false,
      ),
    );
  }
}
