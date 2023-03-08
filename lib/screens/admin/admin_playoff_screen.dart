import 'package:fantasy_elrokn/screens/admin/fix_draw_playoff_screen.dart';
import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/screens/user/playoff_screen.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/playoff_widget.dart';
import 'package:flutter/material.dart';


class AdminPlayOffScreen extends StatefulWidget {
  const AdminPlayOffScreen({super.key});

  @override
  State<AdminPlayOffScreen> createState() => _AdminPlayOffScreenState();
}

class _AdminPlayOffScreenState extends State<AdminPlayOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FixDrawPlayOffScreen();
              },
            ),
          );
        },
      ),
      body: PlayOffWidget(
      divisionOne: const DivisionOneScreen(),
      groupOne: const GroupOneScreen(),
      groupTwo: const GroupTwoScreen(),
      playOff: const PlayOffScreen(),
    ),
    );
  }
}