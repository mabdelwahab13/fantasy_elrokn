import 'package:fantasy_elrokn/screens/admin/add_players_screen.dart';
import 'package:fantasy_elrokn/screens/admin/player_sub_screen.dart';
import 'package:fantasy_elrokn/screens/admin/punishment_screen.dart';
import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:flutter/material.dart';

class AdminTeamProfileScreen extends StatefulWidget {
  const AdminTeamProfileScreen({super.key});

  @override
  State<AdminTeamProfileScreen> createState() => _AdminTeamProfileScreenState();
}

class _AdminTeamProfileScreenState extends State<AdminTeamProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabWidget(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: SharedColors.backgroundGreyColor,
                  border: Border.all(
                    color: SharedColors.yellowColor,
                    width: 2,
                  ),
                ),
                child: GrediantBackgroundWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EnabledButtonWidget(
                        buttonText: 'Add New Player',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AddPlayersScreen();
                            },
                          ));
                        },
                      ),
                      EnabledButtonWidget(
                        buttonText: 'Player Subtitution',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PlayerSubScreen();
                            },
                          ));
                        },
                      ),
                      EnabledButtonWidget(
                        buttonText: 'Punishment',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PunishmentScreen();
                            },
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: TeamProfileScreen(),
    );
  }
}