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

mixin MatchesFixtureGroupOneController on Model {
  List<TeamTableModel> _groupOneTeams = [];
  num _playerOfWeekG1 = 0;
  num get playerOfWeekG1 => _playerOfWeekG1;

  List<num> _players = [];

  List<String> _playersNameG1 = [];

  List<String> _playerOfWeekNameG1 = [];
  List<String> get playerOfWeekNameG1 => _playerOfWeekNameG1;

  List<String> _teamOfWeekNameG1 = [];
  List<String> get teamOfWeekNameG1 => _teamOfWeekNameG1;

  num _teamOfWeekG1 = 0;
  num get teamOfWeekG1 => _teamOfWeekG1;

  List<MatchGWModel> _gw1G1 = [];
  List<MatchGWModel> get gw1G1 => _gw1G1;

  List<MatchGWModel> _gw2G1 = [];
  List<MatchGWModel> get gw2G1 => _gw2G1;

  List<MatchGWModel> _gw3G1 = [];
  List<MatchGWModel> get gw3G1 => _gw3G1;

  List<MatchGWModel> _gw4G1 = [];
  List<MatchGWModel> get gw4G1 => _gw4G1;

  List<MatchGWModel> _gw5G1 = [];
  List<MatchGWModel> get gw5G1 => _gw5G1;

  List<MatchGWModel> _gw6G1 = [];
  List<MatchGWModel> get gw6G1 => _gw6G1;

  List<MatchGWModel> _gw7G1 = [];
  List<MatchGWModel> get gw7G1 => _gw7G1;

  List<MatchGWModel> _gw8G1 = [];
  List<MatchGWModel> get gw8G1 => _gw8G1;

  List<MatchGWModel> _gw9G1 = [];
  List<MatchGWModel> get gw9G1 => _gw9G1;

  List<MatchGWModel> _gw10G1 = [];
  List<MatchGWModel> get gw10G1 => _gw10G1;

  List<MatchGWModel> _gw11G1 = [];
  List<MatchGWModel> get gw11G1 => _gw11G1;

  List<MatchGWModel> _gw12G1 = [];
  List<MatchGWModel> get gw12G1 => _gw12G1;

  List<MatchGWModel> _gw13G1 = [];
  List<MatchGWModel> get gw13G1 => _gw13G1;

  List<MatchGWModel> _gw14G1 = [];
  List<MatchGWModel> get gw14G1 => _gw14G1;

  List<MatchGWModel> _gw15G1 = [];
  List<MatchGWModel> get gw15G1 => _gw15G1;

  List<MatchGWModel> _gw16G1 = [];
  List<MatchGWModel> get gw16G1 => _gw16G1;

  List<MatchGWModel> _gw17G1 = [];
  List<MatchGWModel> get gw17G1 => _gw17G1;

  List<MatchGWModel> _gw18G1 = [];
  List<MatchGWModel> get gw18G1 => _gw18G1;

  List<MatchGWModel> _gw19G1 = [];
  List<MatchGWModel> get gw19G1 => _gw19G1;

  List<MatchGWModel> _gw20G1 = [];
  List<MatchGWModel> get gw20G1 => _gw20G1;

  List<MatchGWModel> _gw21G1 = [];
  List<MatchGWModel> get gw21G1 => _gw21G1;

  List<MatchGWModel> _gw22G1 = [];
  List<MatchGWModel> get gw22G1 => _gw22G1;

  List<MatchGWModel> _gw23G1 = [];
  List<MatchGWModel> get gw23G1 => _gw23G1;

  List<MatchGWModel> _gw24G1 = [];
  List<MatchGWModel> get gw24G1 => _gw24G1;

  List<MatchGWModel> _gw25G1 = [];
  List<MatchGWModel> get gw25G1 => _gw25G1;

  List<MatchGWModel> _gw26G1 = [];
  List<MatchGWModel> get gw26G1 => _gw26G1;

  List<MatchGWModel> _gw27G1 = [];
  List<MatchGWModel> get gw27G1 => _gw27G1;

  List<MatchGWModel> _gw28G1 = [];
  List<MatchGWModel> get gw28G1 => _gw28G1;

  List<MatchGWModel> _gw29G1 = [];
  List<MatchGWModel> get gw29G1 => _gw29G1;

  List<MatchGWModel> _gw30G1 = [];
  List<MatchGWModel> get gw30G1 => _gw30G1;

  List<MatchGWModel> _gw31G1 = [];
  List<MatchGWModel> get gw31G1 => _gw31G1;

  List<MatchGWModel> _gw32G1 = [];
  List<MatchGWModel> get gw32G1 => _gw32G1;

  List<MatchGWModel> _gw33G1 = [];
  List<MatchGWModel> get gw33G1 => _gw33G1;

  List<MatchGWModel> _gw34G1 = [];
  List<MatchGWModel> get gw34G1 => _gw34G1;

  List _teamsPointsG1 = [];
  List get teamsPointsG1 => _teamsPointsG1;

  bool isNull = true;

  bool _isDataNull = true;

  bool _gw1CurrentG1 = false;
  bool get gw1CurrentG1 => _gw1CurrentG1;
  bool _gw2CurrentG1 = false;
  bool get gw2CurrentG1 => _gw2CurrentG1;
  bool _gw3CurrentG1 = false;
  bool get gw3CurrentG1 => _gw3CurrentG1;
  bool _gw4CurrentG1 = false;
  bool get gw4CurrentG1 => _gw4CurrentG1;
  bool _gw5CurrentG1 = false;
  bool get gw5CurrentG1 => _gw5CurrentG1;
  bool _gw6CurrentG1 = false;
  bool get gw6CurrentG1 => _gw6CurrentG1;
  bool _gw7CurrentG1 = false;
  bool get gw7CurrentG1 => _gw7CurrentG1;
  bool _gw8CurrentG1 = false;
  bool get gw8CurrentG1 => _gw8CurrentG1;
  bool _gw9CurrentG1 = false;
  bool get gw9CurrentG1 => _gw9CurrentG1;
  bool _gw10CurrentG1 = false;
  bool get gw10CurrentG1 => _gw10CurrentG1;
  bool _gw11CurrentG1 = false;
  bool get gw11CurrentG1 => _gw11CurrentG1;
  bool _gw12CurrentG1 = false;
  bool get gw12CurrentG1 => _gw12CurrentG1;
  bool _gw13CurrentG1 = false;
  bool get gw13CurrentG1 => _gw13CurrentG1;
  bool _gw14CurrentG1 = false;
  bool get gw14CurrentG1 => _gw14CurrentG1;
  bool _gw15CurrentG1 = false;
  bool get gw15CurrentG1 => _gw15CurrentG1;
  bool _gw16CurrentG1 = false;
  bool get gw16CurrentG1 => _gw16CurrentG1;
  bool _gw17CurrentG1 = false;
  bool get gw17CurrentG1 => _gw17CurrentG1;
  bool _gw18CurrentG1 = false;
  bool get gw18CurrentG1 => _gw18CurrentG1;
  bool _gw19CurrentG1 = false;
  bool get gw19CurrentG1 => _gw19CurrentG1;
  bool _gw20CurrentG1 = false;
  bool get gw20CurrentG1 => _gw20CurrentG1;
  bool _gw21CurrentG1 = false;
  bool get gw21CurrentG1 => _gw21CurrentG1;
  bool _gw22CurrentG1 = false;
  bool get gw22CurrentG1 => _gw22CurrentG1;
  bool _gw23CurrentG1 = false;
  bool get gw23CurrentG1 => _gw23CurrentG1;
  bool _gw24CurrentG1 = false;
  bool get gw24CurrentG1 => _gw24CurrentG1;
  bool _gw25CurrentG1 = false;
  bool get gw25CurrentG1 => _gw25CurrentG1;
  bool _gw26CurrentG1 = false;
  bool get gw26CurrentG1 => _gw26CurrentG1;
  bool _gw27CurrentG1 = false;
  bool get gw27CurrentG1 => _gw27CurrentG1;
  bool _gw28CurrentG1 = false;
  bool get gw28CurrentG1 => _gw28CurrentG1;
  bool _gw29CurrentG1 = false;
  bool get gw29CurrentG1 => _gw29CurrentG1;
  bool _gw30CurrentG1 = false;
  bool get gw30CurrentG1 => _gw30CurrentG1;
  bool _gw31CurrentG1 = false;
  bool get gw31CurrentG1 => _gw31CurrentG1;
  bool _gw32CurrentG1 = false;
  bool get gw32CurrentG1 => _gw32CurrentG1;
  bool _gw33CurrentG1 = false;
  bool get gw33CurrentG1 => _gw33CurrentG1;
  bool _gw34CurrentG1 = false;
  bool get gw34CurrentG1 => _gw34CurrentG1;
  bool _gw35CurrentG1 = false;
  bool get gw35CurrentG1 => _gw35CurrentG1;
  bool _gw36CurrentG1 = false;
  bool get gw36CurrentG1 => _gw36CurrentG1;
  bool _gw37CurrentG1 = false;
  bool get gw37CurrentG1 => _gw37CurrentG1;
  bool _gw38CurrentG1 = false;
  bool get gw38CurrentG1 => _gw38CurrentG1;

  List<TeamPlayersModel> _teamPlayersG1 = [];
  List _allPlayersIdG1 = [];

  List<PlayerInfoModel> _previousPlayerInfoG1 = [];
  List<PlayerInfoModel> get previousPlayerInfoG1 => _previousPlayerInfoG1;

  List<PlayerInfoModel> _toGetCurrentEvent = [];

  List<CurrentPlayerGwPoints> _livePlayerPointsG1 = [];

  List<PlayerGwPoints> _previousPlayerPointsG1 = [];

  num _points = 0;

  bool _isteamPlayersNull = false;

  List<num> _totalCurrentGWPointsG1 = [];
  List<num> get totalCurrentGWPointsG1 => _totalCurrentGWPointsG1;

  List<num> _totalLastGWPoints = [];
  List<num> get totalLastGWPoints => _totalLastGWPoints;

  bool _isLoadingG1 = true;
  bool get isLoadingG1 => _isLoadingG1;
  set setLoadG1(bool isLoadingG1) {
    _isLoadingG1 = isLoadingG1;
  }

  bool _isFinished = false;

  Future<void> getTeamsGroupOneTeams() async {
    _groupOneTeams.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _groupOneTeams.add(TeamTableModel.fromjson(v));
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

  Future<void> gameweekCreationG1() async {
    notifyListeners();
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[4],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[1],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[9],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[2],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[7],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[12],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[11],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[15],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[0],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[8],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[5],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[6],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[17],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[16],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[14],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[13],
    ));
    _gw1G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[3],
      team1Result: _gw1CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.isEmpty
              ? 0
              : _teamsPointsG1[0].gwPoints[10],
    ));
    notifyListeners();

    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[13],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[3],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[10],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[4],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[16],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[14],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[6],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[17],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[8],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[5],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[15],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[0],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[12],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[11],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[2],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[7],
    ));
    _gw2G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[1],
      team1Result: _gw2CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 2
              ? 0
              : _teamsPointsG1[1].gwPoints[9],
    ));
    notifyListeners();

    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[11],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[2],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[7],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[1],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[4],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[9],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[0],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[12],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[5],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[15],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[17],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[8],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[14],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[6],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[3],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[16],
    ));
    _gw3G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[10],
      team1Result: _gw3CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 3
              ? 0
              : _teamsPointsG1[2].gwPoints[13],
    ));
    notifyListeners();

    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[8],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[14],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[16],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[10],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[6],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[3],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[13],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[4],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[15],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[17],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[12],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[5],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[2],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[0],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[1],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[11],
    ));
    _gw4G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[9],
      team1Result: _gw4CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 4
              ? 0
              : _teamsPointsG1[3].gwPoints[7],
    ));
    notifyListeners();

    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[17],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[12],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[11],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[9],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[0],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[1],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[5],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[2],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[4],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[7],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[14],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[15],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[3],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[8],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[10],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[6],
    ));
    _gw5G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[13],
      team1Result: _gw5CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 5
              ? 0
              : _teamsPointsG1[4].gwPoints[16],
    ));
    notifyListeners();

    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[2],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[17],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[6],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[13],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[8],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[10],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[15],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[3],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[12],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[14],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[16],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[4],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[1],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[5],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[9],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[0],
    ));
    _gw6G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[7],
      team1Result: _gw6CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 6
              ? 0
              : _teamsPointsG1[5].gwPoints[11],
    ));
    notifyListeners();

    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[10],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[15],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[0],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[7],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[5],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[9],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[17],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[1],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[14],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[2],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[3],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[12],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[4],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[11],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[13],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[8],
    ));
    _gw7G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[16],
      team1Result: _gw7CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[6],
    ));
    notifyListeners();

    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[7],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[5],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[8],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[16],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[15],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[13],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[12],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[10],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[2],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[3],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[1],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[14],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[9],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[17],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[6],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[4],
    ));
    _gw8G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[11],
      team1Result: _gw8CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 8
              ? 0
              : _teamsPointsG1[7].gwPoints[0],
    ));
    notifyListeners();

    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[6],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[8],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[5],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[11],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[17],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[7],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[14],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[9],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[3],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[1],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[10],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[2],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[13],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[12],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[16],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[15],
    ));
    _gw9G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[4],
      team1Result: _gw9CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 9
              ? 0
              : _teamsPointsG1[8].gwPoints[0],
    ));
    notifyListeners();

    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[0],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[5],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[15],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[6],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[12],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[16],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[2],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[13],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[1],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[10],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[9],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[3],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[7],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[14],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[11],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[17],
    ));
    _gw10G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[8],
      team1Result: _gw10CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 10
              ? 0
              : _teamsPointsG1[9].gwPoints[4],
    ));
    notifyListeners();

    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[6],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[12],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[17],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[0],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[14],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[11],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[3],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[7],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[10],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[9],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[13],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[1],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[16],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[2],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[4],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[5],
    ));
    _gw11G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[8],
      team1Result: _gw11CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 11
              ? 0
              : _teamsPointsG1[10].gwPoints[15],
    ));
    notifyListeners();

    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[11],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[3],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[12],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[8],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[2],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[6],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[1],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[16],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[9],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[13],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[7],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[10],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[15],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[4],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[0],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[14],
    ));
    _gw12G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[5],
      team1Result: _gw12CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 12
              ? 0
              : _teamsPointsG1[11].gwPoints[17],
    ));
    notifyListeners();

    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[16],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[9],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[14],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[5],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[3],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[0],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[10],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[11],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[13],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[7],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[4],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[17],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[6],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[1],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[8],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[2],
    ));
    _gw13G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[15],
      team1Result: _gw13CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 13
              ? 0
              : _teamsPointsG1[12].gwPoints[12],
    ));
    notifyListeners();

    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[7],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[16],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[2],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[15],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[1],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[8],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[9],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[6],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[12],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[4],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[11],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[13],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[0],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[10],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[5],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[3],
    ));
    _gw14G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[17],
      team1Result: _gw14CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 14
              ? 0
              : _teamsPointsG1[13].gwPoints[4],
    ));
    notifyListeners();

    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[13],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[0],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[3],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[17],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[10],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[5],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[4],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[14],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[16],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[11],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[6],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[7],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[8],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[9],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[15],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[1],
    ));
    _gw15G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[12],
      team1Result: _gw15CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 15
              ? 0
              : _teamsPointsG1[14].gwPoints[2],
    ));
    notifyListeners();

    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[9],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[15],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[1],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[12],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[2],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[4],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[7],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[8],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[11],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[6],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[0],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[16],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[5],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[13],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[17],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[10],
    ));
    _gw16G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[14],
      team1Result: _gw16CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 16
              ? 0
              : _teamsPointsG1[15].gwPoints[3],
    ));
    notifyListeners();

    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[10],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[14],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[4],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[3],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[13],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[17],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[16],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[5],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[6],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[0],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[8],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[11],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[15],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[7],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[12],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[9],
    ));
    _gw17G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[2],
      team1Result: _gw17CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 17
              ? 0
              : _teamsPointsG1[16].gwPoints[1],
    ));
    notifyListeners();

    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[4],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[1],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[9],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[2],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[7],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[12],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[11],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[15],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[0],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[8],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[5],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[6],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[17],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[16],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[14],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[13],
    ));
    _gw18G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[3],
      team1Result: _gw18CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 18
              ? 0
              : _teamsPointsG1[17].gwPoints[10],
    ));
    notifyListeners();

    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[13],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[3],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[10],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[4],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[16],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[14],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[6],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[17],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[8],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[5],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[15],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[0],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[12],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[11],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[2],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[7],
    ));
    _gw19G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[1],
      team1Result: _gw19CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 19
              ? 0
              : _teamsPointsG1[18].gwPoints[9],
    ));
    notifyListeners();

    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[11],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[2],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[7],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[1],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[4],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[9],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[0],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[12],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[5],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[15],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[17],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[8],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[14],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[6],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[3],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[16],
    ));
    _gw20G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[10],
      team1Result: _gw20CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 20
              ? 0
              : _teamsPointsG1[19].gwPoints[13],
    ));
    notifyListeners();

    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[8],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[14],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[16],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[10],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[6],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[3],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[13],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[4],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[15],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[17],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[12],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[5],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[2],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[0],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[1],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[11],
    ));
    _gw21G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[9],
      team1Result: _gw21CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 21
              ? 0
              : _teamsPointsG1[20].gwPoints[7],
    ));
    notifyListeners();

    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[17],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[12],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[11],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[9],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[0],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[1],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[5],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[2],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[4],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[7],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[14],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[15],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[3],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[8],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[10],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[6],
    ));
    _gw22G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[13],
      team1Result: _gw22CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 22
              ? 0
              : _teamsPointsG1[21].gwPoints[16],
    ));
    notifyListeners();

    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[2],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[17],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[6],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[13],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[8],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[10],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[15],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[3],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[12],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[14],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[16],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[4],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[1],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[5],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[9],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[0],
    ));
    _gw23G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[7],
      team1Result: _gw23CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 23
              ? 0
              : _teamsPointsG1[22].gwPoints[11],
    ));
    notifyListeners();

    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[10],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[15],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[0],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[7],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[5],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[9],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[17],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[1],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[14],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[2],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[3],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[12],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[4],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[11],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[13],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[8],
    ));
    _gw24G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[16],
      team1Result: _gw24CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 24
              ? 0
              : _teamsPointsG1[23].gwPoints[6],
    ));
    notifyListeners();

    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[7],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[5],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[8],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[16],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[15],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[13],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[12],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[10],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[2],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[3],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[1],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[14],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[9],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[17],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[6],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[4],
    ));
    _gw25G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[11],
      team1Result: _gw25CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 25
              ? 0
              : _teamsPointsG1[24].gwPoints[0],
    ));
    notifyListeners();

    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[6],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[8],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[5],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[11],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[17],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[7],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[14],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[9],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[3],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[1],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[10],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[2],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[13],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[12],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[16],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[15],
    ));
    _gw26G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[4],
      team1Result: _gw26CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 26
              ? 0
              : _teamsPointsG1[25].gwPoints[0],
    ));
    notifyListeners();

    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[0],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[5],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[15],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[6],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[12],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[16],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[2],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[13],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[1],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[10],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[9],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[3],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[7],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[14],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[11],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[17],
    ));
    _gw27G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[8],
      team1Result: _gw27CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 27
              ? 0
              : _teamsPointsG1[26].gwPoints[4],
    ));
    notifyListeners();

    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[6],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[12],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[17],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[0],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[14],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[11],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[3],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[7],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[10],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[9],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[13],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[1],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[16],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[2],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[4],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[5],
    ));
    _gw28G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[8],
      team1Result: _gw28CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 28
              ? 0
              : _teamsPointsG1[27].gwPoints[15],
    ));
    notifyListeners();

    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[11],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[3],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[12],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[8],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[2],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[6],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[1],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[16],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[9],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[13],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[7],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[10],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[15],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[4],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[0],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[14],
    ));
    _gw29G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[5],
      team1Result: _gw29CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 29
              ? 0
              : _teamsPointsG1[28].gwPoints[17],
    ));
    notifyListeners();

    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[16],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[9],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[14],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[5],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[3],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[0],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[10],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[11],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[13],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[7],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[4],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[17],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[6],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[1],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[8],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[2],
    ));
    _gw30G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[15],
      team1Result: _gw30CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 30
              ? 0
              : _teamsPointsG1[29].gwPoints[12],
    ));
    notifyListeners();

    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[7],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[16],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[2],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[15],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[1],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[8],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[9],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[6],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[12],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[4],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[11],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[13],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[0],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[10],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[5],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[3],
    ));
    _gw31G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[17],
      team1Result: _gw31CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 31
              ? 0
              : _teamsPointsG1[30].gwPoints[4],
    ));
    notifyListeners();

    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[13],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[0],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[3].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[3],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[17],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[10],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[5],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[4],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[14],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[16].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[16],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[11],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[6],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[7],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[8],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[9],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[15],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[1],
    ));
    _gw32G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[2].teamName],
      team0Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[30].gwPoints[12],
      team1Result: _gw32CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 32
              ? 0
              : _teamsPointsG1[31].gwPoints[2],
    ));
    notifyListeners();

    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[9].teamName, _groupOneTeams[15].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[9],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[15],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[1].teamName, _groupOneTeams[12].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[1],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[12],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[4].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[2],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[4],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[7].teamName, _groupOneTeams[8].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[7],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[8],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[11].teamName, _groupOneTeams[6].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[11],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[6],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[0].teamName, _groupOneTeams[16].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[0],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[16]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[16],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[13].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[5],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[13],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[17].teamName, _groupOneTeams[10].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[17],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[10],
    ));
    _gw33G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[14].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[14],
      team1Result: _gw33CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 33
              ? 0
              : _teamsPointsG1[32].gwPoints[3],
    ));
    notifyListeners();

    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[10].teamName, _groupOneTeams[14].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[10]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[10],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[14]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[14],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[4].teamName, _groupOneTeams[3].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[4]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[4],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[3]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[3],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[13].teamName, _groupOneTeams[17].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[13]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[13],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[17]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[17],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[5].teamName, _groupOneTeams[5].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[5],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[5]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[5],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[6].teamName, _groupOneTeams[0].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[6]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[6],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[0]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[0],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[8].teamName, _groupOneTeams[11].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[8]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[8],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[11]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[11],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[15].teamName, _groupOneTeams[7].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[15]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[15],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[7]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[7],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[12].teamName, _groupOneTeams[9].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[12]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[12],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[9]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[9],
    ));
    _gw34G1.add(MatchGWModel(
      gwFixture: [_groupOneTeams[2].teamName, _groupOneTeams[1].teamName],
      team0Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[2]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[2],
      team1Result: _gw34CurrentG1
          ? _totalCurrentGWPointsG1[1]
          : _teamsPointsG1.length < 34
              ? 0
              : _teamsPointsG1[33].gwPoints[1],
    ));
    notifyListeners();

    _isLoadingG1 = false;
    notifyListeners();
  }

  Future<void> getIdsForTeamPointsG1() async {
    _teamPlayersG1 = [];
    _allPlayersIdG1 = [];
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG1.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _teamPlayersG1.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
      _teamPlayersG1
          .sort((a, b) => int.parse(a.teamId).compareTo(int.parse(b.teamId)));
      for (int i = 0; i < _teamPlayersG1.length; i++) {
        _allPlayersIdG1.add(_teamPlayersG1[i].playersId);
      }
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
  }

  Future<void> getPreviousPlayerInfoG1(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    _previousPlayerInfoG1.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getLivePlayerPointsG1(String playerId, String event) async {
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

    _livePlayerPointsG1.add(CurrentPlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }

  Future<void> getCurrentGWDataGroupOne() async {
    _isLoadingG1 = true;
    // _totalCurrentGWPointsG1.clear();
    // _playerOfWeekG1 = 0;
    // _teamOfWeekG1 = 0;
    // _playerOfWeekNameG1.clear();
    // _teamOfWeekNameG1.clear();
    await getIdsForTeamPointsG1();

    int i = 0;
    for (int x = 0; x < _allPlayersIdG1.length; x++) {
      _points = 0;
      for (int j = 0; j < _allPlayersIdG1[x].length; j++) {
        await getPreviousPlayerInfoG1(_allPlayersIdG1[x][j].toString());
        await getLivePlayerPointsG1(_allPlayersIdG1[x][j].toString(),
            (_previousPlayerInfoG1[i].currentEvent).toString());

        print(_livePlayerPointsG1[i].entryHistory['points'] -
            _livePlayerPointsG1[i].entryHistory['event_transfers_cost']);

        _points += _livePlayerPointsG1[i].entryHistory['points'] -
            _livePlayerPointsG1[i].entryHistory['event_transfers_cost'];

        _players.add(_livePlayerPointsG1[i].entryHistory['points'] -
            _livePlayerPointsG1[i].entryHistory['event_transfers_cost']);

        _playersNameG1.add(
            '${_previousPlayerInfoG1[i].playerFirstName} ${_previousPlayerInfoG1[i].playerLastName}');
        i++;
      }
      _totalCurrentGWPointsG1.add(_points);
      notifyListeners();
    }

    _playerOfWeekG1 = _players.reduce(max);
    _teamOfWeekG1 = _totalCurrentGWPointsG1.reduce(max);
    notifyListeners();

    _players.asMap().forEach((index, value) {
      if (value == _playerOfWeekG1) {
        _playerOfWeekNameG1.add(_playersNameG1[index]);
      }
    });
    notifyListeners();

    _totalCurrentGWPointsG1.asMap().forEach((index, value) {
      if (value == _teamOfWeekG1) {
        _teamOfWeekNameG1.add(_groupOneTeams[index].teamName);
      }
    });
    notifyListeners();

    switch (_previousPlayerInfoG1[0].currentEvent) {
      case 1:
        _gw1CurrentG1 = true;
        break;
      case 2:
        _gw2CurrentG1 = true;
        break;
      case 3:
        _gw3CurrentG1 = true;
        break;
      case 4:
        _gw4CurrentG1 = true;
        break;
      case 5:
        _gw5CurrentG1 = true;
        break;
      case 6:
        _gw6CurrentG1 = true;
        break;
      case 7:
        _gw7CurrentG1 = true;
        break;
      case 8:
        _gw8CurrentG1 = true;
        break;
      case 9:
        _gw9CurrentG1 = true;
        break;
      case 10:
        _gw10CurrentG1 = true;
        break;
      case 11:
        _gw11CurrentG1 = true;
        break;
      case 12:
        _gw12CurrentG1 = true;
        break;
      case 13:
        _gw13CurrentG1 = true;
        break;
      case 14:
        _gw14CurrentG1 = true;
        break;
      case 15:
        _gw15CurrentG1 = true;
        break;
      case 16:
        _gw16CurrentG1 = true;
        break;
      case 17:
        _gw17CurrentG1 = true;
        break;
      case 18:
        _gw18CurrentG1 = true;
        break;
      case 19:
        _gw19CurrentG1 = true;
        break;
      case 20:
        _gw20CurrentG1 = true;
        break;
      case 21:
        _gw21CurrentG1 = true;
        break;
      case 22:
        _gw22CurrentG1 = true;
        break;
      case 23:
        _gw23CurrentG1 = true;
        break;
      case 24:
        _gw24CurrentG1 = true;
        break;
      case 25:
        _gw25CurrentG1 = true;
        break;
      case 26:
        _gw26CurrentG1 = true;
        break;
      case 27:
        _gw27CurrentG1 = true;
        break;
      case 28:
        _gw28CurrentG1 = true;
        break;
      case 29:
        _gw29CurrentG1 = true;
        break;
      case 30:
        _gw30CurrentG1 = true;
        break;
      case 31:
        _gw31CurrentG1 = true;
        break;
      case 32:
        _gw32CurrentG1 = true;
        break;
      case 33:
        _gw33CurrentG1 = true;
        break;
      case 34:
        _gw34CurrentG1 = true;
        break;
      case 35:
        _gw35CurrentG1 = true;
        break;
      case 36:
        _gw36CurrentG1 = true;
        break;
      case 37:
        _gw37CurrentG1 = true;
        break;
      case 38:
        _gw38CurrentG1 = true;
        break;
      default:
    }

    notifyListeners();
  }

  Future<void> getTeamsDataG1() async {
    _isLoadingG1 = true;
    _teamsPointsG1.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}GWG1PointsData.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _teamsPointsG1.add(GWPointsModel.fromjson(v));
          notifyListeners();
        },
      );
    }
  }

  Future<bool> addPlayersDataG1(Map<String, dynamic> players) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}GWG1PointsData.json'),
      body: json.encode(players),
    );

    if (response.statusCode == 200) {
      players['id'] = json.decode(response.body)['name'];

      _teamsPointsG1.add(GWPointsModel.fromjson(players));
      return true;
    } else {
      return false;
    }
  }

  Future<void> getPreviousPlayerPoints(String playerId) async {
    http.Response res = await http.get(
      Uri.parse(
          'https://fantasy.premierleague.com/api/entry/$playerId/history/'),
    );

    var pointsData = json.decode(res.body);

    _previousPlayerPointsG1.add(PlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }
}
