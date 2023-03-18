// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';

class PlayOffMatchesWidget extends StatefulWidget {
  String round;
  int numOfMatches;
  List teams;
  PlayOffMatchesWidget({
    Key? key,
    required this.round,
    required this.numOfMatches,
    required this.teams,
  }) : super(key: key);

  @override
  State<PlayOffMatchesWidget> createState() => _PlayOffMatchesWidgetState();
}

class _PlayOffMatchesWidgetState extends State<PlayOffMatchesWidget> {
  EdgeInsets padding = const EdgeInsets.only(top: 15, bottom: 15);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            
            decoration: BoxDecoration(
              border: Border.all(
                color: SharedColors.babyBlueColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
              color: SharedColors.backgroundGreyColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'PlayOff ${widget.round}',
                  style: SharedFonts.whiteFont,
                ),
                SizedBox(
                  height: 20,
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
            height: 20,
          ),
        ],
      ),
    );
  }
}
