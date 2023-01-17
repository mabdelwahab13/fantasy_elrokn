import 'package:fantasy_elrokn/shared/shared_widget/add_teams_widget.dart';
import 'package:flutter/material.dart';

class AddTeamsG1Screen extends StatefulWidget {
  const AddTeamsG1Screen({super.key});

  @override
  State<AddTeamsG1Screen> createState() => _AddTeamsG1ScreenState();
}

class _AddTeamsG1ScreenState extends State<AddTeamsG1Screen> {
  @override
  Widget build(BuildContext context) {
    return AddTeamsWidget(numOfTeams: 18,league: 'G1',);
  }
}