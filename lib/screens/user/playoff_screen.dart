import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/playoff_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scoped_model/scoped_model.dart';

class PlayOffScreen extends StatefulWidget {
  const PlayOffScreen({super.key});

  @override
  State<PlayOffScreen> createState() => _PlayOffScreenState();
}

class _PlayOffScreenState extends State<PlayOffScreen> {
  @override
  Widget build(BuildContext context) {
    return PlayOffWidget(
      divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      playOff: const PlayOffScreen(),
      isUser: true,
    );
  }
}
