import 'package:fantasy_elrokn/shared/shared_widget/add_teams_widget.dart';
import 'package:flutter/material.dart';


class AddTeamsD1Screen extends StatefulWidget {
  const AddTeamsD1Screen({super.key});

  @override
  State<AddTeamsD1Screen> createState() => _AddTeamsD1ScreenState();
}

class _AddTeamsD1ScreenState extends State<AddTeamsD1Screen> {
  

  @override
  Widget build(BuildContext context) {
    return AddTeamsWidget(numOfTeams: 20,league: 'D1',);
  }
}

