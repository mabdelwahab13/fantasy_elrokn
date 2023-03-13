// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_data/shared_teams.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/matches_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/playoff_matches_widget.dart';

class PlayOffWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  Widget playOff;
  bool isUser;
  PlayOffWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
    required this.playOff,
    required this.isUser,
  }) : super(key: key);

  @override
  State<PlayOffWidget> createState() => _PlayOffWidgetState();
}

class _PlayOffWidgetState extends State<PlayOffWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return DefaultTabController(
          initialIndex:
              (model.currentEvent - 35) < 0 ? 0 : model.currentEvent - 35,
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: SharedColors.backgroundGreyColor,
              title: Text(
                'Permier League',
                style: SharedFonts.yellowFont,
              ),
              bottom: TabBar(
                unselectedLabelStyle: SharedFonts.greyFont,
                isScrollable: true,
                indicatorColor: SharedColors.subYellowColor,
                tabs: SharedPlayOffWeeks.tabs,
              ),
            ),
            drawer: DrawerWidget(
              divisionOne: widget.divisionOne,
              groupOne: widget.groupOne,
              groupTwo: widget.groupTwo,
              playOff: widget.playOff,
              isUser: widget.isUser,
            ),
            body: GrediantBackgroundWidget(
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: <Widget>[
                          PlayOffMatchesWidget(
                            round: 'Quarter Final',
                            numOfMatches: 4,
                            teams: model.gw35G1PlayOffQFinal,
                          ),
                          PlayOffMatchesWidget(
                            round: 'Semi Final',
                            numOfMatches: 2,
                            teams: model.gw36G1PlayOffSemiFinal,
                          ),
                          PlayOffMatchesWidget(
                            round: 'Final First Leg',
                            numOfMatches: 1,
                            teams: model.gw37G1PlayOffFinal1,
                          ),
                          PlayOffMatchesWidget(
                            round: 'Final Second Leg',
                            numOfMatches: 1,
                            teams: model.gw38G1PlayOffFinal2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
