import 'package:fantasy_elrokn/screens/admin/add_teams_d1_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_two_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_team_profile_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/division_one_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';

class AdminDivisionOneScreen extends StatefulWidget {
  const AdminDivisionOneScreen({super.key});

  @override
  State<AdminDivisionOneScreen> createState() => _AdminDivisionOneScreenState();
}

class _AdminDivisionOneScreenState extends State<AdminDivisionOneScreen> {
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
      navigatorScreen: AdminTeamProfileScreen(),
       league: 'D1',
    ),
  ];
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
        children: _children,
      ),
    );
  }
}
