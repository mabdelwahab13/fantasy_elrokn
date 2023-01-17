import 'package:fantasy_elrokn/shared/shared_widget/add_teams_widget.dart';
import 'package:flutter/material.dart';

class AddTeamsG2Screen extends StatefulWidget {
  const AddTeamsG2Screen({super.key});

  @override
  State<AddTeamsG2Screen> createState() => _AddTeamsG2ScreenState();
}

class _AddTeamsG2ScreenState extends State<AddTeamsG2Screen> {
  @override
  Widget build(BuildContext context) {
    return AddTeamsWidget(numOfTeams: 18,league: 'G2',);
  }
}