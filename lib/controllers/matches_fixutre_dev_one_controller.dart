import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/current_player_gw_point_model.dart';
import 'package:fantasy_elrokn/models/general_info_model.dart';
import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/player_gw_points.dart';
import 'package:fantasy_elrokn/models/player_info_model.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:fantasy_elrokn/models/team_points_model.dart';

import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

mixin MatchesFixtureDevOneController on Model {
  int _currentEvent = 0;
  int get currentEvent => _currentEvent;

  List<TeamTableModel> _divOneTeams = [];

  num _playerOfWeekD1 = 0;
  num get playerOfWeekD1 => _playerOfWeekD1;

  List<num> _players = [];

  List<String> _playersNameD1 = [];

  List<String> _playerOfWeekNameD1 = [];
  List<String> get playerOfWeekNameD1 => _playerOfWeekNameD1;

  List<String> _teamOfWeekNameD1 = [];
  List<String> get teamOfWeekNameD1 => _teamOfWeekNameD1;

  num _teamOfWeekD1 = 0;
  num get teamOfWeekD1 => _teamOfWeekD1;


  List<MatchGWModel> _gw1D1 = [];
  List<MatchGWModel> get gw1D1 => _gw1D1;

  List<MatchGWModel> _gw2D1 = [];
  List<MatchGWModel> get gw2D1 => _gw2D1;

  List<MatchGWModel> _gw3D1 = [];
  List<MatchGWModel> get gw3D1 => _gw3D1;

  List<MatchGWModel> _gw4D1 = [];
  List<MatchGWModel> get gw4D1 => _gw4D1;

  List<MatchGWModel> _gw5D1 = [];
  List<MatchGWModel> get gw5D1 => _gw5D1;

  List<MatchGWModel> _gw6D1 = [];
  List<MatchGWModel> get gw6D1 => _gw6D1;

  List<MatchGWModel> _gw7D1 = [];
  List<MatchGWModel> get gw7D1 => _gw7D1;

  List<MatchGWModel> _gw8D1 = [];
  List<MatchGWModel> get gw8D1 => _gw8D1;

  List<MatchGWModel> _gw9D1 = [];
  List<MatchGWModel> get gw9D1 => _gw9D1;

  List<MatchGWModel> _gw10D1 = [];
  List<MatchGWModel> get gw10D1 => _gw10D1;

  List<MatchGWModel> _gw11D1 = [];
  List<MatchGWModel> get gw11D1 => _gw11D1;

  List<MatchGWModel> _gw12D1 = [];
  List<MatchGWModel> get gw12D1 => _gw12D1;

  List<MatchGWModel> _gw13D1 = [];
  List<MatchGWModel> get gw13D1 => _gw13D1;

  List<MatchGWModel> _gw14D1 = [];
  List<MatchGWModel> get gw14D1 => _gw14D1;

  List<MatchGWModel> _gw15D1 = [];
  List<MatchGWModel> get gw15D1 => _gw15D1;

  List<MatchGWModel> _gw16D1 = [];
  List<MatchGWModel> get gw16D1 => _gw16D1;

  List<MatchGWModel> _gw17D1 = [];
  List<MatchGWModel> get gw17D1 => _gw17D1;

  List<MatchGWModel> _gw18D1 = [];
  List<MatchGWModel> get gw18D1 => _gw18D1;

  List<MatchGWModel> _gw19D1 = [];
  List<MatchGWModel> get gw19D1 => _gw19D1;

  List<MatchGWModel> _gw20D1 = [];
  List<MatchGWModel> get gw20D1 => _gw20D1;

  List<MatchGWModel> _gw21D1 = [];
  List<MatchGWModel> get gw21D1 => _gw21D1;

  List<MatchGWModel> _gw22D1 = [];
  List<MatchGWModel> get gw22D1 => _gw22D1;

  List<MatchGWModel> _gw23D1 = [];
  List<MatchGWModel> get gw23D1 => _gw23D1;

  List<MatchGWModel> _gw24D1 = [];
  List<MatchGWModel> get gw24D1 => _gw24D1;

  List<MatchGWModel> _gw25D1 = [];
  List<MatchGWModel> get gw25D1 => _gw25D1;

  List<MatchGWModel> _gw26D1 = [];
  List<MatchGWModel> get gw26D1 => _gw26D1;

  List<MatchGWModel> _gw27D1 = [];
  List<MatchGWModel> get gw27D1 => _gw27D1;

  List<MatchGWModel> _gw28D1 = [];
  List<MatchGWModel> get gw28D1 => _gw28D1;

  List<MatchGWModel> _gw29D1 = [];
  List<MatchGWModel> get gw29D1 => _gw29D1;

  List<MatchGWModel> _gw30D1 = [];
  List<MatchGWModel> get gw30D1 => _gw30D1;

  List<MatchGWModel> _gw31D1 = [];
  List<MatchGWModel> get gw31D1 => _gw31D1;

  List<MatchGWModel> _gw32D1 = [];
  List<MatchGWModel> get gw32D1 => _gw32D1;

  List<MatchGWModel> _gw33D1 = [];
  List<MatchGWModel> get gw33D1 => _gw33D1;

  List<MatchGWModel> _gw34D1 = [];
  List<MatchGWModel> get gw34D1 => _gw34D1;

  List<MatchGWModel> _gw35D1 = [];
  List<MatchGWModel> get gw35D1 => _gw35D1;

  List<MatchGWModel> _gw36D1 = [];
  List<MatchGWModel> get gw36D1 => _gw36D1;

  List<MatchGWModel> _gw37D1 = [];
  List<MatchGWModel> get gw37D1 => _gw37D1;

  List<MatchGWModel> _gw38D1 = [];
  List<MatchGWModel> get gw38D1 => _gw38D1;

  List _teamsPointsD1 = [];
  List get teamsPointsD1 => _teamsPointsD1;

  bool isNull = true;

  bool _isDataNull = true;

  bool _gw1CurrentD1 = false;
  bool get gw1CurrentD1 => _gw1CurrentD1;
  bool _gw2CurrentD1 = false;
  bool get gw2CurrentD1 => _gw2CurrentD1;
  bool _gw3CurrentD1 = false;
  bool get gw3CurrentD1 => _gw3CurrentD1;
  bool _gw4CurrentD1 = false;
  bool get gw4CurrentD1 => _gw4CurrentD1;
  bool _gw5CurrentD1 = false;
  bool get gw5CurrentD1 => _gw5CurrentD1;
  bool _gw6CurrentD1 = false;
  bool get gw6CurrentD1 => _gw6CurrentD1;
  bool _gw7CurrentD1 = false;
  bool get gw7CurrentD1 => _gw7CurrentD1;
  bool _gw8CurrentD1 = false;
  bool get gw8CurrentD1 => _gw8CurrentD1;
  bool _gw9CurrentD1 = false;
  bool get gw9CurrentD1 => _gw9CurrentD1;
  bool _gw10CurrentD1 = false;
  bool get gw10CurrentD1 => _gw10CurrentD1;
  bool _gw11CurrentD1 = false;
  bool get gw11CurrentD1 => _gw11CurrentD1;
  bool _gw12CurrentD1 = false;
  bool get gw12CurrentD1 => _gw12CurrentD1;
  bool _gw13CurrentD1 = false;
  bool get gw13CurrentD1 => _gw13CurrentD1;
  bool _gw14CurrentD1 = false;
  bool get gw14CurrentD1 => _gw14CurrentD1;
  bool _gw15CurrentD1 = false;
  bool get gw15CurrentD1 => _gw15CurrentD1;
  bool _gw16CurrentD1 = false;
  bool get gw16CurrentD1 => _gw16CurrentD1;
  bool _gw17CurrentD1 = false;
  bool get gw17CurrentD1 => _gw17CurrentD1;
  bool _gw18CurrentD1 = false;
  bool get gw18CurrentD1 => _gw18CurrentD1;
  bool _gw19CurrentD1 = false;
  bool get gw19CurrentD1 => _gw19CurrentD1;
  bool _gw20CurrentD1 = false;
  bool get gw20CurrentD1 => _gw20CurrentD1;
  bool _gw21CurrentD1 = false;
  bool get gw21CurrentD1 => _gw21CurrentD1;
  bool _gw22CurrentD1 = false;
  bool get gw22CurrentD1 => _gw22CurrentD1;
  bool _gw23CurrentD1 = false;
  bool get gw23CurrentD1 => _gw23CurrentD1;
  bool _gw24CurrentD1 = false;
  bool get gw24CurrentD1 => _gw24CurrentD1;
  bool _gw25CurrentD1 = false;
  bool get gw25CurrentD1 => _gw25CurrentD1;
  bool _gw26CurrentD1 = false;
  bool get gw26CurrentD1 => _gw26CurrentD1;
  bool _gw27CurrentD1 = false;
  bool get gw27CurrentD1 => _gw27CurrentD1;
  bool _gw28CurrentD1 = false;
  bool get gw28CurrentD1 => _gw28CurrentD1;
  bool _gw29CurrentD1 = false;
  bool get gw29CurrentD1 => _gw29CurrentD1;
  bool _gw30CurrentD1 = false;
  bool get gw30CurrentD1 => _gw30CurrentD1;
  bool _gw31CurrentD1 = false;
  bool get gw31CurrentD1 => _gw31CurrentD1;
  bool _gw32CurrentD1 = false;
  bool get gw32CurrentD1 => _gw32CurrentD1;
  bool _gw33CurrentD1 = false;
  bool get gw33CurrentD1 => _gw33CurrentD1;
  bool _gw34CurrentD1 = false;
  bool get gw34CurrentD1 => _gw34CurrentD1;
  bool _gw35CurrentD1 = false;
  bool get gw35CurrentD1 => _gw35CurrentD1;
  bool _gw36CurrentD1 = false;
  bool get gw36CurrentD1 => _gw36CurrentD1;
  bool _gw37CurrentD1 = false;
  bool get gw37CurrentD1 => _gw37CurrentD1;
  bool _gw38CurrentD1 = false;
  bool get gw38CurrentD1 => _gw38CurrentD1;

  List<TeamPlayersModel> _teamPlayersD1 = [];
  List _allPlayersIdD1 = [];

  List<PlayerInfoModel> _previousPlayerInfoD1 = [];
  List<PlayerInfoModel> get previousPlayerInfoD1 => _previousPlayerInfoD1;

  List<PlayerInfoModel> _toGetCurrentEvent = [];

  List<CurrentPlayerGwPoints> _livePlayerPointsD1 = [];

  List<PlayerGwPoints> _previousPlayerPointsD1 = [];

  num _points = 0;

  bool _isteamPlayersNull = false;

  List<num> _totalCurrentGWPointsD1 = [];
  List<num> get totalCurrentGWPointsD1 => _totalCurrentGWPointsD1;

  List<num> _totalLastGWPoints = [];
  List<num> get totalLastGWPoints => _totalLastGWPoints;

  bool _isPointsDataLoadingD1 = true;
  bool get isPointsDataLoadingD1 => _isPointsDataLoadingD1;
  bool _isFinished = false;

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

  Future<void> gameweekCreationD1() async {
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[19].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[0],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[19],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[7].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[12],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[7],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[10].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[18],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[10],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[6].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[8],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[6],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[2].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[17],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[2],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[15].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[11],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[15],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[16].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[3],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[16],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[1].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[4],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[1],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[14].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[5],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[14],
    ));
    _gw1D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[13].teamName],
      team0Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[9],
      team1Result: _gw1CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.isEmpty
              ? 0
              : _teamsPointsD1[0].gwPoints[13],
    ));
    notifyListeners();

    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[13].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[5],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[13],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[9].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[12],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[9],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[14].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[15],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[14],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[11].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[6],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[11],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[8].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[1],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[8],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[4].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[0],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[4],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[10].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[19],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[10],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[18].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[3],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[18],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[16].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[2],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[16],
    ));
    _gw2D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[17].teamName],
      team0Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[7],
      team1Result: _gw2CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 2
              ? 0
              : _teamsPointsD1[1].gwPoints[15],
    ));
    notifyListeners();

    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[2].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[18],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[2],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[7].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[16],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[7],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[17].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[12],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[17],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[3].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[19],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[3],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[10].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[4],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[10],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[0].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[8],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[0],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[11].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[1],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[11],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[16].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[14],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[16],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[15].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[13],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[15],
    ));
    _gw3D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[9].teamName],
      team0Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[5],
      team1Result: _gw3CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 3
              ? 0
              : _teamsPointsD1[2].gwPoints[9],
    ));
    notifyListeners();

    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[14].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[1],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[14],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[9].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[15],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[9],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[13].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[6],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[13],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[12].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[5],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[12],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[11].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[0],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[11],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[8].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[10],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[8],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[4].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[3],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[4],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[19].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[2],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[19],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[18].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[7],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[18],
    ));
    _gw4D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[16].teamName],
      team0Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[17],
      team1Result: _gw4CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 4
              ? 0
              : _teamsPointsD1[3].gwPoints[16],
    ));
    notifyListeners();

    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[3].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[8],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[3],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[18].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[17],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[18],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[7].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[19],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[7],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[4].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[2],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[4],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[16].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[12],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[16],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[11].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[10],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[11],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[0].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[14],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[0],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[13].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[1],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[13],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[6].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[9],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[6],
    ));
    _gw5D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[15].teamName],
      team0Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[5],
      team1Result: _gw5CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 5
              ? 0
              : _teamsPointsD1[4].gwPoints[15],
    ));
    notifyListeners();

    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[11].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[3],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[11],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[6].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[5],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[6],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[9].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[1],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[9],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[13].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[0],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[13],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[10].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[14],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[10],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[12].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[15],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[12],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[8].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[2],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[8],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[4].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[7],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[4],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[19].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[17],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[19],
    ));
    _gw6D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[18].teamName],
      team0Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[16],
      team1Result: _gw6CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 6
              ? 0
              : _teamsPointsD1[5].gwPoints[18],
    ));
    notifyListeners();

    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[10].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[13],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[10],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[16].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[19],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[16],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[17].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[4],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[17],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[7].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[8],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[7],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[2].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[11],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[2],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[3].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[14],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[3],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[18].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[12],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[18],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[0].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[9],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[0],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[1].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[5],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[1],
    ));
    _gw7D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[15].teamName],
      team0Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[6],
      team1Result: _gw7CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[15],
    ));
    notifyListeners();

    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[8].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[17],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[8],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[15].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[1],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[15],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[5].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[0],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[5],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[9].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[10],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[9],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[13].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[3],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[13],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[14].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[2],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[14],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[11].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[7],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[11],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[12].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[6],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[12],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[4].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[16],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[4],
    ));
    _gw8D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[19].teamName],
      team0Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[18],
      team1Result: _gw8CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 8
              ? 0
              : _teamsPointsD1[7].gwPoints[19],
    ));
    notifyListeners();

    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[0].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[15],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[0],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[16].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[8],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[16],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[17].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[11],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[17],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[7].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[14],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[7],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[2].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[13],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[2],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[3].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[9],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[3],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[10].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[5],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[10],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[19].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[12],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[19],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[1].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[6],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[1],
    ));
    _gw9D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[18].teamName],
      team0Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[4],
      team1Result: _gw9CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 9
              ? 0
              : _teamsPointsD1[8].gwPoints[18],
    ));
    notifyListeners();

    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[4].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[19],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[4],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[12].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[1],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[12],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[8].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[18],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[8],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[11].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[16],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[11],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[14].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[17],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[14],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[13].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[7],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[13],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[9].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[2],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[9],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[5].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[3],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[5],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[15].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[10],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[15],
    ));
    _gw10D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[6].teamName],
      team0Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[0],
      team1Result: _gw10CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 10
              ? 0
              : _teamsPointsD1[9].gwPoints[6],
    ));
    notifyListeners();

    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[0].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[1],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[0],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[19].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[8],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[19],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[18].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[11],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[18],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[10],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[16],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[17].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[13],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[17],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[7].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[9],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[7],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[2].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[5],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[2],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[3].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[15],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[3],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[10].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[6],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[10],
    ));
    _gw11D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[4].teamName],
      team0Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[12],
      team1Result: _gw11CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 11
              ? 0
              : _teamsPointsD1[10].gwPoints[4],
    ));

    notifyListeners();

    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[11].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[19],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[11],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[8].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[4],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[8],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[12].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[0],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[12],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[14].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[18],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[14],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[13].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[16],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[13],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[9].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[17],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[9],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[5].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[7],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[5],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[15].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[2],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[15],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[6].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[3],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[6],
    ));
    _gw12D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[1].teamName],
      team0Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[10],
      team1Result: _gw12CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 12
              ? 0
              : _teamsPointsD1[11].gwPoints[1],
    ));

    notifyListeners();

    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[2].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[6],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[2],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[10].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[0],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[10],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[3].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[1],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[3],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[8].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[12],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[8],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[7].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[15],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[7],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[17].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[5],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[17],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[16].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[9],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[16],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[18].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[13],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[18],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[19].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[14],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[19],
    ));
    _gw13D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[4].teamName],
      team0Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[11],
      team1Result: _gw13CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 13
              ? 0
              : _teamsPointsD1[12].gwPoints[4],
    ));

    notifyListeners();

    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[9].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[18],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[9],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[11].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[8],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[11],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[14].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[4],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[14],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[13].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[19],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[13],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[12].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[10],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[12],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[5].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[16],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[5],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[15].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[17],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[15],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[6].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[7],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[6],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[2].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[1],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[2],
    ));
    _gw14D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[0].teamName],
      team0Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[3],
      team1Result: _gw14CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 14
              ? 0
              : _teamsPointsD1[13].gwPoints[0],
    ));
    notifyListeners();

    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[16].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[15],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[16],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[3].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[10],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[3],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[2].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[0],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[2],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[7].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[1],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[7],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[17].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[6],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[17],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[11].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[12],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[11],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[18].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[5],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[18],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[19].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[9],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[19],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[4].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[13],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[4],
    ));
    _gw15D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[8].teamName],
      team0Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[14],
      team1Result: _gw15CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 15
              ? 0
              : _teamsPointsD1[14].gwPoints[8],
    ));
    notifyListeners();

    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[6].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[16],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[6],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[13].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[8],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[13],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[14].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[11],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[14],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[9].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[4],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[9],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[5].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[19],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[5],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[15].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[18],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[15],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[12].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[3],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[12],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[1].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[17],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[1],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[0].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[7],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[0],
    ));
    _gw16D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[10].teamName],
      team0Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[2],
      team1Result: _gw16CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 16
              ? 0
              : _teamsPointsD1[15].gwPoints[10],
    ));
    notifyListeners();

    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[2].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[3],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[2],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[7].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[10],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[7],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[17].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[0],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[17],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[16].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[1],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[16],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[18].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[6],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[18],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[19].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[15],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[19],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[14].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[12],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[14],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[8].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[9],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[8],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[11].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[13],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[11],
    ));
    _gw17D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[4].teamName],
      team0Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[5],
      team1Result: _gw17CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 17
              ? 0
              : _teamsPointsD1[16].gwPoints[4],
    ));
    notifyListeners();

    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[10].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[17],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[10],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[3].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[7],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[3],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[9].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[11],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[9],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[5].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[8],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[5],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[15].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[4],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[15],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[6].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[19],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[6],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[1].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[18],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[1],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[13].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[14],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[13],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[16].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[0],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[16],
    ));
    _gw18D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[12].teamName],
      team0Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[2],
      team1Result: _gw18CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 18
              ? 0
              : _teamsPointsD1[17].gwPoints[12],
    ));
    notifyListeners();

    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[7].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[2],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[7],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[17].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[3],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[17],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[10],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[16],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[18].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[0],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[18],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[19].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[1],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[19],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[4].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[6],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[4],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[15].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[8],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[15],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[11].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[5],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[11],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[13].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[12],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[13],
    ));
    _gw19D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[14].teamName],
      team0Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[9],
      team1Result: _gw19CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 19
              ? 0
              : _teamsPointsD1[18].gwPoints[14],
    ));
    notifyListeners();

    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[19].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[0],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[19],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[7].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[12],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[7],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[10].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[18],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[10],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[6].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[8],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[6],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[2].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[17],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[2],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[15].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[11],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[15],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[16].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[3],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[16],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[1].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[4],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[1],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[14].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[5],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[14],
    ));
    _gw20D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[13].teamName],
      team0Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[9],
      team1Result: _gw20CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 20
              ? 0
              : _teamsPointsD1[19].gwPoints[13],
    ));
    notifyListeners();

    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[13].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[5],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[13],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[9].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[12],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[9],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[14].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[15],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[14],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[11].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[6],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[11],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[8].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[1],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[8],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[4].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[0],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[4],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[10].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[19],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[10],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[18].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[3],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[18],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[16].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[2],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[16],
    ));
    _gw21D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[17].teamName],
      team0Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[7],
      team1Result: _gw21CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 21
              ? 0
              : _teamsPointsD1[20].gwPoints[15],
    ));
    notifyListeners();

    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[2].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[18],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[2],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[7].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[16],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[7],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[17].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[12],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[17],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[3].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[19],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[3],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[10].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[10],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[4],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[0].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[8],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[0],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[11].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[1],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[11],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[16].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[14],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[16],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[15].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[13],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[15],
    ));
    _gw22D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[9].teamName],
      team0Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[5],
      team1Result: _gw22CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 22
              ? 0
              : _teamsPointsD1[21].gwPoints[9],
    ));
    notifyListeners();

    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[14].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[1],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[14],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[9].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[15],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[9],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[13].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[6],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[13],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[12].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[5],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[12],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[11].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[0],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[11],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[8].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[10],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[8],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[4].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[3],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[4],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[19].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[2],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[19],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[18].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[7],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[18],
    ));
    _gw23D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[16].teamName],
      team0Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[17],
      team1Result: _gw23CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 23
              ? 0
              : _teamsPointsD1[22].gwPoints[16],
    ));
    notifyListeners();

    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[3].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[8],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[3],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[18].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[17],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[18],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[7].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[19],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[7],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[4].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[2],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[4],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[16].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[12],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[16],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[11].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[10],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[11],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[0].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[14],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[0],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[13].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[1],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[13],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[6].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[9],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[6],
    ));
    _gw24D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[15].teamName],
      team0Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[5],
      team1Result: _gw24CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 24
              ? 0
              : _teamsPointsD1[23].gwPoints[15],
    ));
    notifyListeners();

    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[11].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[3],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[11],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[6].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[5],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[6],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[9].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[1],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[9],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[13].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[0],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[13],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[10].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[14],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[10],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[12].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[15],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[12],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[8].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[2],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[8],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[4].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[7],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[4],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[19].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[17],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[19],
    ));
    _gw25D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[18].teamName],
      team0Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[16],
      team1Result: _gw25CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 25
              ? 0
              : _teamsPointsD1[24].gwPoints[18],
    ));
    notifyListeners();

    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[10].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[13],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[10],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[16].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[19],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[16],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[17].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[4],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[17],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[7].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[8],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[7],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[2].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[11],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[2],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[3].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[14],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[3],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[18].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[12],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[18],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[0].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[9],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[0],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[1].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[5],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[1],
    ));
    _gw26D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[15].teamName],
      team0Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[6],
      team1Result: _gw26CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 26
              ? 0
              : _teamsPointsD1[25].gwPoints[15],
    ));
    notifyListeners();

    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[8].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[17],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[8],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[15].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[1],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[15],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[5].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[0],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[5],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[9].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[10],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[9],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[13].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[3],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[13],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[14].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[2],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[14],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[11].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[7],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[11],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[12].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[6],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[12],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[4].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[16],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[4],
    ));
    _gw27D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[19].teamName],
      team0Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[18],
      team1Result: _gw27CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 27
              ? 0
              : _teamsPointsD1[26].gwPoints[19],
    ));
    notifyListeners();

    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[0].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[15],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[0],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[16].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[8],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[16],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[17].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[11],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[17],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[7].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[14],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[7],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[2].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[13],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[12],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[3].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[9],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[3],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[10].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[5],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[10],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[19].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[12],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[19],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[1].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[6],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[1],
    ));
    _gw28D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[18].teamName],
      team0Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[4],
      team1Result: _gw28CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 28
              ? 0
              : _teamsPointsD1[27].gwPoints[18],
    ));
    notifyListeners();

    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[4].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[19],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[4],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[12].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[1],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[12],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[8].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[18],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[8],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[11].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[16],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[11],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[14].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[17],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[14],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[13].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[7],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[13],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[9].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[2],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[9],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[5].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[3],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[5],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[15].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[10],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[15],
    ));
    _gw29D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[6].teamName],
      team0Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[0],
      team1Result: _gw29CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 29
              ? 0
              : _teamsPointsD1[28].gwPoints[6],
    ));
    notifyListeners();

    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[0].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[1],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[0],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[19].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[8],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[19],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[18].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[11],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[18],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[10],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[16],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[17].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[13],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[17],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[7].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[9],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[7],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[2].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[5],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[2],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[3].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[15],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[3],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[10].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[6],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[10],
    ));
    _gw30D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[4].teamName],
      team0Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[12],
      team1Result: _gw30CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 30
              ? 0
              : _teamsPointsD1[29].gwPoints[4],
    ));

    notifyListeners();

    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[11].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[19],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[11],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[8].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[4],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[8],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[12].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[0],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[12],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[14].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[18],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[14],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[13].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[16],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[13],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[9].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[17],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[9],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[5].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[7],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[5],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[15].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[2],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[15],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[6].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[3],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[6],
    ));
    _gw31D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[1].teamName],
      team0Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[10],
      team1Result: _gw31CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[1],
    ));

    notifyListeners();

    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[2].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[6],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[2],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[10].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[0],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[10],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[3].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[1],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[3],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[8].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[12],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[8],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[7].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[15],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[7],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[17].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[5],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[17],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[16].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[9],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[16],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[18].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[13],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[18],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[19].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[14],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[19],
    ));
    _gw32D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[4].teamName],
      team0Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[11],
      team1Result: _gw32CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 31
              ? 0
              : _teamsPointsD1[30].gwPoints[4],
    ));

    notifyListeners();

    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[9].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[18],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[9],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[11].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[8],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[11],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[14].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[4],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[14],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[13].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[19],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[13],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[12].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[10],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[12],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[5].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[16],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[5],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[15].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[17],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[15],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[6].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[7],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[6],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[2].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[1],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[2],
    ));
    _gw33D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[0].teamName],
      team0Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[3],
      team1Result: _gw33CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 33
              ? 0
              : _teamsPointsD1[32].gwPoints[0],
    ));
    notifyListeners();

    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[16].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[15],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[16],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[3].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[10],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[3],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[2].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[0],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[2],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[7].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[1],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[7],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[17].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[6],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[17],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[11].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[12],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[11],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[18].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[5],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[18],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[19].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[9],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[19],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[4].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[13],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[4],
    ));
    _gw34D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[8].teamName],
      team0Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[14],
      team1Result: _gw34CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 34
              ? 0
              : _teamsPointsD1[33].gwPoints[8],
    ));
    notifyListeners();

    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[16].teamName, _divOneTeams[6].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[16],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[6],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[13].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[8],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[13],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[14].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[11],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[14],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[9].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[4],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[9],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[5].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[19],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[5],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[15].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[18],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[15],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[12].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[3],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[12],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[1].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[17],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[1],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[0].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[7],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[0],
    ));
    _gw35D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[10].teamName],
      team0Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[2],
      team1Result: _gw35CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 35
              ? 0
              : _teamsPointsD1[34].gwPoints[10],
    ));
    notifyListeners();

    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[2].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[3],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[2],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[7].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[10],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[7],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[17].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[0],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[17],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[16].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[1],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[16],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[18].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[6],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[18],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[15].teamName, _divOneTeams[19].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[15],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[19],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[14].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[12],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[14],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[8].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[9],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[8],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[13].teamName, _divOneTeams[11].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[13],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[14],
    ));
    _gw36D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[4].teamName],
      team0Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[5],
      team1Result: _gw36CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 36
              ? 0
              : _teamsPointsD1[35].gwPoints[4],
    ));
    notifyListeners();

    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[17].teamName, _divOneTeams[10].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[17],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[10],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[7].teamName, _divOneTeams[3].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[7],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[3],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[11].teamName, _divOneTeams[9].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[11],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[9],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[5].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[8],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[5],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[4].teamName, _divOneTeams[15].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[4],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[15],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[19].teamName, _divOneTeams[6].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[19],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[6],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[18].teamName, _divOneTeams[1].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[18],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[1],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[14].teamName, _divOneTeams[13].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[14],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[13],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[16].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[0],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[16],
    ));
    _gw37D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[12].teamName],
      team0Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[2],
      team1Result: _gw37CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 37
              ? 0
              : _teamsPointsD1[36].gwPoints[12],
    ));
    notifyListeners();

    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[2].teamName, _divOneTeams[7].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[2]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[2],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[7]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[7],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[3].teamName, _divOneTeams[17].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[3]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[3],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[17]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[17],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[10].teamName, _divOneTeams[16].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[10]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[10],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[16]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[16],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[0].teamName, _divOneTeams[18].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[0]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[0],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[18]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[18],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[1].teamName, _divOneTeams[19].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[1]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[1],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[19]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[19],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[6].teamName, _divOneTeams[4].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[6]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[6],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[4]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[4],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[8].teamName, _divOneTeams[15].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[8]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[8],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[15]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[15],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[5].teamName, _divOneTeams[11].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[5]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[5],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[11]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[11],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[12].teamName, _divOneTeams[13].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[12]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[12],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[13]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[13],
    ));
    _gw38D1.add(MatchGWModel(
      gwFixture: [_divOneTeams[9].teamName, _divOneTeams[14].teamName],
      team0Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[9]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[9],
      team1Result: _gw38CurrentD1
          ? _totalCurrentGWPointsD1[14]
          : _teamsPointsD1.length < 38
              ? 0
              : _teamsPointsD1[37].gwPoints[14],
    ));
    notifyListeners();
  }

  Future<void> getIdsForTeamPointsD1() async {
    _teamPlayersD1 = [];
    _allPlayersIdD1 = [];
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _teamPlayersD1.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
      _teamPlayersD1
          .sort((a, b) => int.parse(a.teamId).compareTo(int.parse(b.teamId)));
      for (int i = 0; i < _teamPlayersD1.length; i++) {
        _allPlayersIdD1.add(_teamPlayersD1[i].playersId);
      }
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
  }

  Future<void> getPreviousPlayerInfoD1(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    _previousPlayerInfoD1.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getLivePlayerPointsD1(String playerId, String event) async {
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

    _livePlayerPointsD1.add(CurrentPlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }

  Future<void> getCurrentGWDataDevOne() async {
    _isPointsDataLoadingD1 = true;
    notifyListeners();
    await getIdsForTeamPointsD1();

    int i = 0;
    for (int x = 0; x < _allPlayersIdD1.length; x++) {
      _points = 0;
      for (int j = 0; j < _allPlayersIdD1[x].length; j++) {
        await getPreviousPlayerInfoD1(_allPlayersIdD1[x][j].toString());
        await getLivePlayerPointsD1(_allPlayersIdD1[x][j].toString(),
            (_previousPlayerInfoD1[i].currentEvent).toString());

        print(_livePlayerPointsD1[i].entryHistory['points'] -
            _livePlayerPointsD1[i].entryHistory['event_transfers_cost']);

        _points += _livePlayerPointsD1[i].entryHistory['points'] -
            _livePlayerPointsD1[i].entryHistory['event_transfers_cost'];

        _players.add(_livePlayerPointsD1[i].entryHistory['points'] -
            _livePlayerPointsD1[i].entryHistory['event_transfers_cost']);

        _playersNameD1.add(
            '${_previousPlayerInfoD1[i].playerFirstName} ${_previousPlayerInfoD1[i].playerLastName}');
        i++;
      }
      _totalCurrentGWPointsD1.add(_points);
      notifyListeners();
    }

    _playerOfWeekD1 = _players.reduce(max);
    _teamOfWeekD1 = _totalCurrentGWPointsD1.reduce(max);
    notifyListeners();

    _players.asMap().forEach((index, value) {
      if (value == _playerOfWeekD1) {
        _playerOfWeekNameD1.add(_playersNameD1[index]);
      }
    });
    notifyListeners();

    _totalCurrentGWPointsD1.asMap().forEach((index, value) {
      if (value == _teamOfWeekD1) {
        _teamOfWeekNameD1.add(_divOneTeams[index].teamName);
      }
    });
    notifyListeners();

    switch (_previousPlayerInfoD1[0].currentEvent) {
      case 1:
        _gw1CurrentD1 = true;
        break;
      case 2:
        _gw2CurrentD1 = true;
        break;
      case 3:
        _gw3CurrentD1 = true;
        break;
      case 4:
        _gw4CurrentD1 = true;
        break;
      case 5:
        _gw5CurrentD1 = true;
        break;
      case 6:
        _gw6CurrentD1 = true;
        break;
      case 7:
        _gw7CurrentD1 = true;
        break;
      case 8:
        _gw8CurrentD1 = true;
        break;
      case 9:
        _gw9CurrentD1 = true;
        break;
      case 10:
        _gw10CurrentD1 = true;
        break;
      case 11:
        _gw11CurrentD1 = true;
        break;
      case 12:
        _gw12CurrentD1 = true;
        break;
      case 13:
        _gw13CurrentD1 = true;
        break;
      case 14:
        _gw14CurrentD1 = true;
        break;
      case 15:
        _gw15CurrentD1 = true;
        break;
      case 16:
        _gw16CurrentD1 = true;
        break;
      case 17:
        _gw17CurrentD1 = true;
        break;
      case 18:
        _gw18CurrentD1 = true;
        break;
      case 19:
        _gw19CurrentD1 = true;
        break;
      case 20:
        _gw20CurrentD1 = true;
        break;
      case 21:
        _gw21CurrentD1 = true;
        break;
      case 22:
        _gw22CurrentD1 = true;
        break;
      case 23:
        _gw23CurrentD1 = true;
        break;
      case 24:
        _gw24CurrentD1 = true;
        break;
      case 25:
        _gw25CurrentD1 = true;
        break;
      case 26:
        _gw26CurrentD1 = true;
        break;
      case 27:
        _gw27CurrentD1 = true;
        break;
      case 28:
        _gw28CurrentD1 = true;
        break;
      case 29:
        _gw29CurrentD1 = true;
        break;
      case 30:
        _gw30CurrentD1 = true;
        break;
      case 31:
        _gw31CurrentD1 = true;
        break;
      case 32:
        _gw32CurrentD1 = true;
        break;
      case 33:
        _gw33CurrentD1 = true;
        break;
      case 34:
        _gw34CurrentD1 = true;
        break;
      case 35:
        _gw35CurrentD1 = true;
        break;
      case 36:
        _gw36CurrentD1 = true;
        break;
      case 37:
        _gw37CurrentD1 = true;
        break;
      case 38:
        _gw38CurrentD1 = true;
        break;
      default:
    }
    _isPointsDataLoadingD1 = false;
    notifyListeners();
  }

  Future<void> getTeamsDataD1() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}GWD1PointsData.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _teamsPointsD1.add(GWPointsModel.fromjson(v));
          notifyListeners();
        },
      );
    }
  }

  Future<bool> addPlayersDataD1(Map<String, dynamic> players) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}GWD1PointsData.json'),
      body: json.encode(players),
    );

    if (response.statusCode == 200) {
      players['id'] = json.decode(response.body)['name'];
      
      _teamsPointsD1.add(GWPointsModel.fromjson(players));
      return true;
    } else {
      return false;
    }
  }

  bool _isCurrentEventLoading = false;
  bool get isCurrentEventLoading => _isCurrentEventLoading;
  
  Future<bool> getCurrentEventForAll() async {
    _isCurrentEventLoading = true;
    notifyListeners();
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/1/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    if(respo.statusCode==200){
      _toGetCurrentEvent.add(PlayerInfoModel.fromjson(info));
    _currentEvent = _toGetCurrentEvent[0].currentEvent;
     _isCurrentEventLoading = false;
    notifyListeners();
    return  true;
    }else{
      notifyListeners();
      return  false;
    }

   
    
  }


  List<GeneralInfoModel> _generaInfo = [];

  bool _isGwFinished = false;
  bool get isGwFinished => _isGwFinished;

  bool _isPrevious = false;
  bool get isPrevious => _isPrevious;

  bool _isGeneralInfoLoading = false;
  bool get isGeneralInfoLoading => _isGeneralInfoLoading;

  Future<void> getGeneralInfo() async {
    _isGeneralInfoLoading = true;
    notifyListeners();
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/bootstrap-static/'),
    );
    var gInfo = json.decode(respo.body);

    _generaInfo.add(GeneralInfoModel.fromjson(gInfo));

    _isGwFinished = _generaInfo[0].events[currentEvent]['finished'];
    _isPrevious = _generaInfo[0].events[currentEvent]['is_previous'];
    notifyListeners();

    _isGeneralInfoLoading = false;
    notifyListeners();
  }
}
