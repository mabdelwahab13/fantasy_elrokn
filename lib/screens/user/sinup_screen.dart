import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/admin/admin_division_one_screen.dart';
import 'package:async/async.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/email_textfield_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/enabled_button_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/password_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var cancelGetData;
  bool _isDone = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundSubGreyColor,
            title: Text(
              'Fantasy El-Rokn',
              style: SharedFonts.yellowFont,
            ),
          ),
          backgroundColor: SharedColors.backgroundBlackColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SignUp\n',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                EmailTextFieldWidget(),
                PasswordTextFieldWidget(),
                PasswordTextFieldWidget(),
                EnabledButtonWidget(
                  buttonText: 'SignUp',
                  onPressed: () async {
                    await model.getCurrentEventForAll();
                    await model.getGeneralInfo();
                    model.isCurrentEventLoading || model.isGeneralInfoLoading
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return const AdminDivisionOneScreen();
                              },
                            ),
                          );
                    await model.getTeamsDivOneData();
                    await model.getTeamsDivOneTeams();
                    if (model.isGwFinished) {
                      await model.getTeamsDataD1();
                      if (model.teamsPointsD1.length < model.currentEvent) {
                        await model.getCurrentGWDataDevOne();
                        await model.addPlayersDataD1({
                          'gwPoints': model.totalCurrentGWPointsD1,
                          'playerOfWeekName': model.playerOfWeekNameD1,
                          'playerOfWeek': '${model.playerOfWeekD1}',
                          'teamOfWeekName': model.teamOfWeekNameD1,
                          'teamOfWeek': '${model.teamOfWeekD1}',
                        });
                        await model.getTeamsDataD1();
                        await model.gameweekCreationD1();
                      } else {
                        await model.gameweekCreationD1();
                        model.setLoadD1 = false;
                        return;
                      }
                    } else {
                      await model.getCurrentGWDataDevOne();
                      await model.gameweekCreationD1();
                    }
                    if (model.isGwFinished) {
                      if (model.gw1CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 1
                            ? await model.makingTableD1(
                                gw: model.gw1D1,
                                team1Index: 0,
                                team2Index: 19,
                                team3Index: 12,
                                team4Index: 7,
                                team5Index: 18,
                                team6Index: 10,
                                team7Index: 8,
                                team8Index: 6,
                                team9Index: 17,
                                team10Index: 2,
                                team11Index: 11,
                                team12Index: 15,
                                team13Index: 3,
                                team14Index: 16,
                                team15Index: 4,
                                team16Index: 1,
                                team17Index: 5,
                                team18Index: 14,
                                team19Index: 9,
                                team20Index: 13,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw2CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 2
                            ? await model.makingTableD1(
                                gw: model.gw2D1,
                                team1Index: 5,
                                team2Index: 13,
                                team3Index: 12,
                                team4Index: 9,
                                team5Index: 15,
                                team6Index: 14,
                                team7Index: 6,
                                team8Index: 11,
                                team9Index: 1,
                                team10Index: 8,
                                team11Index: 0,
                                team12Index: 4,
                                team13Index: 19,
                                team14Index: 10,
                                team15Index: 3,
                                team16Index: 18,
                                team17Index: 2,
                                team18Index: 16,
                                team19Index: 7,
                                team20Index: 17,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw3CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 3
                            ? await model.makingTableD1(
                                gw: model.gw3D1,
                                team1Index: 18,
                                team2Index: 2,
                                team3Index: 16,
                                team4Index: 7,
                                team5Index: 12,
                                team6Index: 17,
                                team7Index: 19,
                                team8Index: 3,
                                team9Index: 4,
                                team10Index: 10,
                                team11Index: 8,
                                team12Index: 0,
                                team13Index: 1,
                                team14Index: 11,
                                team15Index: 14,
                                team16Index: 16,
                                team17Index: 13,
                                team18Index: 15,
                                team19Index: 5,
                                team20Index: 9,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw4CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 4
                            ? await model.makingTableD1(
                                gw: model.gw4D1,
                                team1Index: 1,
                                team2Index: 14,
                                team3Index: 15,
                                team4Index: 9,
                                team5Index: 6,
                                team6Index: 13,
                                team7Index: 5,
                                team8Index: 12,
                                team9Index: 0,
                                team10Index: 11,
                                team11Index: 10,
                                team12Index: 8,
                                team13Index: 3,
                                team14Index: 4,
                                team15Index: 2,
                                team16Index: 19,
                                team17Index: 7,
                                team18Index: 18,
                                team19Index: 17,
                                team20Index: 16,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw5CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 5
                            ? await model.makingTableD1(
                                gw: model.gw5D1,
                                team1Index: 8,
                                team2Index: 3,
                                team3Index: 17,
                                team4Index: 18,
                                team5Index: 19,
                                team6Index: 7,
                                team7Index: 2,
                                team8Index: 4,
                                team9Index: 12,
                                team10Index: 16,
                                team11Index: 10,
                                team12Index: 11,
                                team13Index: 14,
                                team14Index: 0,
                                team15Index: 1,
                                team16Index: 13,
                                team17Index: 9,
                                team18Index: 6,
                                team19Index: 5,
                                team20Index: 15,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw6CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 6
                            ? await model.makingTableD1(
                                gw: model.gw6D1,
                                team1Index: 3,
                                team2Index: 11,
                                team3Index: 5,
                                team4Index: 6,
                                team5Index: 1,
                                team6Index: 9,
                                team7Index: 0,
                                team8Index: 13,
                                team9Index: 14,
                                team10Index: 10,
                                team11Index: 15,
                                team12Index: 12,
                                team13Index: 2,
                                team14Index: 8,
                                team15Index: 7,
                                team16Index: 4,
                                team17Index: 17,
                                team18Index: 19,
                                team19Index: 16,
                                team20Index: 18,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw7CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 7
                            ? await model.makingTableD1(
                                gw: model.gw7D1,
                                team1Index: 13,
                                team2Index: 10,
                                team3Index: 19,
                                team4Index: 16,
                                team5Index: 4,
                                team6Index: 17,
                                team7Index: 8,
                                team8Index: 7,
                                team9Index: 11,
                                team10Index: 2,
                                team11Index: 14,
                                team12Index: 3,
                                team13Index: 12,
                                team14Index: 18,
                                team15Index: 9,
                                team16Index: 0,
                                team17Index: 5,
                                team18Index: 1,
                                team19Index: 6,
                                team20Index: 15,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw8CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 8
                            ? await model.makingTableD1(
                                gw: model.gw8D1,
                                team1Index: 17,
                                team2Index: 8,
                                team3Index: 1,
                                team4Index: 15,
                                team5Index: 0,
                                team6Index: 5,
                                team7Index: 10,
                                team8Index: 9,
                                team9Index: 3,
                                team10Index: 13,
                                team11Index: 2,
                                team12Index: 14,
                                team13Index: 7,
                                team14Index: 11,
                                team15Index: 6,
                                team16Index: 12,
                                team17Index: 16,
                                team18Index: 4,
                                team19Index: 18,
                                team20Index: 19,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw9CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 9
                            ? await model.makingTableD1(
                                gw: model.gw9D1,
                                team1Index: 15,
                                team2Index: 6,
                                team3Index: 8,
                                team4Index: 16,
                                team5Index: 11,
                                team6Index: 17,
                                team7Index: 14,
                                team8Index: 7,
                                team9Index: 13,
                                team10Index: 2,
                                team11Index: 9,
                                team12Index: 3,
                                team13Index: 5,
                                team14Index: 10,
                                team15Index: 12,
                                team16Index: 19,
                                team17Index: 6,
                                team18Index: 1,
                                team19Index: 4,
                                team20Index: 18,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw10CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 10
                            ? await model.makingTableD1(
                                gw: model.gw10D1,
                                team1Index: 19,
                                team2Index: 4,
                                team3Index: 1,
                                team4Index: 12,
                                team5Index: 18,
                                team6Index: 8,
                                team7Index: 16,
                                team8Index: 11,
                                team9Index: 17,
                                team10Index: 14,
                                team11Index: 7,
                                team12Index: 13,
                                team13Index: 2,
                                team14Index: 9,
                                team15Index: 3,
                                team16Index: 5,
                                team17Index: 10,
                                team18Index: 15,
                                team19Index: 0,
                                team20Index: 6,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw11CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 11
                            ? await model.makingTableD1(
                                gw: model.gw11D1,
                                team1Index: 1,
                                team2Index: 0,
                                team3Index: 8,
                                team4Index: 19,
                                team5Index: 11,
                                team6Index: 18,
                                team7Index: 10,
                                team8Index: 16,
                                team9Index: 13,
                                team10Index: 17,
                                team11Index: 9,
                                team12Index: 7,
                                team13Index: 5,
                                team14Index: 2,
                                team15Index: 15,
                                team16Index: 3,
                                team17Index: 6,
                                team18Index: 10,
                                team19Index: 12,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw12CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 12
                            ? await model.makingTableD1(
                                gw: model.gw12D1,
                                team1Index: 19,
                                team2Index: 11,
                                team3Index: 4,
                                team4Index: 8,
                                team5Index: 0,
                                team6Index: 12,
                                team7Index: 18,
                                team8Index: 4,
                                team9Index: 16,
                                team10Index: 13,
                                team11Index: 17,
                                team12Index: 9,
                                team13Index: 7,
                                team14Index: 5,
                                team15Index: 2,
                                team16Index: 15,
                                team17Index: 3,
                                team18Index: 6,
                                team19Index: 10,
                                team20Index: 1,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw13CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 13
                            ? await model.makingTableD1(
                                gw: model.gw13D1,
                                team1Index: 6,
                                team2Index: 2,
                                team3Index: 0,
                                team4Index: 10,
                                team5Index: 1,
                                team6Index: 3,
                                team7Index: 12,
                                team8Index: 8,
                                team9Index: 15,
                                team10Index: 7,
                                team11Index: 5,
                                team12Index: 17,
                                team13Index: 9,
                                team14Index: 16,
                                team15Index: 13,
                                team16Index: 18,
                                team17Index: 14,
                                team18Index: 19,
                                team19Index: 11,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw14CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 14
                            ? await model.makingTableD1(
                                gw: model.gw14D1,
                                team1Index: 18,
                                team2Index: 9,
                                team3Index: 8,
                                team4Index: 11,
                                team5Index: 4,
                                team6Index: 14,
                                team7Index: 19,
                                team8Index: 13,
                                team9Index: 10,
                                team10Index: 12,
                                team11Index: 16,
                                team12Index: 5,
                                team13Index: 17,
                                team14Index: 15,
                                team15Index: 7,
                                team16Index: 6,
                                team17Index: 1,
                                team18Index: 2,
                                team19Index: 3,
                                team20Index: 0,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw15CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 15
                            ? await model.makingTableD1(
                                gw: model.gw15D1,
                                team1Index: 15,
                                team2Index: 16,
                                team3Index: 10,
                                team4Index: 3,
                                team5Index: 0,
                                team6Index: 2,
                                team7Index: 1,
                                team8Index: 7,
                                team9Index: 6,
                                team10Index: 17,
                                team11Index: 12,
                                team12Index: 11,
                                team13Index: 5,
                                team14Index: 18,
                                team15Index: 9,
                                team16Index: 19,
                                team17Index: 13,
                                team18Index: 4,
                                team19Index: 14,
                                team20Index: 8,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw16CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 16
                            ? await model.makingTableD1(
                                gw: model.gw16D1,
                                team1Index: 16,
                                team2Index: 6,
                                team3Index: 8,
                                team4Index: 13,
                                team5Index: 11,
                                team6Index: 14,
                                team7Index: 4,
                                team8Index: 9,
                                team9Index: 19,
                                team10Index: 5,
                                team11Index: 18,
                                team12Index: 15,
                                team13Index: 3,
                                team14Index: 12,
                                team15Index: 17,
                                team16Index: 1,
                                team17Index: 7,
                                team18Index: 0,
                                team19Index: 2,
                                team20Index: 10,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw17CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 17
                            ? await model.makingTableD1(
                                gw: model.gw17D1,
                                team1Index: 3,
                                team2Index: 2,
                                team3Index: 10,
                                team4Index: 7,
                                team5Index: 0,
                                team6Index: 17,
                                team7Index: 1,
                                team8Index: 16,
                                team9Index: 6,
                                team10Index: 18,
                                team11Index: 15,
                                team12Index: 19,
                                team13Index: 12,
                                team14Index: 14,
                                team15Index: 9,
                                team16Index: 8,
                                team17Index: 13,
                                team18Index: 11,
                                team19Index: 5,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw18CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 18
                            ? await model.makingTableD1(
                                gw: model.gw18D1,
                                team1Index: 17,
                                team2Index: 10,
                                team3Index: 7,
                                team4Index: 3,
                                team5Index: 11,
                                team6Index: 9,
                                team7Index: 8,
                                team8Index: 5,
                                team9Index: 4,
                                team10Index: 15,
                                team11Index: 19,
                                team12Index: 6,
                                team13Index: 18,
                                team14Index: 1,
                                team15Index: 14,
                                team16Index: 13,
                                team17Index: 0,
                                team18Index: 16,
                                team19Index: 2,
                                team20Index: 12,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw19CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 19
                            ? await model.makingTableD1(
                                gw: model.gw19D1,
                                team1Index: 2,
                                team2Index: 7,
                                team3Index: 3,
                                team4Index: 17,
                                team5Index: 10,
                                team6Index: 16,
                                team7Index: 0,
                                team8Index: 18,
                                team9Index: 1,
                                team10Index: 19,
                                team11Index: 6,
                                team12Index: 4,
                                team13Index: 8,
                                team14Index: 15,
                                team15Index: 5,
                                team16Index: 11,
                                team17Index: 12,
                                team18Index: 13,
                                team19Index: 9,
                                team20Index: 14,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw20CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 20
                            ? await model.makingTableD1(
                                gw: model.gw20D1,
                                team1Index: 0,
                                team2Index: 19,
                                team3Index: 12,
                                team4Index: 7,
                                team5Index: 18,
                                team6Index: 10,
                                team7Index: 8,
                                team8Index: 6,
                                team9Index: 17,
                                team10Index: 2,
                                team11Index: 11,
                                team12Index: 15,
                                team13Index: 3,
                                team14Index: 16,
                                team15Index: 4,
                                team16Index: 1,
                                team17Index: 5,
                                team18Index: 14,
                                team19Index: 9,
                                team20Index: 13,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw21CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 21
                            ? await model.makingTableD1(
                                gw: model.gw21D1,
                                team1Index: 5,
                                team2Index: 13,
                                team3Index: 12,
                                team4Index: 9,
                                team5Index: 15,
                                team6Index: 14,
                                team7Index: 6,
                                team8Index: 11,
                                team9Index: 1,
                                team10Index: 8,
                                team11Index: 0,
                                team12Index: 4,
                                team13Index: 19,
                                team14Index: 10,
                                team15Index: 3,
                                team16Index: 18,
                                team17Index: 2,
                                team18Index: 16,
                                team19Index: 7,
                                team20Index: 17,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw22CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 22
                            ? await model.makingTableD1(
                                gw: model.gw22D1,
                                team1Index: 18,
                                team2Index: 2,
                                team3Index: 16,
                                team4Index: 7,
                                team5Index: 12,
                                team6Index: 17,
                                team7Index: 19,
                                team8Index: 3,
                                team9Index: 4,
                                team10Index: 10,
                                team11Index: 8,
                                team12Index: 0,
                                team13Index: 1,
                                team14Index: 11,
                                team15Index: 14,
                                team16Index: 16,
                                team17Index: 13,
                                team18Index: 15,
                                team19Index: 5,
                                team20Index: 9,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw23CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 23
                            ? await model.makingTableD1(
                                gw: model.gw23D1,
                                team1Index: 1,
                                team2Index: 14,
                                team3Index: 15,
                                team4Index: 9,
                                team5Index: 6,
                                team6Index: 13,
                                team7Index: 5,
                                team8Index: 12,
                                team9Index: 0,
                                team10Index: 11,
                                team11Index: 10,
                                team12Index: 8,
                                team13Index: 3,
                                team14Index: 4,
                                team15Index: 2,
                                team16Index: 19,
                                team17Index: 7,
                                team18Index: 18,
                                team19Index: 17,
                                team20Index: 16,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw24CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 24
                            ? await model.makingTableD1(
                                gw: model.gw24D1,
                                team1Index: 8,
                                team2Index: 3,
                                team3Index: 17,
                                team4Index: 18,
                                team5Index: 19,
                                team6Index: 7,
                                team7Index: 2,
                                team8Index: 4,
                                team9Index: 12,
                                team10Index: 16,
                                team11Index: 10,
                                team12Index: 11,
                                team13Index: 14,
                                team14Index: 0,
                                team15Index: 1,
                                team16Index: 13,
                                team17Index: 9,
                                team18Index: 6,
                                team19Index: 5,
                                team20Index: 15,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw25CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 25
                            ? await model.makingTableD1(
                                gw: model.gw25D1,
                                team1Index: 3,
                                team2Index: 11,
                                team3Index: 5,
                                team4Index: 6,
                                team5Index: 1,
                                team6Index: 9,
                                team7Index: 0,
                                team8Index: 13,
                                team9Index: 14,
                                team10Index: 10,
                                team11Index: 15,
                                team12Index: 12,
                                team13Index: 2,
                                team14Index: 8,
                                team15Index: 7,
                                team16Index: 4,
                                team17Index: 17,
                                team18Index: 19,
                                team19Index: 16,
                                team20Index: 18,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw26CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 26
                            ? await model.makingTableD1(
                                gw: model.gw26D1,
                                team1Index: 13,
                                team2Index: 10,
                                team3Index: 19,
                                team4Index: 16,
                                team5Index: 4,
                                team6Index: 17,
                                team7Index: 8,
                                team8Index: 7,
                                team9Index: 11,
                                team10Index: 2,
                                team11Index: 14,
                                team12Index: 3,
                                team13Index: 12,
                                team14Index: 18,
                                team15Index: 9,
                                team16Index: 0,
                                team17Index: 5,
                                team18Index: 1,
                                team19Index: 6,
                                team20Index: 15,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw27CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 27
                            ? await model.makingTableD1(
                                gw: model.gw27D1,
                                team1Index: 17,
                                team2Index: 8,
                                team3Index: 1,
                                team4Index: 15,
                                team5Index: 0,
                                team6Index: 5,
                                team7Index: 10,
                                team8Index: 9,
                                team9Index: 3,
                                team10Index: 13,
                                team11Index: 2,
                                team12Index: 14,
                                team13Index: 7,
                                team14Index: 11,
                                team15Index: 6,
                                team16Index: 12,
                                team17Index: 16,
                                team18Index: 4,
                                team19Index: 18,
                                team20Index: 19,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw28CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 28
                            ? await model.makingTableD1(
                                gw: model.gw28D1,
                                team1Index: 15,
                                team2Index: 6,
                                team3Index: 8,
                                team4Index: 16,
                                team5Index: 11,
                                team6Index: 17,
                                team7Index: 14,
                                team8Index: 7,
                                team9Index: 13,
                                team10Index: 2,
                                team11Index: 9,
                                team12Index: 3,
                                team13Index: 5,
                                team14Index: 10,
                                team15Index: 12,
                                team16Index: 19,
                                team17Index: 6,
                                team18Index: 1,
                                team19Index: 4,
                                team20Index: 18,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw29CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 29
                            ? await model.makingTableD1(
                                gw: model.gw29D1,
                                team1Index: 19,
                                team2Index: 4,
                                team3Index: 1,
                                team4Index: 12,
                                team5Index: 18,
                                team6Index: 8,
                                team7Index: 16,
                                team8Index: 11,
                                team9Index: 17,
                                team10Index: 14,
                                team11Index: 7,
                                team12Index: 13,
                                team13Index: 2,
                                team14Index: 9,
                                team15Index: 3,
                                team16Index: 5,
                                team17Index: 10,
                                team18Index: 15,
                                team19Index: 0,
                                team20Index: 6,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw30CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 30
                            ? await model.makingTableD1(
                                gw: model.gw30D1,
                                team1Index: 1,
                                team2Index: 0,
                                team3Index: 8,
                                team4Index: 19,
                                team5Index: 11,
                                team6Index: 18,
                                team7Index: 10,
                                team8Index: 16,
                                team9Index: 13,
                                team10Index: 17,
                                team11Index: 9,
                                team12Index: 7,
                                team13Index: 5,
                                team14Index: 2,
                                team15Index: 15,
                                team16Index: 3,
                                team17Index: 6,
                                team18Index: 10,
                                team19Index: 12,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw31CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 31
                            ? await model.makingTableD1(
                                gw: model.gw31D1,
                                team1Index: 19,
                                team2Index: 11,
                                team3Index: 4,
                                team4Index: 8,
                                team5Index: 0,
                                team6Index: 12,
                                team7Index: 18,
                                team8Index: 4,
                                team9Index: 16,
                                team10Index: 13,
                                team11Index: 17,
                                team12Index: 9,
                                team13Index: 7,
                                team14Index: 5,
                                team15Index: 2,
                                team16Index: 15,
                                team17Index: 3,
                                team18Index: 6,
                                team19Index: 10,
                                team20Index: 1,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw32CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 32
                            ? await model.makingTableD1(
                                gw: model.gw32D1,
                                team1Index: 6,
                                team2Index: 2,
                                team3Index: 0,
                                team4Index: 10,
                                team5Index: 1,
                                team6Index: 3,
                                team7Index: 12,
                                team8Index: 8,
                                team9Index: 15,
                                team10Index: 7,
                                team11Index: 5,
                                team12Index: 17,
                                team13Index: 9,
                                team14Index: 16,
                                team15Index: 13,
                                team16Index: 18,
                                team17Index: 14,
                                team18Index: 19,
                                team19Index: 11,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw33CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 33
                            ? await model.makingTableD1(
                                gw: model.gw33D1,
                                team1Index: 18,
                                team2Index: 9,
                                team3Index: 8,
                                team4Index: 11,
                                team5Index: 4,
                                team6Index: 14,
                                team7Index: 19,
                                team8Index: 13,
                                team9Index: 10,
                                team10Index: 12,
                                team11Index: 16,
                                team12Index: 5,
                                team13Index: 17,
                                team14Index: 15,
                                team15Index: 7,
                                team16Index: 6,
                                team17Index: 1,
                                team18Index: 2,
                                team19Index: 3,
                                team20Index: 0,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw34CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 34
                            ? await model.makingTableD1(
                                gw: model.gw34D1,
                                team1Index: 15,
                                team2Index: 16,
                                team3Index: 10,
                                team4Index: 3,
                                team5Index: 0,
                                team6Index: 2,
                                team7Index: 1,
                                team8Index: 7,
                                team9Index: 6,
                                team10Index: 17,
                                team11Index: 12,
                                team12Index: 11,
                                team13Index: 5,
                                team14Index: 18,
                                team15Index: 9,
                                team16Index: 19,
                                team17Index: 13,
                                team18Index: 4,
                                team19Index: 14,
                                team20Index: 8,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw35CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 35
                            ? await model.makingTableD1(
                                gw: model.gw35D1,
                                team1Index: 16,
                                team2Index: 6,
                                team3Index: 8,
                                team4Index: 13,
                                team5Index: 11,
                                team6Index: 14,
                                team7Index: 4,
                                team8Index: 9,
                                team9Index: 19,
                                team10Index: 5,
                                team11Index: 18,
                                team12Index: 15,
                                team13Index: 3,
                                team14Index: 12,
                                team15Index: 17,
                                team16Index: 1,
                                team17Index: 7,
                                team18Index: 0,
                                team19Index: 2,
                                team20Index: 10,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw36CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 36
                            ? await model.makingTableD1(
                                gw: model.gw36D1,
                                team1Index: 3,
                                team2Index: 2,
                                team3Index: 10,
                                team4Index: 7,
                                team5Index: 0,
                                team6Index: 17,
                                team7Index: 1,
                                team8Index: 16,
                                team9Index: 6,
                                team10Index: 18,
                                team11Index: 15,
                                team12Index: 19,
                                team13Index: 12,
                                team14Index: 14,
                                team15Index: 9,
                                team16Index: 8,
                                team17Index: 13,
                                team18Index: 11,
                                team19Index: 5,
                                team20Index: 4,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw37CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 37
                            ? await model.makingTableD1(
                                gw: model.gw37D1,
                                team1Index: 17,
                                team2Index: 10,
                                team3Index: 7,
                                team4Index: 3,
                                team5Index: 11,
                                team6Index: 9,
                                team7Index: 8,
                                team8Index: 5,
                                team9Index: 4,
                                team10Index: 15,
                                team11Index: 19,
                                team12Index: 6,
                                team13Index: 18,
                                team14Index: 1,
                                team15Index: 14,
                                team16Index: 13,
                                team17Index: 0,
                                team18Index: 16,
                                team19Index: 2,
                                team20Index: 12,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      } else if (model.gw38CurrentD1) {
                        model.allDivOneTeams[0].matchesPlayed != 38
                            ? await model.makingTableD1(
                                gw: model.gw38D1,
                                team1Index: 2,
                                team2Index: 7,
                                team3Index: 3,
                                team4Index: 17,
                                team5Index: 10,
                                team6Index: 16,
                                team7Index: 0,
                                team8Index: 18,
                                team9Index: 1,
                                team10Index: 19,
                                team11Index: 6,
                                team12Index: 4,
                                team13Index: 8,
                                team14Index: 15,
                                team15Index: 5,
                                team16Index: 11,
                                team17Index: 12,
                                team18Index: 13,
                                team19Index: 9,
                                team20Index: 14,
                              )
                            : _isDone = true;
                        await model.getTeamsDivOneData();
                      }
                    } else {
                      null;
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

SnackBar snack(String title, Color color) {
  return SnackBar(
    content: Text('$title', style: SharedFonts.subWhiteFont),
    backgroundColor: color,
    duration: Duration(seconds: 3),
  );
}
