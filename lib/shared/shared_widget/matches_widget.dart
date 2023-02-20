// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';

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
  EdgeInsets padding = EdgeInsets.only(top: 15, bottom: 15);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: SharedColors.yellowColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: SharedColors.backgroundGreyColor,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      widget.division,
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
                          color: SharedColors.yellowColor,
                          width: 2,
                        ),
                      ),
                      children: [
                        for (int i = 0; i < model.gw1.length; i++)
                          TableRow(
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: padding,
                                  child: Text(
                                    widget.teams[i].gwFixture[0],
                                    style: SharedFonts.whiteMatchesFont,
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: widget.teams[i].team0Result >
                                          widget.teams[i].team1Result
                                      ? SharedColors.greenTable
                                      : widget.teams[i].team0Result ==
                                              widget.teams[i].team1Result
                                          ? SharedColors.backgroundSubGreyColor
                                          : SharedColors.redTable,
                                  child: Text(
                                    '${widget.teams[i].team0Result}',
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
                                  color: widget.teams[i].team1Result >
                                          widget.teams[i].team0Result
                                      ? SharedColors.greenTable
                                      : widget.teams[i].team1Result ==
                                              widget.teams[i].team0Result
                                          ? SharedColors.backgroundSubGreyColor
                                          : SharedColors.redTable,
                                  child: Text(
                                    '${widget.teams[i].team1Result}',
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
                                    widget.teams[i].gwFixture[1],
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
              AwardsWidget(
                winner: widget.playerOfWeek,
                award: 'Player of The week',
                points: widget.playerOfWeekPoints,
                num: widget.numOfPlayers,
              ),
              SizedBox(
                height: 10,
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
      },
    );
  }
}

 
// class MatchesWidget extends StatelessWidget {
//   const MatchesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 10),
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text('Team1', style: SharedFonts.subWhiteFont),
//           Container(
//             alignment: Alignment.center,
//             height: 40,
//             width: 50,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15), color: Colors.grey),
//             child: Text(
//               '300',
//               style: SharedFonts.subWhiteFont,
//             ),
//           ),
//           const Text(
//             ':',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             height: 40,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.grey,
//             ),
//             child: Text(
//               '300',
//               style: SharedFonts.subWhiteFont,
//             ),
//           ),
//           Text(
//             'Team2',
//             style: SharedFonts.subWhiteFont,
//           ),
//         ],
//       ),
//     );
//   }
// }
