import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/team_points_model.dart';
import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:scoped_model/scoped_model.dart';

mixin PlayOffController on Model {
  List<int> _playOffQFinalTeamsId = [];
  List<int> _playOffSemiFinalTeamsId = [];
  List<int> _playOffFinalTeamsId = [];

  List<MatchGWModel> _gw35G1PlayOffQFinal = [];
  List<MatchGWModel> get gw35G1PlayOffQFinal => _gw35G1PlayOffQFinal;

  List<MatchGWModel> _gw36G1PlayOffSemiFinal = [];
  List<MatchGWModel> get gw36G1PlayOffSemiFinal => _gw36G1PlayOffSemiFinal;

  List<MatchGWModel> _gw37G1PlayOffFinal1 = [];
  List<MatchGWModel> get gw37G1PlayOffFinal1 => _gw37G1PlayOffFinal1;

  List<MatchGWModel> _gw38G1PlayOffFinal2 = [];
  List<MatchGWModel> get gw38G1PlayOffFinal2 => _gw38G1PlayOffFinal2;

  bool _isGw1WonMatch1 = false;
  bool _isGw1WonMatch2 = false;
  bool _isGw1WonMatch3 = false;
  bool _isGw1WonMatch4 = false;

  bool _isGw1WonMatch5 = false;
  bool _isGw1WonMatch6 = false;

  Future<void> playOffQFinalCreator(
      {required int currentEvent,
      required bool isGwFinished,
      required List<TeamTableModel> groupOneTeams,
      required List<TeamTableModel> groupTwoTeams}) async {
    if (currentEvent == 34 && isGwFinished) {
      groupOneTeams.sort((a, b) => b.points.compareTo(a.points));
      groupTwoTeams.sort((a, b) => b.points.compareTo(a.points));
      for (int i = 2; i < 6; i++) {
        _playOffQFinalTeamsId.add(int.parse(groupOneTeams[i].teamId) - 20);
      }
      for (int j = 2; j < 6; j++) {
        _playOffQFinalTeamsId.add(int.parse(groupOneTeams[j].teamId) - 38);
      }
    }
  }

  Future<void> playOffSemiFinalCreator({
    required int currentEvent,
    required bool isGwFinished,
    required List<GWPointsModel> teamsG1Points,
    required List<GWPointsModel> teamsG2Points,
    int? indexWhenDraw1,
    int? indexWhenDraw2,
    int? indexWhenDraw3,
    int? indexWhenDraw4,
  }) async {
    if (currentEvent == 35 && isGwFinished) {
      if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[0]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[6]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[0]);
        _isGw1WonMatch1 = true;
      } else if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[6]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[0]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[6]);
        _isGw1WonMatch1 = false;
      } else {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[indexWhenDraw1!]);
        indexWhenDraw1 == 0 ? _isGw1WonMatch1 = true : _isGw1WonMatch1 = false;
      }
    }
    if (currentEvent == 35 && isGwFinished) {
      if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[3]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[5]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[3]);
        _isGw1WonMatch2 = true;
      } else if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[5]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[3]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[5]);
        _isGw1WonMatch2 = false;
      } else {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[indexWhenDraw2!]);
        indexWhenDraw2 == 3 ? _isGw1WonMatch2 = true : _isGw1WonMatch2 = false;
      }
    }
    if (currentEvent == 35 && isGwFinished) {
      if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[1]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[7]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[1]);
        _isGw1WonMatch3 = true;
      } else if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[7]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[1]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[7]);
        _isGw1WonMatch3 = false;
      } else {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[indexWhenDraw3!]);
        indexWhenDraw3 == 1 ? _isGw1WonMatch3 = true : _isGw1WonMatch3 = false;
      }
    }
    if (currentEvent == 35 && isGwFinished) {
      if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[2]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[4]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[2]);
        _isGw1WonMatch4 = true;
      } else if (teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[4]] >
          teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[2]]) {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[4]);
        _isGw1WonMatch4 = false;
      } else {
        _playOffSemiFinalTeamsId.add(_playOffQFinalTeamsId[indexWhenDraw4!]);
        indexWhenDraw4 == 2 ? _isGw1WonMatch4 = true : _isGw1WonMatch4 = false;
      }
    }
  }

  Future<void> playOffFinalCreator({
    required int currentEvent,
    required bool isGwFinished,
    required List<GWPointsModel> teamsG1Points,
    required List<GWPointsModel> teamsG2Points,
    int? indexWhenDraw1,
    int? indexWhenDraw2,
  }) async {
    if (currentEvent == 36 && isGwFinished) {
      if (teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[0]] >
          teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[1]]) {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[0]);
        _isGw1WonMatch5 = _isGw1WonMatch1;
      } else if (teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[1]] >
          teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[0]]) {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[1]);
        _isGw1WonMatch5 = _isGw1WonMatch2;
      } else {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[indexWhenDraw1!]);
        indexWhenDraw1 == 0
            ? _isGw1WonMatch5 = _isGw1WonMatch1
            : _isGw1WonMatch5 = _isGw1WonMatch2;
      }
    }
    if (currentEvent == 36 && isGwFinished) {
      if (teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[2]] >
          teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[3]]) {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[2]);
        _isGw1WonMatch6 = _isGw1WonMatch3;
      } else if (teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[3]] >
          teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[2]]) {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[3]);
        _isGw1WonMatch6 = _isGw1WonMatch4;
      } else {
        _playOffFinalTeamsId.add(_playOffSemiFinalTeamsId[indexWhenDraw2!]);
        indexWhenDraw2 == 0
            ? _isGw1WonMatch5 = _isGw1WonMatch3
            : _isGw1WonMatch5 = _isGw1WonMatch4;
      }
    }
  }

  Future<void> playOffQfinalMatchesCreator({
    required List<TeamTableModel> groupOneTeams,
    required List<TeamTableModel> groupTwoTeams,
    required List<GWPointsModel> teamsG1Points,
    required List<GWPointsModel> teamsG2Points,
    required List totalCurrentGWPointsG1,
    required List totalCurrentGWPointsG2,
    required bool isGwCurrent,
  }) async {
    _gw35G1PlayOffQFinal.add(MatchGWModel(
      gwFixture: [
        groupOneTeams[_playOffQFinalTeamsId[0]].teamName,
        groupTwoTeams[_playOffQFinalTeamsId[6]].teamName
      ],
      team0Result: isGwCurrent
          ? totalCurrentGWPointsG1[_playOffQFinalTeamsId[0]]
          : teamsG1Points.length < 35
              ? 0
              : teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[0]],
      team1Result: isGwCurrent
          ? totalCurrentGWPointsG2[_playOffQFinalTeamsId[6]]
          : teamsG2Points.length < 35
              ? 0
              : teamsG2Points[34].gwPoints[_playOffQFinalTeamsId[6]],
    ));
    _gw35G1PlayOffQFinal.add(MatchGWModel(
      gwFixture: [
        groupOneTeams[_playOffQFinalTeamsId[3]].teamName,
        groupTwoTeams[_playOffQFinalTeamsId[5]].teamName
      ],
      team0Result: isGwCurrent
          ? totalCurrentGWPointsG1[_playOffQFinalTeamsId[3]]
          : teamsG1Points.length < 35
              ? 0
              : teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[3]],
      team1Result: isGwCurrent
          ? totalCurrentGWPointsG2[_playOffQFinalTeamsId[5]]
          : teamsG2Points.length < 35
              ? 0
              : teamsG2Points[34].gwPoints[_playOffQFinalTeamsId[5]],
    ));
    _gw35G1PlayOffQFinal.add(MatchGWModel(
      gwFixture: [
        groupOneTeams[_playOffQFinalTeamsId[1]].teamName,
        groupTwoTeams[_playOffQFinalTeamsId[7]].teamName
      ],
      team0Result: isGwCurrent
          ? totalCurrentGWPointsG1[_playOffQFinalTeamsId[1]]
          : teamsG1Points.length < 35
              ? 0
              : teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[1]],
      team1Result: isGwCurrent
          ? totalCurrentGWPointsG2[_playOffQFinalTeamsId[7]]
          : teamsG2Points.length < 35
              ? 0
              : teamsG2Points[34].gwPoints[_playOffQFinalTeamsId[7]],
    ));
    _gw35G1PlayOffQFinal.add(MatchGWModel(
      gwFixture: [
        groupOneTeams[_playOffQFinalTeamsId[2]].teamName,
        groupTwoTeams[_playOffQFinalTeamsId[4]].teamName
      ],
      team0Result: isGwCurrent
          ? totalCurrentGWPointsG1[_playOffQFinalTeamsId[2]]
          : teamsG1Points.length < 35
              ? 0
              : teamsG1Points[34].gwPoints[_playOffQFinalTeamsId[2]],
      team1Result: isGwCurrent
          ? totalCurrentGWPointsG2[_playOffQFinalTeamsId[4]]
          : teamsG2Points.length < 35
              ? 0
              : teamsG2Points[34].gwPoints[_playOffQFinalTeamsId[4]],
    ));
    notifyListeners();
  }

  Future<void> playOffSemiFinalMatchesCreator({
    required List<TeamTableModel> groupOneTeams,
    required List<TeamTableModel> groupTwoTeams,
    required List<GWPointsModel> teamsG1Points,
    required List<GWPointsModel> teamsG2Points,
    required List totalCurrentGWPointsG1,
    required List totalCurrentGWPointsG2,
    required bool isGwCurrent,
  }) async {
    _gw36G1PlayOffSemiFinal.add(MatchGWModel(
      gwFixture: [
        _isGw1WonMatch1
            ? groupOneTeams[_playOffSemiFinalTeamsId[0]].teamName
            : groupTwoTeams[_playOffSemiFinalTeamsId[0]].teamName,
        _isGw1WonMatch2
            ? groupOneTeams[_playOffSemiFinalTeamsId[1]].teamName
            : groupTwoTeams[_playOffSemiFinalTeamsId[1]].teamName,
      ],
      team0Result: _isGw1WonMatch1
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffSemiFinalTeamsId[0]]
              : teamsG1Points.length < 36
                  ? 0
                  : teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[0]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffSemiFinalTeamsId[0]]
              : teamsG2Points.length < 36
                  ? 0
                  : teamsG2Points[35].gwPoints[_playOffSemiFinalTeamsId[0]],
      team1Result: _isGw1WonMatch2
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffSemiFinalTeamsId[1]]
              : teamsG1Points.length < 36
                  ? 0
                  : teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[1]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffSemiFinalTeamsId[1]]
              : teamsG2Points.length < 36
                  ? 0
                  : teamsG2Points[35].gwPoints[_playOffSemiFinalTeamsId[1]],
    ));
    _gw36G1PlayOffSemiFinal.add(MatchGWModel(
      gwFixture: [
        _isGw1WonMatch1
            ? groupOneTeams[_playOffSemiFinalTeamsId[2]].teamName
            : groupTwoTeams[_playOffSemiFinalTeamsId[2]].teamName,
        _isGw1WonMatch2
            ? groupOneTeams[_playOffSemiFinalTeamsId[3]].teamName
            : groupTwoTeams[_playOffSemiFinalTeamsId[3]].teamName,
      ],
      team0Result: _isGw1WonMatch1
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffSemiFinalTeamsId[2]]
              : teamsG1Points.length < 36
                  ? 0
                  : teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[2]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffSemiFinalTeamsId[2]]
              : teamsG2Points.length < 36
                  ? 0
                  : teamsG2Points[35].gwPoints[_playOffSemiFinalTeamsId[2]],
      team1Result: _isGw1WonMatch2
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffSemiFinalTeamsId[3]]
              : teamsG1Points.length < 36
                  ? 0
                  : teamsG1Points[35].gwPoints[_playOffSemiFinalTeamsId[3]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffSemiFinalTeamsId[3]]
              : teamsG2Points.length < 36
                  ? 0
                  : teamsG2Points[35].gwPoints[_playOffSemiFinalTeamsId[3]],
    ));
    notifyListeners();
  }

  Future<void> playOffFinalMatchesCreator({
    required List<TeamTableModel> groupOneTeams,
    required List<TeamTableModel> groupTwoTeams,
    required List<GWPointsModel> teamsG1Points,
    required List<GWPointsModel> teamsG2Points,
    required List totalCurrentGWPointsG1,
    required List totalCurrentGWPointsG2,
    required bool isGwCurrent,
  }) async {
    _gw37G1PlayOffFinal1.add(MatchGWModel(
      gwFixture: [
        _isGw1WonMatch5
            ? groupOneTeams[_playOffFinalTeamsId[0]].teamName
            : groupTwoTeams[_playOffFinalTeamsId[0]].teamName,
        _isGw1WonMatch6
            ? groupOneTeams[_playOffFinalTeamsId[1]].teamName
            : groupTwoTeams[_playOffFinalTeamsId[1]].teamName,
      ],
      team0Result: _isGw1WonMatch5
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffFinalTeamsId[0]]
              : teamsG1Points.length < 37
                  ? 0
                  : teamsG1Points[36].gwPoints[_playOffFinalTeamsId[0]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffFinalTeamsId[0]]
              : teamsG2Points.length < 37
                  ? 0
                  : teamsG2Points[36].gwPoints[_playOffFinalTeamsId[0]],
      team1Result: _isGw1WonMatch6
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffFinalTeamsId[1]]
              : teamsG1Points.length < 37
                  ? 0
                  : teamsG1Points[36].gwPoints[_playOffFinalTeamsId[1]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffFinalTeamsId[1]]
              : teamsG2Points.length < 37
                  ? 0
                  : teamsG2Points[36].gwPoints[_playOffFinalTeamsId[1]],
    ));
    notifyListeners();

    _gw38G1PlayOffFinal2.add(MatchGWModel(
      gwFixture: [
        _isGw1WonMatch5
            ? groupOneTeams[_playOffFinalTeamsId[0]].teamName
            : groupTwoTeams[_playOffFinalTeamsId[0]].teamName,
        _isGw1WonMatch6
            ? groupOneTeams[_playOffFinalTeamsId[1]].teamName
            : groupTwoTeams[_playOffFinalTeamsId[1]].teamName,
      ],
      team0Result: _isGw1WonMatch5
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffFinalTeamsId[0]]
              : teamsG1Points.length < 38
                  ? 0
                  : teamsG1Points[37].gwPoints[_playOffFinalTeamsId[0]] +
                      teamsG1Points[36].gwPoints[_playOffFinalTeamsId[0]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffFinalTeamsId[0]]
              : teamsG2Points.length < 38
                  ? 0
                  : teamsG2Points[37].gwPoints[_playOffFinalTeamsId[0]] +
                      teamsG2Points[36].gwPoints[_playOffFinalTeamsId[0]],
      team1Result: _isGw1WonMatch6
          ? isGwCurrent
              ? totalCurrentGWPointsG1[_playOffFinalTeamsId[1]]
              : teamsG1Points.length < 38
                  ? 0
                  : teamsG1Points[37].gwPoints[_playOffFinalTeamsId[1]] +
                      teamsG1Points[36].gwPoints[_playOffFinalTeamsId[1]]
          : isGwCurrent
              ? totalCurrentGWPointsG2[_playOffFinalTeamsId[1]]
              : teamsG2Points.length < 38
                  ? 0
                  : teamsG2Points[37].gwPoints[_playOffFinalTeamsId[1]] +
                      teamsG2Points[36].gwPoints[_playOffFinalTeamsId[1]],
    ));
    notifyListeners();
  }
}
