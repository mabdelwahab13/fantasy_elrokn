// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:sizer/sizer.dart';

class MatchesScreenWidget extends StatefulWidget {
  String division;
  int numOfMatches;
  List teams;
  List playerOfWeek;
  List teamOfWeek;
  String playerOfWeekPoints;
  String teamOfWeekPoints;
  int numOfPlayers;
  int numOfTeams;
  MatchesScreenWidget({
    Key? key,
    required this.division,
    required this.numOfMatches,
    required this.teams,
    required this.playerOfWeek,
    required this.teamOfWeek,
    required this.playerOfWeekPoints,
    required this.teamOfWeekPoints,
    required this.numOfPlayers,
    required this.numOfTeams,
  }) : super(key: key);

  @override
  State<MatchesScreenWidget> createState() => _MatchesScreenWidgetState();
}

class _MatchesScreenWidgetState extends State<MatchesScreenWidget> {
  EdgeInsets padding =  EdgeInsets.only(top: 1.5.h, bottom: 1.5.h);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(2.w,1.h,2.w,1.h),
      child: Column(
        children: [
          Container(
             alignment: Alignment.center,
            // height: 70.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: SharedColors.babyBlueColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
              color: SharedColors.backgroundGreyColor,
            ),
            padding: EdgeInsets.fromLTRB(2.w,0.5.h,2.w,0.5.h),
            child: Column(
              children: [
                Text(
                  widget.division,
                  style: SharedFonts.whiteFont,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(3.5),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(0.3),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(3.5),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: SharedColors.babyBlueColor,
                      width: 2,
                    ),
                  ),
                  children: [
                    for (int i = 0; i < widget.numOfMatches; i++)
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              padding: padding,
                              child: Text(
                                widget.teams.isEmpty
                                    ? 'teamName'
                                    : widget.teams[i].gwFixture[0],
                                style: SharedFonts.whiteMatchesFont,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              color: widget.teams.isEmpty
                                  ? SharedColors.backgroundSubGreyColor
                                  : widget.teams[i].team0Result >
                                          widget.teams[i].team1Result
                                      ? SharedColors.greenTable
                                      : widget.teams[i].team0Result ==
                                              widget.teams[i].team1Result
                                          ? SharedColors.backgroundSubGreyColor
                                          : SharedColors.redTable,
                              child: Text(
                                widget.teams.isEmpty
                                    ? '0'
                                    : '${widget.teams[i].team0Result}',
                                style: SharedFonts.whiteFont,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                ':',
                                style: SharedFonts.whiteFont,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              color: widget.teams.length <= i
                                  ? SharedColors.backgroundSubGreyColor
                                  : widget.teams[i].team1Result >
                                          widget.teams[i].team0Result
                                      ? SharedColors.greenTable
                                      : widget.teams[i].team1Result ==
                                              widget.teams[i].team0Result
                                          ? SharedColors.backgroundSubGreyColor
                                          : SharedColors.redTable,
                              child: Text(
                                widget.teams.isEmpty
                                    ? '0'
                                    : '${widget.teams[i].team1Result}',
                                style: SharedFonts.whiteFont,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              padding: padding,
                              child: Text(
                                widget.teams.isEmpty
                                    ? 'teamName'
                                    : widget.teams[i].gwFixture[1],
                                style: SharedFonts.whiteMatchesFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          AwardsWidget(
            winner: widget.playerOfWeek,
            award: 'Player of The week',
            points: widget.playerOfWeekPoints,
            num: widget.numOfPlayers,
          ),
          SizedBox(
            height: 1.h,
          ),
          AwardsWidget(
            winner: widget.teamOfWeek,
            award: 'Team of The week',
            points: widget.teamOfWeekPoints,
            num: widget.numOfTeams,
          ),
        ],
      ),
    );
  }
}
