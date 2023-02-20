import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/current_player_gw_point_model.dart';
import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/player_gw_points.dart';
import 'package:fantasy_elrokn/models/player_info_model.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:fantasy_elrokn/models/team_points_model.dart';

import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

mixin MatchesFixtureController on Model {
  int _currentEvent = 0;
  int get currentEvent => _currentEvent;

  List<TeamTableModel> _divOneTeams = [];

  List<GWPointsModel> gwPoints = [];

  num _playerOfWeek = 0;
  num get playerOfWeek => _playerOfWeek;

  List<num> _players = [];

  List<String> _playersName = [];

  List<String> _playerOfWeekName = [];
  List<String> get playerOfWeekName => _playerOfWeekName;

  List<String> _teamOfWeekName = [];
  List<String> get teamOfWeekName => _teamOfWeekName;

  num _teamOfWeek = 0;
  num get teamOfWeek => _teamOfWeek;

  List<num> _playersLast = [];

  List<String> _playersNameLast = [];

  List<String> _playerOfWeekNameLast = [];
  List<String> get playerOfWeekNameLast => _playerOfWeekNameLast;

  List<String> _teamOfWeekNameLast = [];
  List<String> get teamOfWeekNameLast => _teamOfWeekNameLast;

  num _playerOfWeekLast = 0;
  num get playerOfWeekLast => _playerOfWeekLast;

  num _teamOfWeekLast = 0;
  num get teamOfWeekLast => _teamOfWeekLast;

  List<MatchGWModel> _gw1 = [];
  List<MatchGWModel> get gw1 => _gw1;

  List<MatchGWModel> _gw2 = [];
  List<MatchGWModel> get gw2 => _gw2;

  List<MatchGWModel> _gw3 = [];
  List<MatchGWModel> get gw3 => _gw3;

  List<MatchGWModel> _gw4 = [];
  List<MatchGWModel> get gw4 => _gw4;

  List<MatchGWModel> _gw5 = [];
  List<MatchGWModel> get gw5 => _gw5;

  List<MatchGWModel> _gw6 = [];
  List<MatchGWModel> get gw6 => _gw6;

  List<MatchGWModel> _gw7 = [];
  List<MatchGWModel> get gw7 => _gw7;

  List<MatchGWModel> _gw8 = [];
  List<MatchGWModel> get gw8 => _gw8;

  List<MatchGWModel> _gw9 = [];
  List<MatchGWModel> get gw9 => _gw9;

  List<MatchGWModel> _gw10 = [];
  List<MatchGWModel> get gw10 => _gw10;

  List<MatchGWModel> _gw11 = [];
  List<MatchGWModel> get gw11 => _gw11;

  List<MatchGWModel> _gw12 = [];
  List<MatchGWModel> get gw12 => _gw12;

  List<MatchGWModel> _gw13 = [];
  List<MatchGWModel> get gw13 => _gw13;

  List<MatchGWModel> _gw14 = [];
  List<MatchGWModel> get gw14 => _gw14;

  List<MatchGWModel> _gw15 = [];
  List<MatchGWModel> get gw15 => _gw15;

  List<MatchGWModel> _gw16 = [];
  List<MatchGWModel> get gw16 => _gw16;

  List<MatchGWModel> _gw17 = [];
  List<MatchGWModel> get gw17 => _gw17;

  List<MatchGWModel> _gw18 = [];
  List<MatchGWModel> get gw18 => _gw18;

  List<MatchGWModel> _gw19 = [];
  List<MatchGWModel> get gw19 => _gw19;

  List<MatchGWModel> _gw20 = [];
  List<MatchGWModel> get gw20 => _gw20;

  List<MatchGWModel> _gw21 = [];
  List<MatchGWModel> get gw21 => _gw21;

  List<MatchGWModel> _gw22 = [];
  List<MatchGWModel> get gw22 => _gw22;

  List<MatchGWModel> _gw23 = [];
  List<MatchGWModel> get gw23 => _gw23;

  List<MatchGWModel> _gw24 = [];
  List<MatchGWModel> get gw24 => _gw24;

  List<MatchGWModel> _gw25 = [];
  List<MatchGWModel> get gw25 => _gw25;

  List<MatchGWModel> _gw26 = [];
  List<MatchGWModel> get gw26 => _gw26;

  List<MatchGWModel> _gw27 = [];
  List<MatchGWModel> get gw27 => _gw27;

  List<MatchGWModel> _gw28 = [];
  List<MatchGWModel> get gw28 => _gw28;

  List<MatchGWModel> _gw29 = [];
  List<MatchGWModel> get gw29 => _gw29;

  List<MatchGWModel> _gw30 = [];
  List<MatchGWModel> get gw30 => _gw30;

  List<MatchGWModel> _gw31 = [];
  List<MatchGWModel> get gw31 => _gw31;

  List<MatchGWModel> _gw32 = [];
  List<MatchGWModel> get gw32 => _gw32;

  List<MatchGWModel> _gw33 = [];
  List<MatchGWModel> get gw33 => _gw33;

  List<MatchGWModel> _gw34 = [];
  List<MatchGWModel> get gw34 => _gw34;

  List<MatchGWModel> _gw35 = [];
  List<MatchGWModel> get gw35 => _gw35;

  List<MatchGWModel> _gw36 = [];
  List<MatchGWModel> get gw36 => _gw36;

  List<MatchGWModel> _gw37 = [];
  List<MatchGWModel> get gw37 => _gw37;

  List<MatchGWModel> _gw38 = [];
  List<MatchGWModel> get gw38 => _gw38;

  List _teamsPoints = [];
  List get teamsPoints => _teamsPoints;

  bool isNull = true;

  bool _isDataNull = true;

  bool gw1Current = false;
  bool gw2Current = false;
  bool gw3Current = false;
  bool gw4Current = false;
  bool gw5Current = false;
  bool gw6Current = false;
  bool gw7Current = false;
  bool gw8Current = false;
  bool gw9Current = false;
  bool gw10Current = false;
  bool gw11Current = false;
  bool gw12Current = false;
  bool gw13Current = false;
  bool gw14Current = false;
  bool gw15Current = false;
  bool gw16Current = false;
  bool gw17Current = false;
  bool gw18Current = false;
  bool gw19Current = false;
  bool gw20Current = false;
  bool gw21Current = false;
  bool gw22Current = false;
  bool gw23Current = false;
  bool gw24Current = false;
  bool gw25Current = false;
  bool gw26Current = false;
  bool gw27Current = false;
  bool gw28Current = false;
  bool gw29Current = false;
  bool gw30Current = false;
  bool gw31Current = false;
  bool gw32Current = false;
  bool gw33Current = false;
  bool gw34Current = false;
  bool gw35Current = false;
  bool gw36Current = false;
  bool gw37Current = false;
  bool gw38Current = false;

  List<TeamPlayersModel> _teamPlayers = [];
  List _allPlayersId = [];

  List<PlayerInfoModel> _previousPlayerInfo = [];
  List<PlayerInfoModel> get previousPlayerInfo => _previousPlayerInfo;

  List<PlayerInfoModel> _toGetCurrentEvent = [];

  List<CurrentPlayerGwPoints> _livePlayerPoints = [];

  List<PlayerGwPoints> _previousPlayerPoints = [];

  num _points = 0;

  bool _isteamPlayersNull = false;

  List<num> _totalCurrentGWPoints = [];
  List<num> get totalCurrentGWPoints => _totalCurrentGWPoints;

  List<num> _totalLastGWPoints = [];
  List<num> get totalLastGWPoints => _totalLastGWPoints;

  Future<void> getTeamsDivOneTeams() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsDivOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _divOneTeams.add(TeamTableModel.fromjson(v));
          isNull = false;
          notifyListeners();
        },
      );
    } else {
      isNull = true;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> gameweekCreation() async {
    await getTeamsDivOneTeams();
    await getTeamsData();
      await getCurrentGWData();
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[19].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[0],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[19],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[7].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[12],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[7],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[10].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[18],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[10],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[6].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[8],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[6],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[2].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[17],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[2],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[15].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[11],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[15],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[16].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[3],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[16],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[1].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[4],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[1],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[14].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[5],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[14],
    ));
    _gw1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[13].teamName],
      team0Result: gw1Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[9],
      team1Result: gw1Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.isEmpty
              ? 0
              : _teamsPoints[0].gwPoints[13],
    ));
    notifyListeners();

    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[13].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[5],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[13],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[9].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[12],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[9],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[14].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[15],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[14],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[11].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[6],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[11],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[8].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[1],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[8],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[4].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[0],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[4],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[10].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[19],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[10],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[18].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[3],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[18],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[16].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[2],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[16],
    ));
    _gw2.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[17].teamName],
      team0Result: gw2Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[7],
      team1Result: gw2Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 2
              ? 0
              : _teamsPoints[1].gwPoints[15],
    ));
    notifyListeners();

    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[2].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[18],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[2],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[7].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[16],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[7],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[17].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[12],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[17],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[3].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[19],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[3],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[10].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[10],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[4],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[0].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[8],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[0],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[11].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[1],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[11],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[16].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[14],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[16],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[15].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[13],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[15],
    ));
    _gw3.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[9].teamName],
      team0Result: gw3Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[5],
      team1Result: gw3Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 3
              ? 0
              : _teamsPoints[2].gwPoints[9],
    ));
    notifyListeners();

    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[14].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[1],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[14],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[9].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[15],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[9],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[13].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[6],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[13],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[12].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[5],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[12],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[11].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[0],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[11],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[8].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[10],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[8],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[4].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[3],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[4],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[19].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[2],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[19],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[18].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[7],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[18],
    ));
    _gw4.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[16].teamName],
      team0Result: gw4Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[17],
      team1Result: gw4Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 4
              ? 0
              : _teamsPoints[3].gwPoints[16],
    ));
    notifyListeners();

    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[3].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[8],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[3],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[18].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[17],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[18],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[7].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[19],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[7],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[4].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[2],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[4],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[16].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[12],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[16],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[11].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[10],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[11],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[0].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[14],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[0],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[13].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[1],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[13],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[6].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[9],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[6],
    ));
    _gw5.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[15].teamName],
      team0Result: gw5Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[5],
      team1Result: gw5Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 5
              ? 0
              : _teamsPoints[4].gwPoints[15],
    ));
    notifyListeners();

    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[11].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[3],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[11],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[6].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[5],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[6],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[9].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[1],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[9],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[13].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[0],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[13],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[10].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[14],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[10],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[12].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[15],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[12],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[8].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[2],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[8],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[4].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[7],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[4],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[19].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[17],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[19],
    ));
    _gw6.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[18].teamName],
      team0Result: gw6Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[16],
      team1Result: gw6Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 6
              ? 0
              : _teamsPoints[5].gwPoints[18],
    ));
    notifyListeners();

    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[10].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[13],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[10],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[16].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[19],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[16],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[17].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[4],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[17],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[7].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[8],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[7],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[2].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[11],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[2],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[3].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[14],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[3],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[18].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[12],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[18],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[0].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[9],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[0],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[1].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[5],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[1],
    ));
    _gw7.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[15].teamName],
      team0Result: gw7Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[6],
      team1Result: gw7Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[15],
    ));
    notifyListeners();

    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[8].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[17],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[8],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[15].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[1],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[15],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[5].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[0],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[5],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[9].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[10],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[9],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[13].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[3],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[13],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[14].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[2],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[14],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[11].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[7],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[11],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[12].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[6],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[12],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[4].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[16],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[4],
    ));
    _gw8.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[19].teamName],
      team0Result: gw8Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[18],
      team1Result: gw8Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 8
              ? 0
              : _teamsPoints[7].gwPoints[19],
    ));
    notifyListeners();

    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[0].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[15],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[0],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[16].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[8],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[16],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[17].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[11],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[17],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[7].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[14],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[7],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[2].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[13],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[12],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[3].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[9],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[3],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[10].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[5],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[10],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[19].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[12],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[19],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[1].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[6],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[1],
    ));
    _gw9.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[18].teamName],
      team0Result: gw9Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[4],
      team1Result: gw9Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 9
              ? 0
              : _teamsPoints[8].gwPoints[18],
    ));
    notifyListeners();

    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[4].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[19],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[4],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[12].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[1],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[12],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[8].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[18],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[8],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[11].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[16],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[11],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[14].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[17],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[14],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[13].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[7],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[13],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[9].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[2],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[9],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[5].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[3],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[5],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[15].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[10],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[15],
    ));
    _gw10.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[6].teamName],
      team0Result: gw10Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[0],
      team1Result: gw10Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 10
              ? 0
              : _teamsPoints[9].gwPoints[6],
    ));
    notifyListeners();

    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[0].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[1],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[0],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[19].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[8],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[19],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[18].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[11],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[18],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[10],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[16],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[17].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[13],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[17],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[7].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[9],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[7],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[2].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[5],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[2],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[3].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[15],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[3],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[10].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[6],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[10],
    ));
    _gw11.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[4].teamName],
      team0Result: gw11Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[12],
      team1Result: gw11Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 11
              ? 0
              : _teamsPoints[10].gwPoints[4],
    ));

    notifyListeners();

    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[11].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[19],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[11],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[8].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[4],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[8],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[12].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[0],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[12],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[14].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[18],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[14],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[13].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[16],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[13],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[9].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[17],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[9],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[5].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[7],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[5],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[15].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[2],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[15],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[6].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[3],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[6],
    ));
    _gw12.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[1].teamName],
      team0Result: gw12Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[10],
      team1Result: gw12Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 12
              ? 0
              : _teamsPoints[11].gwPoints[1],
    ));

    notifyListeners();

    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[2].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[6],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[2],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[10].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[0],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[10],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[3].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[1],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[3],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[8].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[12],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[8],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[7].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[15],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[7],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[17].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[5],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[17],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[16].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[9],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[16],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[18].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[13],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[18],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[19].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[14],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[19],
    ));
    _gw13.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[4].teamName],
      team0Result: gw13Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[11],
      team1Result: gw13Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 13
              ? 0
              : _teamsPoints[12].gwPoints[4],
    ));

    notifyListeners();

    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[9].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[18],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[9],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[11].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[8],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[11],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[14].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[4],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[14],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[13].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[19],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[13],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[12].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[10],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[12],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[5].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[16],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[5],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[15].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[17],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[15],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[6].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[7],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[6],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[2].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[1],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[2],
    ));
    _gw14.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[0].teamName],
      team0Result: gw14Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[3],
      team1Result: gw14Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 14
              ? 0
              : _teamsPoints[13].gwPoints[0],
    ));
    notifyListeners();

    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[16].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[15],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[16],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[3].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[10],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[3],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[2].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[0],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[2],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[7].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[1],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[7],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[17].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[6],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[17],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[11].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[12],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[11],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[18].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[5],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[18],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[19].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[9],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[19],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[4].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[13],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[4],
    ));
    _gw15.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[8].teamName],
      team0Result: gw15Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[14],
      team1Result: gw15Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 15
              ? 0
              : _teamsPoints[14].gwPoints[8],
    ));
    notifyListeners();

    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[6].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[16],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[6],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[13].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[8],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[13],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[14].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[11],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[14],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[9].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[4],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[9],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[5].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[19],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[5],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[15].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[18],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[15],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[12].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[3],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[12],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[1].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[17],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[1],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[0].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[7],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[0],
    ));
    _gw16.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[10].teamName],
      team0Result: gw16Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[2],
      team1Result: gw16Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 16
              ? 0
              : _teamsPoints[15].gwPoints[10],
    ));
    notifyListeners();

    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[2].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[3],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[2],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[7].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[10],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[7],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[17].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[0],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[17],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[16].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[1],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[16],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[18].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[6],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[18],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[19].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[15],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[19],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[14].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[12],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[14],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[8].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[9],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[8],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[11].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[13],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[14],
    ));
    _gw17.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[4].teamName],
      team0Result: gw17Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[5],
      team1Result: gw17Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 17
              ? 0
              : _teamsPoints[16].gwPoints[4],
    ));
    notifyListeners();

    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[10].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[17],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[10],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[3].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[7],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[3],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[9].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[11],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[9],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[5].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[8],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[5],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[15].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[4],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[15],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[6].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[19],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[6],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[1].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[18],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[1],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[13].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[14],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[13],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[16].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[0],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[16],
    ));
    _gw18.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[12].teamName],
      team0Result: gw18Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[2],
      team1Result: gw18Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 18
              ? 0
              : _teamsPoints[17].gwPoints[12],
    ));
    notifyListeners();

    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[7].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[2],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[7],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[17].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[3],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[17],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[10],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[16],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[18].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[0],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[18],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[19].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[1],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[19],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[4].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[6],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[4],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[15].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[8],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[15],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[11].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[5],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[11],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[13].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[12],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[13],
    ));
    _gw19.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[14].teamName],
      team0Result: gw19Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[9],
      team1Result: gw19Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 19
              ? 0
              : _teamsPoints[18].gwPoints[14],
    ));
    notifyListeners();

    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[19].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[0],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[19],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[7].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[12],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[7],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[10].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[18],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[10],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[6].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[8],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[6],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[2].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[17],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[2],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[15].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[11],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[15],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[16].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[3],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[16],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[1].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[4],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[1],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[14].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[5],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[14],
    ));
    _gw20.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[13].teamName],
      team0Result: gw20Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[9],
      team1Result: gw20Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 20
              ? 0
              : _teamsPoints[19].gwPoints[13],
    ));
    notifyListeners();

    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[13].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[5],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[13],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[9].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[12],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[9],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[14].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[15],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[14],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[11].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[6],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[11],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[8].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[1],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[8],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[4].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[0],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[4],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[10].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[19],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[10],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[18].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[3],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[18],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[16].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[2],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[16],
    ));
    _gw21.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[17].teamName],
      team0Result: gw21Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[7],
      team1Result: gw21Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 21
              ? 0
              : _teamsPoints[20].gwPoints[15],
    ));
    notifyListeners();

    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[2].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[18],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[2],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[7].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[16],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[7],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[17].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[12],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[17],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[3].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[19],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[3],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[10].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[10],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[4],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[0].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[8],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[0],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[11].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[1],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[11],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[16].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[14],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[16],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[15].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[13],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[15],
    ));
    _gw22.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[9].teamName],
      team0Result: gw22Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[5],
      team1Result: gw22Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 22
              ? 0
              : _teamsPoints[21].gwPoints[9],
    ));
    notifyListeners();

    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[14].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[1],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[14],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[9].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[15],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[9],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[13].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[6],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[13],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[12].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[5],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[12],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[11].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[0],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[11],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[8].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[10],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[8],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[4].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[3],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[4],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[19].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[2],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[19],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[18].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[7],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[18],
    ));
    _gw23.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[16].teamName],
      team0Result: gw23Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[17],
      team1Result: gw23Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 23
              ? 0
              : _teamsPoints[22].gwPoints[16],
    ));
    notifyListeners();

    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[3].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[8],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[3],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[18].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[17],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[18],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[7].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[19],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[7],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[4].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[2],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[4],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[16].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[12],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[16],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[11].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[10],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[11],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[0].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[14],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[0],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[13].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[1],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[13],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[6].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[9],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[6],
    ));
    _gw24.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[15].teamName],
      team0Result: gw24Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[5],
      team1Result: gw24Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 24
              ? 0
              : _teamsPoints[23].gwPoints[15],
    ));
    notifyListeners();

    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[11].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[3],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[11],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[6].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[5],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[6],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[9].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[1],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[9],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[13].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[0],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[13],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[10].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[14],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[10],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[12].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[15],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[12],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[8].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[2],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[8],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[4].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[7],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[4],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[19].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[17],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[19],
    ));
    _gw25.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[18].teamName],
      team0Result: gw25Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[16],
      team1Result: gw25Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 25
              ? 0
              : _teamsPoints[24].gwPoints[18],
    ));
    notifyListeners();

    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[10].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[13],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[10],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[16].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[19],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[16],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[17].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[4],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[17],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[7].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[8],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[7],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[2].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[11],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[2],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[3].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[14],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[3],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[18].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[12],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[18],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[0].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[9],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[0],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[1].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[5],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[1],
    ));
    _gw26.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[15].teamName],
      team0Result: gw26Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[6],
      team1Result: gw26Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 26
              ? 0
              : _teamsPoints[25].gwPoints[15],
    ));
    notifyListeners();

    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[8].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[17],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[8],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[15].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[1],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[15],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[5].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[0],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[5],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[9].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[10],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[9],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[13].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[3],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[13],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[14].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[2],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[14],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[11].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[7],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[11],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[12].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[6],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[12],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[4].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[16],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[4],
    ));
    _gw27.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[19].teamName],
      team0Result: gw27Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[18],
      team1Result: gw27Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 27
              ? 0
              : _teamsPoints[26].gwPoints[19],
    ));
    notifyListeners();

    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[0].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[15],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[0],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[16].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[8],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[16],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[17].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[11],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[17],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[7].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[14],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[7],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[2].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[13],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[12],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[3].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[9],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[3],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[10].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[5],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[10],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[19].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[12],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[19],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[1].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[6],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[1],
    ));
    _gw28.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[18].teamName],
      team0Result: gw28Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[4],
      team1Result: gw28Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 28
              ? 0
              : _teamsPoints[27].gwPoints[18],
    ));
    notifyListeners();

    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[4].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[19],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[4],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[12].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[1],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[12],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[8].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[18],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[8],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[11].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[16],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[11],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[14].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[17],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[14],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[13].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[7],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[13],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[9].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[2],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[9],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[5].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[3],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[5],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[15].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[10],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[15],
    ));
    _gw29.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[6].teamName],
      team0Result: gw29Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[0],
      team1Result: gw29Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 29
              ? 0
              : _teamsPoints[28].gwPoints[6],
    ));
    notifyListeners();

    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[0].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[1],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[0],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[19].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[8],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[19],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[18].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[11],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[18],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[10],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[16],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[17].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[13],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[17],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[7].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[9],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[7],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[2].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[5],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[2],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[3].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[15],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[3],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[10].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[6],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[10],
    ));
    _gw30.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[4].teamName],
      team0Result: gw30Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[12],
      team1Result: gw30Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 30
              ? 0
              : _teamsPoints[29].gwPoints[4],
    ));

    notifyListeners();

    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[11].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[19],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[11],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[8].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[4],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[8],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[12].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[0],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[12],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[14].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[18],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[14],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[13].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[16],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[13],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[9].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[17],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[9],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[5].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[7],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[5],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[15].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[2],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[15],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[6].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[3],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[6],
    ));
    _gw31.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[1].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[10],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[1],
    ));

    notifyListeners();

    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[2].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[6],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[2],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[10].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[0],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[10],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[3].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[1],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[3],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[8].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[12],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[8],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[7].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[15],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[7],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[17].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[5],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[17],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[16].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[9],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[16],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[18].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[13],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[18],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[19].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[14],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[19],
    ));
    _gw32.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[4].teamName],
      team0Result: gw31Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[11],
      team1Result: gw31Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 31
              ? 0
              : _teamsPoints[30].gwPoints[4],
    ));

    notifyListeners();

    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[9].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[18],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[9],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[11].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[8],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[11],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[14].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[4],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[14],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[13].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[19],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[13],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[12].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[10],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[12],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[5].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[16],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[5],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[15].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[17],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[15],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[6].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[7],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[6],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[2].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[1],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[2],
    ));
    _gw33.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[0].teamName],
      team0Result: gw33Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[3],
      team1Result: gw33Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 33
              ? 0
              : _teamsPoints[32].gwPoints[0],
    ));
    notifyListeners();

    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[16].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[15],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[16],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[3].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[10],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[3],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[2].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[0],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[2],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[7].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[1],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[7],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[17].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[6],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[17],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[11].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[12],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[11],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[18].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[5],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[18],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[19].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[9],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[19],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[4].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[13],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[4],
    ));
    _gw34.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[8].teamName],
      team0Result: gw34Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[14],
      team1Result: gw34Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 34
              ? 0
              : _teamsPoints[33].gwPoints[8],
    ));
    notifyListeners();

    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[6].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[16],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[6],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[13].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[8],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[13],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[14].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[11],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[14],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[9].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[4],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[9],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[5].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[19],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[5],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[15].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[18],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[15],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[12].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[3],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[12],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[1].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[17],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[1],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[0].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[7],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[0],
    ));
    _gw35.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[10].teamName],
      team0Result: gw35Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[2],
      team1Result: gw35Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 35
              ? 0
              : _teamsPoints[34].gwPoints[10],
    ));
    notifyListeners();

    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[2].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[3],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[2],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[7].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[10],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[7],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[17].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[0],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[17],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[16].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[1],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[16],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[18].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[6],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[18],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[19].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[15],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[19],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[14].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[12],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[14],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[8].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[9],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[8],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[11].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[13],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[14],
    ));
    _gw36.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[4].teamName],
      team0Result: gw36Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[5],
      team1Result: gw36Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 36
              ? 0
              : _teamsPoints[35].gwPoints[4],
    ));
    notifyListeners();

    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[10].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[17],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[10],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[3].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[7],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[3],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[9].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[11],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[9],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[5].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[8],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[5],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[15].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[4],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[15],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[6].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[19],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[6],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[1].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[18],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[1],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[13].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[14],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[13],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[16].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[0],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[16],
    ));
    _gw37.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[12].teamName],
      team0Result: gw37Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[2],
      team1Result: gw37Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 37
              ? 0
              : _teamsPoints[36].gwPoints[12],
    ));
    notifyListeners();

    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[7].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[2]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[2],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[7]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[7],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[17].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[3]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[3],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[17]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[17],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[10]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[10],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[16]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[16],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[18].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[0]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[0],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[18]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[18],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[19].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[1]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[1],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[19]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[19],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[4].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[6]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[6],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[4]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[4],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[15].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[8]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[8],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[15]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[15],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[11].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[5]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[5],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[11]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[11],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[13].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[12]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[12],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[13]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[13],
    ));
    _gw38.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[14].teamName],
      team0Result: gw38Current
          ? _totalCurrentGWPoints[9]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[9],
      team1Result: gw38Current
          ? _totalCurrentGWPoints[14]
          : _teamsPoints.length < 38
              ? 0
              : _teamsPoints[37].gwPoints[14],
    ));
    notifyListeners();
  }

  Future<void> getIdsForTeamPoints() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _teamPlayers.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
      _teamPlayers.sort((a, b) => int.parse(a.teamId).compareTo(int.parse(b.teamId)));
    for (int i = 0; i < _teamPlayers.length; i++) {
      _allPlayersId.add(_teamPlayers[i].playersId);
    }
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
    
  }

  Future<void> getPreviousPlayerInfo(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    _previousPlayerInfo.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getLivePlayerPoints(String playerId, String event) async {
    http.Response res = await http.get(
      Uri.parse(
          'https://fantasy.premierleague.com/api/entry/$playerId/event/$event/picks/'),
    );

    var pointsData = json.decode(res.body);
    pointsData['active_chip'] ?? (pointsData['active_chip'] = '');
    pointsData['automatic_subs'] ?? (pointsData['automatic_subs'] = []);
    pointsData['entry_history'] ??
        (pointsData['entry_history'] = {
          "event": 0,
          "points": 0,
          "total_points": 0,
          "rank": 0,
          "rank_sort": 0,
          "overall_rank": 0,
          "bank": 0,
          "value": 0,
          "event_transfers": 0,
          "event_transfers_cost": 0,
          "points_on_bench": 0,
        });
        pointsData['picks'] ?? (pointsData['picks'] = []);

    _livePlayerPoints.add(CurrentPlayerGwPoints.fromjson(pointsData));
    notifyListeners();

  }

  Future<void> getCurrentGWData() async {
    await getIdsForTeamPoints();

    int i = 0;
    for (int x = 0; x < _allPlayersId.length; x++) {
      _points = 0;
      for (int j = 0; j < _allPlayersId[x].length; j++) {
        await getPreviousPlayerInfo(_allPlayersId[x][j].toString());
        await getLivePlayerPoints(_allPlayersId[x][j].toString(),
            (_previousPlayerInfo[i].currentEvent).toString());

            print(_livePlayerPoints[i].entryHistory['points'] -
            _livePlayerPoints[i].entryHistory['event_transfers_cost']);

        _points += _livePlayerPoints[i].entryHistory['points'] -
            _livePlayerPoints[i].entryHistory['event_transfers_cost'];

        _players.add(_livePlayerPoints[i].entryHistory['points'] -
            _livePlayerPoints[i].entryHistory['event_transfers_cost']);

        _playersName.add(
            '${_previousPlayerInfo[i].playerFirstName} ${_previousPlayerInfo[i].playerLastName}');
        i++;
      }
      _totalCurrentGWPoints.add(_points);
      notifyListeners();
    }

    // _playerOfWeek = _players.reduce(max);
    // _teamOfWeek = _totalCurrentGWPoints.reduce(max);
    // notifyListeners();

    // _players.asMap().forEach((index, value) {
    //   if (value == _playerOfWeek) {
    //     _playerOfWeekName.add(_playersName[index]);
    //   }
    // });
    // notifyListeners();

    // _totalCurrentGWPoints.asMap().forEach((index, value) {
    //   if (value == _teamOfWeek) {
    //     _teamOfWeekName.add(_divOneTeams[index].teamName);
    //   }
    // });
    // notifyListeners();

    switch (_previousPlayerInfo[0].currentEvent) {
      case 1:
        gw1Current = true;
        break;
      case 2:
        gw2Current = true;
        break;
      case 3:
        gw3Current = true;
        break;
      case 4:
        gw4Current = true;
        break;
      case 5:
        gw5Current = true;
        break;
      case 6:
        gw6Current = true;
        break;
      case 7:
        gw7Current = true;
        break;
      case 8:
        gw8Current = true;
        break;
      case 9:
        gw9Current = true;
        break;
      case 10:
        gw10Current = true;
        break;
      case 11:
        gw11Current = true;
        break;
      case 12:
        gw12Current = true;
        break;
      case 13:
        gw13Current = true;
        break;
      case 14:
        gw14Current = true;
        break;
      case 15:
        gw15Current = true;
        break;
      case 16:
        gw16Current = true;
        break;
      case 17:
        gw17Current = true;
        break;
      case 18:
        gw18Current = true;
        break;
      case 19:
        gw19Current = true;
        break;
      case 20:
        gw20Current = true;
        break;
      case 21:
        gw21Current = true;
        break;
      case 22:
        gw22Current = true;
        break;
      case 23:
        gw23Current = true;
        break;
      case 24:
        gw24Current = true;
        break;
      case 25:
        gw25Current = true;
        break;
      case 26:
        gw26Current = true;
        break;
      case 27:
        gw27Current = true;
        break;
      case 28:
        gw28Current = true;
        break;
      case 29:
        gw29Current = true;
        break;
      case 30:
        gw30Current = true;
        break;
      case 31:
        gw31Current = true;
        break;
      case 32:
        gw32Current = true;
        break;
      case 33:
        gw33Current = true;
        break;
      case 34:
        gw34Current = true;
        break;
      case 35:
        gw35Current = true;
        break;
      case 36:
        gw36Current = true;
        break;
      case 37:
        gw37Current = true;
        break;
      case 38:
        gw38Current = true;
        break;
      default:
    }
  }

  Future<void> getLastData() async {
    await getIdsForTeamPoints();

    int i = 0;
    for (int x = 0; x < _allPlayersId.length; x++) {
      _points = 0;
      for (int j = 0; j < _allPlayersId[x].length; j++) {
        await getPreviousPlayerInfo(_allPlayersId[x][j].toString());
        await getPreviousPlayerPoints(_allPlayersId[x][j].toString());
        _points += _previousPlayerPoints[i]
                .current[_previousPlayerInfo[i].currentEvent - 2]['points'] -
            _previousPlayerPoints[i]
                    .current[_previousPlayerInfo[i].currentEvent - 2]
                ['event_transfers_cost'];

        _playersLast.add(_previousPlayerPoints[i]
                .current[_previousPlayerInfo[i].currentEvent - 2]['points'] -
            _previousPlayerPoints[i]
                    .current[_previousPlayerInfo[i].currentEvent - 2]
                ['event_transfers_cost']);

        _playersNameLast.add(
            '${_previousPlayerInfo[i].playerFirstName} ${_previousPlayerInfo[i].playerLastName}');
        i++;
      }
      _totalLastGWPoints.add(_points);
      notifyListeners();
    }

    _playerOfWeekLast = _players.reduce(max);
    _teamOfWeekLast = _totalLastGWPoints.reduce(max);
    notifyListeners();

    _playersLast.asMap().forEach((index, value) {
      if (value == _playerOfWeekLast) {
        _playerOfWeekNameLast.add(_playersNameLast[index]);
      }
    });
    notifyListeners();

    _totalLastGWPoints.asMap().forEach((index, value) {
      if (value == _teamOfWeekLast) {
        _teamOfWeekNameLast.add(_divOneTeams[index].teamName);
      }
    });
    notifyListeners();
  }

  Future<void> getTeamsData() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}GWD1PointsData.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _teamsPoints.add(GWPointsModel.fromjson(v));
          notifyListeners();
        },
      );
    }
  }

  Future<bool> addPlayersData(Map<String, dynamic> players) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}GWD1PointsData.json'),
      body: json.encode(players),
    );

    if (response.statusCode == 200) {
      players['id'] = json.decode(response.body)['name'];
      gwPoints.add(GWPointsModel.fromjson(players));
      return true;
    } else {
      return false;
    }
  }

  Future<void> getCurrentEvent() async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/1/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    _toGetCurrentEvent.add(PlayerInfoModel.fromjson(info));

    _currentEvent = _toGetCurrentEvent[0].currentEvent;
    notifyListeners();
  }

  Future<void> getPreviousPlayerPoints(String playerId) async {
    http.Response res = await http.get(
      Uri.parse(
          'https://fantasy.premierleague.com/api/entry/$playerId/history/'),
    );

    var pointsData = json.decode(res.body);

    _previousPlayerPoints.add(PlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }


  // Future<void> makingTable() async{

  //   for (int i = 0; i < _gw1.length*2; i++) {
  //    http.Response response = await http.put(
  //     Uri.parse('${fireBase}teamsDivOne/${_divOneTeams[i].id}.json'),
  //   );

  //   var teamsData = json.encode(); 
  //   }
  // }
}
