// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/screens/admin/add_players_screen.dart';
import 'package:fantasy_elrokn/screens/admin/player_sub_screen.dart';
import 'package:fantasy_elrokn/screens/admin/punishment_screen.dart';
import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/fab_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

class AdminTeamProfileScreen extends StatefulWidget {
  int index;
  String league;
  AdminTeamProfileScreen({
    Key? key,
    required this.index,
    required this.league,
  }) : super(key: key);

  @override
  State<AdminTeamProfileScreen> createState() => _AdminTeamProfileScreenState();
}

class _AdminTeamProfileScreenState extends State<AdminTeamProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          floatingActionButton: FabWidget(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(1.w, 3.h,1.w, 3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: SharedColors.backgroundGreyColor,
                      border: Border.all(
                        color: SharedColors.babyBlueColor,
                        width: 2,
                      ),
                    ),
                    child: GrediantBackgroundWidget(
                      child: Center(
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10.h,),
                            EnabledButtonWidget(
                              buttonText: 'Add New Player',
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AddPlayersScreen(
                                      teamId: widget.league != 'D1'
                                          ? widget.league != 'G1'
                                              ? model
                                                  .allGroupTwoTeams[widget.index]
                                                  .teamId
                                              : model
                                                  .allGroupOneTeams[widget.index]
                                                  .teamId
                                          : model.allDivOneTeams[widget.index]
                                              .teamId,
                                      league: widget.league,
                                    );
                                  },
                                ));
                              },
                            ),
                            SizedBox(height: 5.h,),
                            EnabledButtonWidget(
                              buttonText: 'Player Subtitution',
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return PlayerSubScreen(
                                      teamID: widget.league != 'D1'
                                          ? widget.league != 'G1'
                                              ? model
                                                  .allGroupTwoTeams[widget.index]
                                                  .teamId
                                              : model
                                                  .allGroupOneTeams[widget.index]
                                                  .teamId
                                          : model.allDivOneTeams[widget.index]
                                              .teamId,
                                      league: widget.league,
                                    );
                                  },
                                ));
                              },
                            ),
                            SizedBox(height: 5.h,),
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
                    ),
                  );
                },
              );
            },
          ),
          body: TeamProfileScreen(
            index: widget.index,
            league: widget.league,
            teamId: widget.league != 'D1'
                ? widget.league != 'G1'
                    ? model.allGroupTwoTeams[widget.index].teamId
                    : model.allGroupOneTeams[widget.index].teamId
                : model.allDivOneTeams[widget.index].teamId,
            event: model.currentEvent,
          ),
        );
      },
    );
  }
}
