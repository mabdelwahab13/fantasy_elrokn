import 'package:fantasy_elrokn/screens/admin/add_teams_g2_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_group_one_screen.dart';
import 'package:fantasy_elrokn/screens/admin/admin_team_profile_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/play_off_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/second_division_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/table_widget.dart';
import 'package:flutter/material.dart';

class AdminGroupTwoScreen extends StatefulWidget {
  const AdminGroupTwoScreen({super.key});

  @override
  State<AdminGroupTwoScreen> createState() => _AdminGroupTwoScreenState();
}

class _AdminGroupTwoScreenState extends State<AdminGroupTwoScreen> {
  final List<Widget> _children = [
    MatchesScreenWidget(
      division: 'Group One',
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
      navigatorScreen: AdminTeamProfileScreen(),
      league: 'G2',
    ),
    const PlayOffWidget(),
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
                return const AddTeamsG2Screen();
              },
            ),
          );
        },
      ),
      body: SecondDivisionWidget(
        title: 'Group Two',
        children: _children,
        divisionOne: AdminDivisionOneScreen(),
        groupOne: AdminGroupOneScreen(),
        groupTwo: AdminGroupTwoScreen(),
      ),
    );
  }
}