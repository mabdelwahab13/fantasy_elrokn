import 'package:fantasy_elrokn/screens/admin/add_teams_g2_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_playoff_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/second_division_widget.dart';
import 'package:flutter/material.dart';

class AdminGroupTwoScreen extends StatefulWidget {
  const AdminGroupTwoScreen({super.key});

  @override
  State<AdminGroupTwoScreen> createState() => _AdminGroupTwoScreenState();
}

class _AdminGroupTwoScreenState extends State<AdminGroupTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTeamsG2Screen();
              },
            ),
          );
        },
      ),
      body: SecondDivisionWidget(
        title: 'Group Two',
        divisionOne: AdminDivisionOneScreen(),
        groupOne: AdminGroupOneScreen(),
        groupTwo: AdminGroupTwoScreen(),
        playOff: AdminPlayOffScreen(),
        division: 'Group One',
        league: 'G2',
        isUser: false,
      ),
    );
  }
}
