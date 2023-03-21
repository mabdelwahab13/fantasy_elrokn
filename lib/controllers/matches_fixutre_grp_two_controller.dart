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

mixin MatchesFixtureGroupTwoController on Model {
  List<TeamTableModel> _groupTwoTeams = [];

  num _playerOfWeekG2 = 0;
  num get playerOfWeekG2 => _playerOfWeekG2;

  List<num> _players = [];

  List<String> _playersNameG2 = [];

  List<String> _playerOfWeekNameG2 = [];
  List<String> get playerOfWeekNameG2 => _playerOfWeekNameG2;

  List<String> _teamOfWeekNameG2 = [];
  List<String> get teamOfWeekNameG2 => _teamOfWeekNameG2;

  num _teamOfWeekG2 = 0;
  num get teamOfWeekG2 => _teamOfWeekG2;

  List<MatchGWModel> _gw1G2 = [];
  List<MatchGWModel> get gw1G2 => _gw1G2;

  List<MatchGWModel> _gw2G2 = [];
  List<MatchGWModel> get gw2G2 => _gw2G2;

  List<MatchGWModel> _gw3G2 = [];
  List<MatchGWModel> get gw3G2 => _gw3G2;

  List<MatchGWModel> _gw4G2 = [];
  List<MatchGWModel> get gw4G2 => _gw4G2;

  List<MatchGWModel> _gw5G2 = [];
  List<MatchGWModel> get gw5G2 => _gw5G2;

  List<MatchGWModel> _gw6G2 = [];
  List<MatchGWModel> get gw6G2 => _gw6G2;

  List<MatchGWModel> _gw7G2 = [];
  List<MatchGWModel> get gw7G2 => _gw7G2;

  List<MatchGWModel> _gw8G2 = [];
  List<MatchGWModel> get gw8G2 => _gw8G2;

  List<MatchGWModel> _gw9G2 = [];
  List<MatchGWModel> get gw9G2 => _gw9G2;

  List<MatchGWModel> _gw10G2 = [];
  List<MatchGWModel> get gw10G2 => _gw10G2;

  List<MatchGWModel> _gw11G2 = [];
  List<MatchGWModel> get gw11G2 => _gw11G2;

  List<MatchGWModel> _gw12G2 = [];
  List<MatchGWModel> get gw12G2 => _gw12G2;

  List<MatchGWModel> _gw13G2 = [];
  List<MatchGWModel> get gw13G2 => _gw13G2;

  List<MatchGWModel> _gw14G2 = [];
  List<MatchGWModel> get gw14G2 => _gw14G2;

  List<MatchGWModel> _gw15G2 = [];
  List<MatchGWModel> get gw15G2 => _gw15G2;

  List<MatchGWModel> _gw16G2 = [];
  List<MatchGWModel> get gw16G2 => _gw16G2;

  List<MatchGWModel> _gw17G2 = [];
  List<MatchGWModel> get gw17G2 => _gw17G2;

  List<MatchGWModel> _gw18G2 = [];
  List<MatchGWModel> get gw18G2 => _gw18G2;

  List<MatchGWModel> _gw19G2 = [];
  List<MatchGWModel> get gw19G2 => _gw19G2;

  List<MatchGWModel> _gw20G2 = [];
  List<MatchGWModel> get gw20G2 => _gw20G2;

  List<MatchGWModel> _gw21G2 = [];
  List<MatchGWModel> get gw21G2 => _gw21G2;

  List<MatchGWModel> _gw22G2 = [];
  List<MatchGWModel> get gw22G2 => _gw22G2;

  List<MatchGWModel> _gw23G2 = [];
  List<MatchGWModel> get gw23G2 => _gw23G2;

  List<MatchGWModel> _gw24G2 = [];
  List<MatchGWModel> get gw24G2 => _gw24G2;

  List<MatchGWModel> _gw25G2 = [];
  List<MatchGWModel> get gw25G2 => _gw25G2;

  List<MatchGWModel> _gw26G2 = [];
  List<MatchGWModel> get gw26G2 => _gw26G2;

  List<MatchGWModel> _gw27G2 = [];
  List<MatchGWModel> get gw27G2 => _gw27G2;

  List<MatchGWModel> _gw28G2 = [];
  List<MatchGWModel> get gw28G2 => _gw28G2;

  List<MatchGWModel> _gw29G2 = [];
  List<MatchGWModel> get gw29G2 => _gw29G2;

  List<MatchGWModel> _gw30G2 = [];
  List<MatchGWModel> get gw30G2 => _gw30G2;

  List<MatchGWModel> _gw31G2 = [];
  List<MatchGWModel> get gw31G2 => _gw31G2;

  List<MatchGWModel> _gw32G2 = [];
  List<MatchGWModel> get gw32G2 => _gw32G2;

  List<MatchGWModel> _gw33G2 = [];
  List<MatchGWModel> get gw33G2 => _gw33G2;

  List<MatchGWModel> _gw34G2 = [];
  List<MatchGWModel> get gw34G2 => _gw34G2;

  List<MatchGWModel> _gw35G2 = [];
  List<MatchGWModel> get gw35G2 => _gw35G2;

  List<MatchGWModel> _gw36G2 = [];
  List<MatchGWModel> get gw36G2 => _gw36G2;

  List<MatchGWModel> _gw37G2 = [];
  List<MatchGWModel> get gw37G2 => _gw37G2;

  List<MatchGWModel> _gw38G2 = [];
  List<MatchGWModel> get gw38G2 => _gw38G2;

  List _teamsPointsG2 = [];
  List get teamsPointsG2 => _teamsPointsG2;

  bool isNull = true;

  bool _isDataNull = true;

  bool _gw1CurrentG2 = false;
  bool get gw1CurrentG2 => _gw1CurrentG2;
  bool _gw2CurrentG2 = false;
  bool get gw2CurrentG2 => _gw2CurrentG2;
  bool _gw3CurrentG2 = false;
  bool get gw3CurrentG2 => _gw3CurrentG2;
  bool _gw4CurrentG2 = false;
  bool get gw4CurrentG2 => _gw4CurrentG2;
  bool _gw5CurrentG2 = false;
  bool get gw5CurrentG2 => _gw5CurrentG2;
  bool _gw6CurrentG2 = false;
  bool get gw6CurrentG2 => _gw6CurrentG2;
  bool _gw7CurrentG2 = false;
  bool get gw7CurrentG2 => _gw7CurrentG2;
  bool _gw8CurrentG2 = false;
  bool get gw8CurrentG2 => _gw8CurrentG2;
  bool _gw9CurrentG2 = false;
  bool get gw9CurrentG2 => _gw9CurrentG2;
  bool _gw10CurrentG2 = false;
  bool get gw10CurrentG2 => _gw10CurrentG2;
  bool _gw11CurrentG2 = false;
  bool get gw11CurrentG2 => _gw11CurrentG2;
  bool _gw12CurrentG2 = false;
  bool get gw12CurrentG2 => _gw12CurrentG2;
  bool _gw13CurrentG2 = false;
  bool get gw13CurrentG2 => _gw13CurrentG2;
  bool _gw14CurrentG2 = false;
  bool get gw14CurrentG2 => _gw14CurrentG2;
  bool _gw15CurrentG2 = false;
  bool get gw15CurrentG2 => _gw15CurrentG2;
  bool _gw16CurrentG2 = false;
  bool get gw16CurrentG2 => _gw16CurrentG2;
  bool _gw17CurrentG2 = false;
  bool get gw17CurrentG2 => _gw17CurrentG2;
  bool _gw18CurrentG2 = false;
  bool get gw18CurrentG2 => _gw18CurrentG2;
  bool _gw19CurrentG2 = false;
  bool get gw19CurrentG2 => _gw19CurrentG2;
  bool _gw20CurrentG2 = false;
  bool get gw20CurrentG2 => _gw20CurrentG2;
  bool _gw21CurrentG2 = false;
  bool get gw21CurrentG2 => _gw21CurrentG2;
  bool _gw22CurrentG2 = false;
  bool get gw22CurrentG2 => _gw22CurrentG2;
  bool _gw23CurrentG2 = false;
  bool get gw23CurrentG2 => _gw23CurrentG2;
  bool _gw24CurrentG2 = false;
  bool get gw24CurrentG2 => _gw24CurrentG2;
  bool _gw25CurrentG2 = false;
  bool get gw25CurrentG2 => _gw25CurrentG2;
  bool _gw26CurrentG2 = false;
  bool get gw26CurrentG2 => _gw26CurrentG2;
  bool _gw27CurrentG2 = false;
  bool get gw27CurrentG2 => _gw27CurrentG2;
  bool _gw28CurrentG2 = false;
  bool get gw28CurrentG2 => _gw28CurrentG2;
  bool _gw29CurrentG2 = false;
  bool get gw29CurrentG2 => _gw29CurrentG2;
  bool _gw30CurrentG2 = false;
  bool get gw30CurrentG2 => _gw30CurrentG2;
  bool _gw31CurrentG2 = false;
  bool get gw31CurrentG2 => _gw31CurrentG2;
  bool _gw32CurrentG2 = false;
  bool get gw32CurrentG2 => _gw32CurrentG2;
  bool _gw33CurrentG2 = false;
  bool get gw33CurrentG2 => _gw33CurrentG2;
  bool _gw34CurrentG2 = false;
  bool get gw34CurrentG2 => _gw34CurrentG2;
  bool _gw35CurrentG2 = false;
  bool get gw35CurrentG2 => _gw35CurrentG2;
  bool _gw36CurrentG2 = false;
  bool get gw36CurrentG2 => _gw36CurrentG2;
  bool _gw37CurrentG2 = false;
  bool get gw37CurrentG2 => _gw37CurrentG2;
  bool _gw38CurrentG2 = false;
  bool get gw38CurrentG2 => _gw38CurrentG2;

  List<TeamPlayersModel> _teamPlayersG2 = [];
  List _allPlayersIdG2 = [];

  List<PlayerInfoModel> _previousPlayerInfoG2 = [];
  List<PlayerInfoModel> get previousPlayerInfoG2 => _previousPlayerInfoG2;

  List<PlayerInfoModel> _toGetCurrentEvent = [];

  List<CurrentPlayerGwPoints> _livePlayerPointsG2 = [];

  List<PlayerGwPoints> _previousPlayerPointsG2 = [];

  num _points = 0;

  bool _isteamPlayersNull = false;

  List<num> _totalCurrentGWPointsG2 = [];
  List<num> get totalCurrentGWPointsG2 => _totalCurrentGWPointsG2;

  List<num> _totalLastGWPoints = [];
  List<num> get totalLastGWPoints => _totalLastGWPoints;

  bool _isLoadingG2 = true;
  bool get isLoadingG2 => _isLoadingG2;
  bool _isFinished = false;

  Future<void> getTeamsGroupTwoTeams() async {
    _groupTwoTeams.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _groupTwoTeams.add(TeamTableModel.fromjson(v));
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

  Future<void> gameweekCreationG2() async {
    notifyListeners();
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[14],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[10],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[12],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[6],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[2],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[3],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[0],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[15],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[4],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[13],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[8],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[1],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[17],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[7],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[5],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[9],
    ));
    _gw1G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[11],
      team1Result: _gw1CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.isEmpty
              ? 0
              : _teamsPointsG2[0].gwPoints[16],
    ));
    notifyListeners();

    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[9],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[11],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[16],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[14],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[7],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[5],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[1],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[17],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[13],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[8],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[15],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[4],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[3],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[0],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[6],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[2],
    ));
    _gw2G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[10],
      team1Result: _gw2CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 2
              ? 0
              : _teamsPointsG2[1].gwPoints[12],
    ));
    notifyListeners();

    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[0],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[6],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[2],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[10],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[14],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[12],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[4],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[3],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[8],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[15],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[17],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[13],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[5],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[1],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[11],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[7],
    ));
    _gw3G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[16],
      team1Result: _gw3CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 3
              ? 0
              : _teamsPointsG2[2].gwPoints[9],
    ));
    notifyListeners();

    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[13],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[5],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[7],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[16],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[1],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[11],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[9],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[14],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[15],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[17],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[3],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[8],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[6],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[4],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[9],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[0],
    ));
    _gw4G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[12],
      team1Result: _gw4CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 4
              ? 0
              : _teamsPointsG2[3].gwPoints[2],
    ));
    notifyListeners();

    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[17],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[3],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[0],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[12],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[4],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[10],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[8],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[6],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[14],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[3],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[5],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[15],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[11],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[13],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[16],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[1],
    ));
    _gw5G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[9],
      team1Result: _gw5CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 5
              ? 0
              : _teamsPointsG2[4].gwPoints[7],
    ));
    notifyListeners();

    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[6],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[17],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[1],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[9],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[13],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[16],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[15],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[11],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[3],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[5],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[7],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[14],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[10],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[8],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[12],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[4],
    ));
    _gw6G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[3],
      team1Result: _gw6CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 6
              ? 0
              : _teamsPointsG2[5].gwPoints[0],
    ));
    notifyListeners();

    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[16],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[15],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[4],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[2],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[8],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[12],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[17],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[10],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[5],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[6],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[11],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[3],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[14],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[0],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[9],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[13],
    ));
    _gw7G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[7],
      team1Result: _gw7CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[1],
    ));
    notifyListeners();

    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[2],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[8],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[13],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[7],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[15],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[9],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[3],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[16],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[6],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[11],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[10],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[5],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[12],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[17],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[1],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[14],
    ));
    _gw8G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[0],
      team1Result: _gw8CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 8
              ? 0
              : _teamsPointsG2[7].gwPoints[4],
    ));
    notifyListeners();

    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[1],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[13],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[8],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[0],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[17],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[2],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[5],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[12],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[11],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[10],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[16],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[6],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[9],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[3],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[7],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[15],
    ));
    _gw9G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[14],
      team1Result: _gw9CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 9
              ? 0
              : _teamsPointsG2[8].gwPoints[4],
    ));
    notifyListeners();

    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[4],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[8],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[15],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[1],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[3],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[7],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[6],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[9],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[10],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[16],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[12],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[11],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[2],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[5],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[0],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[17],
    ));
    _gw10G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[13],
      team1Result: _gw10CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 10
              ? 0
              : _teamsPointsG2[9].gwPoints[14],
    ));
    notifyListeners();

    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[1],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[3],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[17],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[4],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[5],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[0],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[11],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[2],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[16],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[12],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[9],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[10],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[7],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[6],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[14],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[8],
    ));
    _gw11G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[13],
      team1Result: _gw11CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 11
              ? 0
              : _teamsPointsG2[10].gwPoints[5],
    ));
    notifyListeners();

    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[0],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[11],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[3],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[13],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[6],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[1],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[10],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[7],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[12],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[9],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[2],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[16],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[15],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[14],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[4],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[5],
    ));
    _gw12G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[8],
      team1Result: _gw12CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 12
              ? 0
              : _teamsPointsG2[11].gwPoints[17],
    ));
    notifyListeners();

    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[7],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[12],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[5],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[8],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[11],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[4],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[16],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[0],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[9],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[2],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[14],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[17],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[1],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[10],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[13],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[6],
    ));
    _gw13G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[15],
      team1Result: _gw13CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 13
              ? 0
              : _teamsPointsG2[12].gwPoints[3],
    ));
    notifyListeners();

    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[2],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[7],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[16],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[5],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[10],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[13],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[12],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[1],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[3],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[14],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[0],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[9],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[4],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[16],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[8],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[11],
    ));
    _gw14G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[17],
      team1Result: _gw14CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 14
              ? 0
              : _teamsPointsG2[13].gwPoints[5],
    ));
    notifyListeners();

    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[9],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[4],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[11],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[17],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[16],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[8],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[14],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[5],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[7],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[0],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[1],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[2],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[13],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[12],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[15],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[10],
    ));
    _gw15G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[3],
      team1Result: _gw15CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 15
              ? 0
              : _teamsPointsG2[14].gwPoints[6],
    ));
    notifyListeners();

    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[12],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[15],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[10],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[3],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[6],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[14],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[2],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[13],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[0],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[1],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[4],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[7],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[8],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[9],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[16],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[17],
    ));
    _gw16G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[5],
      team1Result: _gw16CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 16
              ? 0
              : _teamsPointsG2[15].gwPoints[11],
    ));
    notifyListeners();

    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[16],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[5],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[14],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[11],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[9],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[17],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[8],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[8],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[1],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[4],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[13],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[0],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[15],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[2],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[3],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[12],
    ));
    _gw17G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[6],
      team1Result: _gw17CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 17
              ? 0
              : _teamsPointsG2[16].gwPoints[10],
    ));
    notifyListeners();

    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[14],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[10],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[12],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[6],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[2],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[3],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[0],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[15],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[4],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[13],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[8],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[1],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[17],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[7],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[5],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[9],
    ));
    _gw18G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[11],
      team1Result: _gw18CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 18
              ? 0
              : _teamsPointsG2[17].gwPoints[16],
    ));
    notifyListeners();

    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[9],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[11],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[16],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[14],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[7],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[5],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[1],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[17],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[13],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[8],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[15],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[4],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[3],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[0],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[6],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[2],
    ));
    _gw19G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[10],
      team1Result: _gw19CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 19
              ? 0
              : _teamsPointsG2[18].gwPoints[12],
    ));
    notifyListeners();

    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[0],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[6],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[2],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[10],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[14],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[12],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[4],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[3],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[8],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[15],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[17],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[13],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[5],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[1],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[11],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[7],
    ));
    _gw20G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[16],
      team1Result: _gw20CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 20
              ? 0
              : _teamsPointsG2[19].gwPoints[9],
    ));
    notifyListeners();

    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[13],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[5],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[7],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[16],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[1],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[11],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[9],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[14],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[15],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[17],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[3],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[8],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[6],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[4],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[9],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[0],
    ));
    _gw21G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[12],
      team1Result: _gw21CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 21
              ? 0
              : _teamsPointsG2[20].gwPoints[2],
    ));
    notifyListeners();

    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[17],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[3],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[0],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[12],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[4],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[10],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[8],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[6],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[14],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[3],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[5],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[15],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[11],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[13],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[16],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[1],
    ));
    _gw22G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[9],
      team1Result: _gw22CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 22
              ? 0
              : _teamsPointsG2[21].gwPoints[7],
    ));
    notifyListeners();

    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[6],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[17],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[1],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[9],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[13],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[16],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[15],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[11],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[3],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[5],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[7],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[14],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[10],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[8],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[12],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[4],
    ));
    _gw23G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[3],
      team1Result: _gw23CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 23
              ? 0
              : _teamsPointsG2[22].gwPoints[0],
    ));
    notifyListeners();

    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[16],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[15],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[4],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[2],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[8],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[12],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[17],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[10],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[5],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[6],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[11],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[3],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[14],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[0],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[9],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[13],
    ));
    _gw24G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[7],
      team1Result: _gw24CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 24
              ? 0
              : _teamsPointsG2[23].gwPoints[1],
    ));
    notifyListeners();

    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[2],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[8],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[13],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[7],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[15],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[9],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[3],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[16],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[6],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[11],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[10],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[5],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[12],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[17],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[1],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[14],
    ));
    _gw25G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[0],
      team1Result: _gw25CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 25
              ? 0
              : _teamsPointsG2[24].gwPoints[4],
    ));
    notifyListeners();

    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[1],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[13],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[8],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[0],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[17],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[2],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[5],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[12],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[11],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[10],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[16],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[6],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[9],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[3],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[7],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[15],
    ));
    _gw26G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[14],
      team1Result: _gw26CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 26
              ? 0
              : _teamsPointsG2[25].gwPoints[4],
    ));
    notifyListeners();

    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[4],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[8],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[15],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[1],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[3],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[7],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[6],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[9],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[10],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[16],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[12],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[11],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[2],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[5],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[0],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[17],
    ));
    _gw27G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[13],
      team1Result: _gw27CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 27
              ? 0
              : _teamsPointsG2[26].gwPoints[14],
    ));
    notifyListeners();

    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[1],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[3],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[17],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[4],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[5],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[0],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[11],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[2],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[16],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[12],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[9],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[10],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[7],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[6],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[14],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[8],
    ));
    _gw28G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[13],
      team1Result: _gw28CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 28
              ? 0
              : _teamsPointsG2[27].gwPoints[15],
    ));
    notifyListeners();

    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[0],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[11],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[3],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[13],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[6],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[1],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[10],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[7],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[12],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[9],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[2],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[16],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[15],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[14],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[4],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[5],
    ));
    _gw29G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[8],
      team1Result: _gw29CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 29
              ? 0
              : _teamsPointsG2[28].gwPoints[17],
    ));
    notifyListeners();

    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[7],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[12],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[5],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[8],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[11],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[4],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[16],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[0],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[9],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[2],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[14],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[17],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[1],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[10],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[13],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[6],
    ));
    _gw30G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[15],
      team1Result: _gw30CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 30
              ? 0
              : _teamsPointsG2[29].gwPoints[3],
    ));
    notifyListeners();

    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[2],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[7],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[16],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[5],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[10],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[13],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[12],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[1],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[3],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[14],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[0],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[9],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[16].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[4],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[16],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[8],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[11],
    ));
    _gw31G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[17].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[17],
      team1Result: _gw31CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 31
              ? 0
              : _teamsPointsG2[30].gwPoints[5],
    ));
    notifyListeners();

    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[9],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[4],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[11].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[11],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[17],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[16],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[8],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[14],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[5],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[7],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[0],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[1],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[2],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[13],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[12],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[15],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[10],
    ));
    _gw32G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[6].teamName],
      team0Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[3],
      team1Result: _gw32CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 32
              ? 0
              : _teamsPointsG2[31].gwPoints[6],
    ));
    notifyListeners();

    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[12].teamName, _groupTwoTeams[15].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[12],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[15],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[10].teamName, _groupTwoTeams[3].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[10],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[3],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[14].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[6],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[14],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[2].teamName, _groupTwoTeams[13].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[2],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[13],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[0].teamName, _groupTwoTeams[1].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[0],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[1],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[4].teamName, _groupTwoTeams[7].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[4],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[7],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[8].teamName, _groupTwoTeams[9].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[8],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[9],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[16],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[17],
    ));
    _gw33G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[5].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[5],
      team1Result: _gw33CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 33
              ? 0
              : _teamsPointsG2[32].gwPoints[11],
    ));
    notifyListeners();

    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[16].teamName, _groupTwoTeams[5].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[16]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[16],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[5]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[5],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[14].teamName, _groupTwoTeams[11].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[14]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[14],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[11]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[11],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[9].teamName, _groupTwoTeams[17].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[9]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[9],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[17]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[17],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[7].teamName, _groupTwoTeams[8].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[7]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[8],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[8]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[8],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[1].teamName, _groupTwoTeams[4].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[1]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[1],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[4]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[4],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[13].teamName, _groupTwoTeams[0].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[13]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[13],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[0]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[0],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[15].teamName, _groupTwoTeams[2].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[15]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[15],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[2]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[2],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[3].teamName, _groupTwoTeams[12].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[3]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[3],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[12]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[12],
    ));
    _gw34G2.add(MatchGWModel(
      gwFixture: [_groupTwoTeams[6].teamName, _groupTwoTeams[10].teamName],
      team0Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[6]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[6],
      team1Result: _gw34CurrentG2
          ? _totalCurrentGWPointsG2[10]
          : _teamsPointsG2.length < 34
              ? 0
              : _teamsPointsG2[33].gwPoints[10],
    ));
    notifyListeners();

    _isLoadingG2 = false;
    notifyListeners();
  }

  Future<void> getIdsForTeamPointsG2() async {
    _teamPlayersG2 = [];
    _allPlayersIdG2 = [];
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG2.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _teamPlayersG2.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
      _teamPlayersG2
          .sort((a, b) => int.parse(a.teamId).compareTo(int.parse(b.teamId)));
      for (int i = 0; i < _teamPlayersG2.length; i++) {
        _allPlayersIdG2.add(_teamPlayersG2[i].playersId);
      }
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
  }

  Future<void> getPreviousPlayerInfoG2(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

    _previousPlayerInfoG2.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getLivePlayerPointsG2(String playerId, String event) async {
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

    _livePlayerPointsG2.add(CurrentPlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }

  bool _isGettingDataG2 = false;
  bool get isGettingDataG2 => _isGettingDataG2;

  Future<void> getCurrentGWDataGroupTwo() async {
    _isLoadingG2 = true;
    notifyListeners();
    _isGettingDataG2 = true;
    notifyListeners();
    _totalCurrentGWPointsG2.clear();
    await getIdsForTeamPointsG2();

    int i = 0;
    for (int x = 0; x < _allPlayersIdG2.length; x++) {
      _points = 0;
      for (int j = 0; j < _allPlayersIdG2[x].length; j++) {
        await getPreviousPlayerInfoG2(_allPlayersIdG2[x][j].toString());
        await getLivePlayerPointsG2(_allPlayersIdG2[x][j].toString(),
            (_previousPlayerInfoG2[i].currentEvent).toString());

        _points += _livePlayerPointsG2[i].entryHistory['points'] -
            _livePlayerPointsG2[i].entryHistory['event_transfers_cost'];

        _players.add(_livePlayerPointsG2[i].entryHistory['points'] -
            _livePlayerPointsG2[i].entryHistory['event_transfers_cost']);

        _playersNameG2.add(
            '${_previousPlayerInfoG2[i].playerFirstName} ${_previousPlayerInfoG2[i].playerLastName}');
        i++;
      }
      _totalCurrentGWPointsG2.add(_points);
      notifyListeners();
    }

    _playerOfWeekG2 = _players.reduce(max);
    _teamOfWeekG2 = _totalCurrentGWPointsG2.reduce(max);
    notifyListeners();

    _players.asMap().forEach((index, value) {
      if (value == _playerOfWeekG2) {
        _playerOfWeekNameG2.add(_playersNameG2[index]);
      }
    });
    notifyListeners();

    _totalCurrentGWPointsG2.asMap().forEach((index, value) {
      if (value == _teamOfWeekG2) {
        _teamOfWeekNameG2.add(_groupTwoTeams[index].teamName);
      }
    });
    notifyListeners();

    switch (_previousPlayerInfoG2[0].currentEvent) {
      case 1:
        _gw1CurrentG2 = true;
        break;
      case 2:
        _gw2CurrentG2 = true;
        break;
      case 3:
        _gw3CurrentG2 = true;
        break;
      case 4:
        _gw4CurrentG2 = true;
        break;
      case 5:
        _gw5CurrentG2 = true;
        break;
      case 6:
        _gw6CurrentG2 = true;
        break;
      case 7:
        _gw7CurrentG2 = true;
        break;
      case 8:
        _gw8CurrentG2 = true;
        break;
      case 9:
        _gw9CurrentG2 = true;
        break;
      case 10:
        _gw10CurrentG2 = true;
        break;
      case 11:
        _gw11CurrentG2 = true;
        break;
      case 12:
        _gw12CurrentG2 = true;
        break;
      case 13:
        _gw13CurrentG2 = true;
        break;
      case 14:
        _gw14CurrentG2 = true;
        break;
      case 15:
        _gw15CurrentG2 = true;
        break;
      case 16:
        _gw16CurrentG2 = true;
        break;
      case 17:
        _gw17CurrentG2 = true;
        break;
      case 18:
        _gw18CurrentG2 = true;
        break;
      case 19:
        _gw19CurrentG2 = true;
        break;
      case 20:
        _gw20CurrentG2 = true;
        break;
      case 21:
        _gw21CurrentG2 = true;
        break;
      case 22:
        _gw22CurrentG2 = true;
        break;
      case 23:
        _gw23CurrentG2 = true;
        break;
      case 24:
        _gw24CurrentG2 = true;
        break;
      case 25:
        _gw25CurrentG2 = true;
        break;
      case 26:
        _gw26CurrentG2 = true;
        break;
      case 27:
        _gw27CurrentG2 = true;
        break;
      case 28:
        _gw28CurrentG2 = true;
        break;
      case 29:
        _gw29CurrentG2 = true;
        break;
      case 30:
        _gw30CurrentG2 = true;
        break;
      case 31:
        _gw31CurrentG2 = true;
        break;
      case 32:
        _gw32CurrentG2 = true;
        break;
      case 33:
        _gw33CurrentG2 = true;
        break;
      case 34:
        _gw34CurrentG2 = true;
        break;
      case 35:
        _gw35CurrentG2 = true;
        break;
      case 36:
        _gw36CurrentG2 = true;
        break;
      case 37:
        _gw37CurrentG2 = true;
        break;
      case 38:
        _gw38CurrentG2 = true;
        break;
      default:
    }
    notifyListeners();
    _isGettingDataG2 = false;
    notifyListeners();
  }

  Future<void> getTeamsDataG2() async {
    _isLoadingG2 = true;
    _teamsPointsG2.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}GWG2PointsData.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _teamsPointsG2.add(GWPointsModel.fromjson(v));
          notifyListeners();
        },
      );
    }
  }

  Future<bool> addPlayersDataG2(Map<String, dynamic> players) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}GWG2PointsData.json'),
      body: json.encode(players),
    );

    if (response.statusCode == 200) {
      players['id'] = json.decode(response.body)['name'];

      _teamsPointsG2.add(GWPointsModel.fromjson(players));
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

    _previousPlayerPointsG2.add(PlayerGwPoints.fromjson(pointsData));
    notifyListeners();
  }
}
