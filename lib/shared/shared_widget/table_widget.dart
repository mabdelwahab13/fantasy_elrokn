// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:fantasy_elrokn/screens/admin/admin_team_profile_screen.dart';
import 'package:fantasy_elrokn/screens/user/team_profile_screen_.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';

class TableWidget extends StatefulWidget {
  int numOfTeams;
  bool isUser;
  String league;
  TableWidget({
    Key? key,
    required this.numOfTeams,
    required this.isUser,
    required this.league,
  }) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  EdgeInsets padding = EdgeInsets.only(top: 10, bottom: 5);
  @override
  Widget build(BuildContext context) {
    bool isTeam = teamNum(widget.numOfTeams);
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return SingleChildScrollView(
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(1.3),
              1: FlexColumnWidth(3.5),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(1),
              6: FlexColumnWidth(1.5),
              7: FlexColumnWidth(1.5),
              8: FlexColumnWidth(1.5),
              9: FlexColumnWidth(1),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                color: SharedColors.yellowColor,
                width: 2,
              ),
            ),
            children: [
              TableRow(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      '#',
                      style: SharedFonts.whiteTableFont,
                    ),
                  ),
                  Container(
                    padding: padding,
                    child: Text('TeamName', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('MP', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('W', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('D', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('L', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('PF', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('PA', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('PD', style: SharedFonts.whiteTableFont),
                  ),
                  Container(
                    padding: padding,
                    alignment: Alignment.center,
                    child: Text('P', style: SharedFonts.whiteTableFont),
                  ),
                ],
              ),
              for (int i = 0; i < widget.numOfTeams; i++)
                TableRow(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: color(i, isTeam)),
                      child: Text(
                        '${i + 1}',
                        style: SharedFonts.whiteTableFont,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: padding,
                        child: Text(
                            widget.league != 'D1'
                                ? widget.league != 'G1'
                                    ? model.allGroupTwoTeams.isEmpty
                                        ? 'teamName'
                                        : model.allGroupTwoTeams[i].teamName
                                    : model.allGroupOneTeams.isEmpty
                                        ? 'teamName'
                                        : model.allGroupOneTeams[i].teamName
                                : model.allDivOneTeams.isEmpty
                                    ? 'teamName'
                                    : model.allDivOneTeams[i].teamName,
                            style: SharedFonts.whiteTableFont),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return widget.isUser
                                  ? TeamProfileScreen(
                                      index: i,
                                      league: widget.league,
                                      teamId: widget.league != 'D1'
                                          ? widget.league != 'G1'
                                              ? model.allGroupTwoTeams[i].teamId
                                              : model.allGroupOneTeams[i].teamId
                                          : model.allDivOneTeams[i].teamId,
                                      event: model.currentEvent,
                                    )
                                  : AdminTeamProfileScreen(
                                      index: i,
                                      league: widget.league,
                                    );
                            },
                          ),
                        );
                        widget.league != 'D1'
                            ? widget.league != 'G1'
                                ? model
                                    .getDataG2(model.allGroupTwoTeams[i].teamId)
                                : model
                                    .getDataG1(model.allGroupOneTeams[i].teamId)
                            : model.getDataD1(model.allDivOneTeams[i].teamId);
                      },
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].matchesPlayed}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].matchesPlayed}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].matchesPlayed}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].wins}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].wins}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].wins}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].draw}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].draw}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].draw}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].lose}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].lose}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].lose}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].pointsScored}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].pointsScored}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].pointsScored}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].pointsAgainst}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].pointsAgainst}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].pointsAgainst}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].pointsDiff}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].pointsDiff}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].pointsDiff}',
                          style: SharedFonts.whiteTableFont),
                    ),
                    Container(
                      padding: padding,
                      alignment: Alignment.center,
                      child: Text(
                          widget.league != 'D1'
                              ? widget.league != 'G1'
                                  ? model.allGroupTwoTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupTwoTeams[i].points}'
                                  : model.allGroupOneTeams.isEmpty
                                      ? '0'
                                      : '${model.allGroupOneTeams[i].points}'
                              : model.allDivOneTeams.isEmpty
                                  ? '0'
                                  : '${model.allDivOneTeams[i].points}',
                          style: SharedFonts.whiteTableFont),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

Color color(int index, bool isTeams) {
  if (isTeams) {
    if (index + 1 <= 5) {
      return SharedColors.greenTable;
    } else if (index + 1 == 6) {
      return SharedColors.blueTable;
    } else if (index + 1 >= 16) {
      return SharedColors.redTable;
    } else {
      return Colors.grey;
    }
  } else {
    if (index + 1 <= 2) {
      return SharedColors.greenTable;
    } else if (index + 1 < 7 && index + 1 >= 3) {
      return SharedColors.blueTable;
    } else if (index + 1 >= 15 && index + 1 <= 16) {
      return SharedColors.orangeTable;
    } else if (index + 1 >= 17) {
      return SharedColors.redTable;
    } else {
      return Colors.grey;
    }
  }
}

bool teamNum(int numOfTeams) {
  if (numOfTeams == 20) {
    return true;
  } else {
    return false;
  }
}
