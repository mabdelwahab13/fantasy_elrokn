import 'package:fantasy_elrokn/screens/admin/add_teams_d1_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/division_one_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:flutter/material.dart';

class AdminDivisionOneScreen extends StatefulWidget {
  const AdminDivisionOneScreen({super.key});

  @override
  State<AdminDivisionOneScreen> createState() => _AdminDivisionOneScreenState();
}

class _AdminDivisionOneScreenState extends State<AdminDivisionOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTeamsD1Screen();
              },
            ),
          );
        },
      ),
      body: DivisionOneWidget(
        divisionOne: AdminDivisionOneScreen(),
        groupOne: AdminGroupOneScreen(),
        groupTwo: AdminGroupTwoScreen(),
        league: 'D1',
        division: 'Premier League',
        isUser: false,
      ),
    );
  }
}
