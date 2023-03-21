import 'dart:convert';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin TableG2Controller on Model {
  List<TeamTableModel> _groupTwoTeamsForTable = [];

  Future<void> getTeamsGroupTwoTeamsForTable() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _groupTwoTeamsForTable.add(TeamTableModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> makingTableG2({
    required List<MatchGWModel> gw,
    required int team1Index,
    required int team2Index,
    required int team3Index,
    required int team4Index,
    required int team5Index,
    required int team6Index,
    required int team7Index,
    required int team8Index,
    required int team9Index,
    required int team10Index,
    required int team11Index,
    required int team12Index,
    required int team13Index,
    required int team14Index,
    required int team15Index,
    required int team16Index,
    required int team17Index,
    required int team18Index,
  }) async {
    await getTeamsGroupTwoTeamsForTable();
    if (gw[0].team0Result != 0 && gw[0].team1Result != 0) {
      _groupTwoTeamsForTable[team1Index].matchesPlayed++;
      _groupTwoTeamsForTable[team2Index].matchesPlayed++;
      _groupTwoTeamsForTable[team1Index].pointsScored += gw[0].team0Result;
      _groupTwoTeamsForTable[team2Index].pointsScored += gw[0].team1Result;
      _groupTwoTeamsForTable[team1Index].pointsAgainst += gw[0].team1Result;
      _groupTwoTeamsForTable[team2Index].pointsAgainst += gw[0].team0Result;
      if (gw[0].team0Result > gw[0].team1Result) {
        _groupTwoTeamsForTable[team1Index].wins++;
        _groupTwoTeamsForTable[team2Index].lose++;
        _groupTwoTeamsForTable[team1Index].points += 3;
      } else if (gw[0].team0Result < gw[0].team1Result) {
        _groupTwoTeamsForTable[team2Index].wins++;
        _groupTwoTeamsForTable[team1Index].lose++;
        _groupTwoTeamsForTable[team2Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team1Index].draw++;
        _groupTwoTeamsForTable[team2Index].draw++;
        _groupTwoTeamsForTable[team1Index].points += 1;
        _groupTwoTeamsForTable[team2Index].points += 1;
      }
    }
    http.Response response1 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team1Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team1Index].draw,
        'lose': _groupTwoTeamsForTable[team1Index].lose,
        'wins': _groupTwoTeamsForTable[team1Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team1Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team1Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team1Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team1Index].pointsScored -
            _groupTwoTeamsForTable[team1Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team1Index].teamId,
        'teamName': _groupTwoTeamsForTable[team1Index].teamName,
        'points': _groupTwoTeamsForTable[team1Index].points,
      }),
    );

    http.Response response2 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team2Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team2Index].draw,
        'lose': _groupTwoTeamsForTable[team2Index].lose,
        'wins': _groupTwoTeamsForTable[team2Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team2Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team2Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team2Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team2Index].pointsScored -
            _groupTwoTeamsForTable[team2Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team2Index].teamId,
        'teamName': _groupTwoTeamsForTable[team2Index].teamName,
        'points': _groupTwoTeamsForTable[team2Index].points,
      }),
    );

    if (gw[1].team0Result != 0 && gw[1].team1Result != 0) {
      _groupTwoTeamsForTable[team3Index].matchesPlayed++;
      _groupTwoTeamsForTable[team4Index].matchesPlayed++;
      _groupTwoTeamsForTable[team3Index].pointsScored += gw[1].team0Result;
      _groupTwoTeamsForTable[team4Index].pointsScored += gw[1].team1Result;
      _groupTwoTeamsForTable[team3Index].pointsAgainst += gw[1].team1Result;
      _groupTwoTeamsForTable[team4Index].pointsAgainst += gw[1].team0Result;
      if (gw[1].team0Result > gw[1].team1Result) {
        _groupTwoTeamsForTable[team3Index].wins++;
        _groupTwoTeamsForTable[team4Index].lose++;
        _groupTwoTeamsForTable[team3Index].points += 3;
      } else if (gw[1].team0Result < gw[1].team1Result) {
        _groupTwoTeamsForTable[team4Index].wins++;
        _groupTwoTeamsForTable[team3Index].lose++;
        _groupTwoTeamsForTable[team4Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team3Index].draw++;
        _groupTwoTeamsForTable[team4Index].draw++;
        _groupTwoTeamsForTable[team3Index].points += 1;
        _groupTwoTeamsForTable[team4Index].points += 1;
      }
    }
    http.Response response3 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team3Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team3Index].draw,
        'lose': _groupTwoTeamsForTable[team3Index].lose,
        'wins': _groupTwoTeamsForTable[team3Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team3Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team3Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team3Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team3Index].pointsScored -
            _groupTwoTeamsForTable[team3Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team3Index].teamId,
        'teamName': _groupTwoTeamsForTable[team3Index].teamName,
        'points': _groupTwoTeamsForTable[team3Index].points,
      }),
    );

    http.Response response4 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team4Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team4Index].draw,
        'lose': _groupTwoTeamsForTable[team4Index].lose,
        'wins': _groupTwoTeamsForTable[team4Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team4Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team4Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team4Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team4Index].pointsScored -
            _groupTwoTeamsForTable[team4Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team4Index].teamId,
        'teamName': _groupTwoTeamsForTable[team4Index].teamName,
        'points': _groupTwoTeamsForTable[team4Index].points,
      }),
    );
    if (gw[2].team0Result != 0 && gw[2].team1Result != 0) {
      _groupTwoTeamsForTable[team5Index].matchesPlayed++;
      _groupTwoTeamsForTable[team6Index].matchesPlayed++;
      _groupTwoTeamsForTable[team5Index].pointsScored += gw[2].team0Result;
      _groupTwoTeamsForTable[team6Index].pointsScored += gw[2].team1Result;
      _groupTwoTeamsForTable[team5Index].pointsAgainst += gw[2].team1Result;
      _groupTwoTeamsForTable[team6Index].pointsAgainst += gw[2].team0Result;
      if (gw[2].team0Result > gw[2].team1Result) {
        _groupTwoTeamsForTable[team5Index].wins++;
        _groupTwoTeamsForTable[team6Index].lose++;
        _groupTwoTeamsForTable[team5Index].points += 3;
      } else if (gw[2].team0Result < gw[2].team1Result) {
        _groupTwoTeamsForTable[team6Index].wins++;
        _groupTwoTeamsForTable[team5Index].lose++;
        _groupTwoTeamsForTable[team6Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team5Index].draw++;
        _groupTwoTeamsForTable[team6Index].draw++;
        _groupTwoTeamsForTable[team5Index].points += 1;
        _groupTwoTeamsForTable[team6Index].points += 1;
      }
    }
    http.Response response5 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team5Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team5Index].draw,
        'lose': _groupTwoTeamsForTable[team5Index].lose,
        'wins': _groupTwoTeamsForTable[team5Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team5Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team5Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team5Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team5Index].pointsScored -
            _groupTwoTeamsForTable[team5Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team5Index].teamId,
        'teamName': _groupTwoTeamsForTable[team5Index].teamName,
        'points': _groupTwoTeamsForTable[team5Index].points,
      }),
    );

    http.Response response6 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team6Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team6Index].draw,
        'lose': _groupTwoTeamsForTable[team6Index].lose,
        'wins': _groupTwoTeamsForTable[team6Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team6Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team6Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team6Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team6Index].pointsScored -
            _groupTwoTeamsForTable[team6Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team6Index].teamId,
        'teamName': _groupTwoTeamsForTable[team6Index].teamName,
        'points': _groupTwoTeamsForTable[team6Index].points,
      }),
    );
    if (gw[3].team0Result != 0 && gw[3].team1Result != 0) {
      _groupTwoTeamsForTable[team7Index].matchesPlayed++;
      _groupTwoTeamsForTable[team8Index].matchesPlayed++;
      _groupTwoTeamsForTable[team7Index].pointsScored += gw[3].team0Result;
      _groupTwoTeamsForTable[team8Index].pointsScored += gw[3].team1Result;
      _groupTwoTeamsForTable[team7Index].pointsAgainst += gw[3].team1Result;
      _groupTwoTeamsForTable[team8Index].pointsAgainst += gw[3].team0Result;
      if (gw[3].team0Result > gw[3].team1Result) {
        _groupTwoTeamsForTable[team7Index].wins++;
        _groupTwoTeamsForTable[team8Index].lose++;
        _groupTwoTeamsForTable[team7Index].points += 3;
      } else if (gw[3].team0Result < gw[3].team1Result) {
        _groupTwoTeamsForTable[team8Index].wins++;
        _groupTwoTeamsForTable[team7Index].lose++;
        _groupTwoTeamsForTable[team8Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team7Index].draw++;
        _groupTwoTeamsForTable[team8Index].draw++;
        _groupTwoTeamsForTable[team7Index].points += 1;
        _groupTwoTeamsForTable[team8Index].points += 1;
      }
    }
    http.Response response7 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team7Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team7Index].draw,
        'lose': _groupTwoTeamsForTable[team7Index].lose,
        'wins': _groupTwoTeamsForTable[team7Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team7Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team7Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team7Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team7Index].pointsScored -
            _groupTwoTeamsForTable[team7Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team7Index].teamId,
        'teamName': _groupTwoTeamsForTable[team7Index].teamName,
        'points': _groupTwoTeamsForTable[team7Index].points,
      }),
    );

    http.Response response8 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team8Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team8Index].draw,
        'lose': _groupTwoTeamsForTable[team8Index].lose,
        'wins': _groupTwoTeamsForTable[team8Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team8Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team8Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team8Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team8Index].pointsScored -
            _groupTwoTeamsForTable[team8Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team8Index].teamId,
        'teamName': _groupTwoTeamsForTable[team8Index].teamName,
        'points': _groupTwoTeamsForTable[team8Index].points,
      }),
    );
    if (gw[4].team0Result != 0 && gw[4].team1Result != 0) {
      _groupTwoTeamsForTable[team9Index].matchesPlayed++;
      _groupTwoTeamsForTable[team10Index].matchesPlayed++;
      _groupTwoTeamsForTable[team9Index].pointsScored += gw[4].team0Result;
      _groupTwoTeamsForTable[team10Index].pointsScored += gw[4].team1Result;
      _groupTwoTeamsForTable[team9Index].pointsAgainst += gw[4].team1Result;
      _groupTwoTeamsForTable[team10Index].pointsAgainst += gw[4].team0Result;
      if (gw[4].team0Result > gw[4].team1Result) {
        _groupTwoTeamsForTable[team9Index].wins++;
        _groupTwoTeamsForTable[team10Index].lose++;
        _groupTwoTeamsForTable[team9Index].points += 3;
      } else if (gw[4].team0Result < gw[4].team1Result) {
        _groupTwoTeamsForTable[team10Index].wins++;
        _groupTwoTeamsForTable[team9Index].lose++;
        _groupTwoTeamsForTable[team10Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team9Index].draw++;
        _groupTwoTeamsForTable[team10Index].draw++;
        _groupTwoTeamsForTable[team9Index].points += 1;
        _groupTwoTeamsForTable[team10Index].points += 1;
      }
    }
    http.Response response9 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team9Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team9Index].draw,
        'lose': _groupTwoTeamsForTable[team9Index].lose,
        'wins': _groupTwoTeamsForTable[team9Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team9Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team9Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team9Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team9Index].pointsScored -
            _groupTwoTeamsForTable[team9Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team9Index].teamId,
        'teamName': _groupTwoTeamsForTable[team9Index].teamName,
        'points': _groupTwoTeamsForTable[team9Index].points,
      }),
    );

    http.Response response10 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team10Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team10Index].draw,
        'lose': _groupTwoTeamsForTable[team10Index].lose,
        'wins': _groupTwoTeamsForTable[team10Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team10Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team10Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team10Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team10Index].pointsScored -
            _groupTwoTeamsForTable[team10Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team10Index].teamId,
        'teamName': _groupTwoTeamsForTable[team10Index].teamName,
        'points': _groupTwoTeamsForTable[team10Index].points,
      }),
    );
    if (gw[5].team0Result != 0 && gw[5].team1Result != 0) {
      _groupTwoTeamsForTable[team11Index].matchesPlayed++;
      _groupTwoTeamsForTable[team12Index].matchesPlayed++;
      _groupTwoTeamsForTable[team11Index].pointsScored += gw[5].team0Result;
      _groupTwoTeamsForTable[team12Index].pointsScored += gw[5].team1Result;
      _groupTwoTeamsForTable[team11Index].pointsAgainst += gw[5].team1Result;
      _groupTwoTeamsForTable[team12Index].pointsAgainst += gw[5].team0Result;
      if (gw[5].team0Result > gw[5].team1Result) {
        _groupTwoTeamsForTable[team11Index].wins++;
        _groupTwoTeamsForTable[team12Index].lose++;
        _groupTwoTeamsForTable[team11Index].points += 3;
      } else if (gw[5].team0Result < gw[5].team1Result) {
        _groupTwoTeamsForTable[team12Index].wins++;
        _groupTwoTeamsForTable[team11Index].lose++;
        _groupTwoTeamsForTable[team12Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team11Index].draw++;
        _groupTwoTeamsForTable[team12Index].draw++;
        _groupTwoTeamsForTable[team11Index].points += 1;
        _groupTwoTeamsForTable[team12Index].points += 1;
      }
    }
    http.Response response11 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team11Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team11Index].draw,
        'lose': _groupTwoTeamsForTable[team11Index].lose,
        'wins': _groupTwoTeamsForTable[team11Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team11Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team11Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team11Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team11Index].pointsScored -
            _groupTwoTeamsForTable[team11Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team11Index].teamId,
        'teamName': _groupTwoTeamsForTable[team11Index].teamName,
        'points': _groupTwoTeamsForTable[team11Index].points,
      }),
    );

    http.Response response12 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team12Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team12Index].draw,
        'lose': _groupTwoTeamsForTable[team12Index].lose,
        'wins': _groupTwoTeamsForTable[team12Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team12Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team12Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team12Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team12Index].pointsScored -
            _groupTwoTeamsForTable[team12Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team12Index].teamId,
        'teamName': _groupTwoTeamsForTable[team12Index].teamName,
        'points': _groupTwoTeamsForTable[team12Index].points,
      }),
    );
    if (gw[6].team0Result != 0 && gw[6].team1Result != 0) {
      _groupTwoTeamsForTable[team13Index].matchesPlayed++;
      _groupTwoTeamsForTable[team14Index].matchesPlayed++;
      _groupTwoTeamsForTable[team13Index].pointsScored += gw[6].team0Result;
      _groupTwoTeamsForTable[team14Index].pointsScored += gw[6].team1Result;
      _groupTwoTeamsForTable[team13Index].pointsAgainst += gw[6].team1Result;
      _groupTwoTeamsForTable[team14Index].pointsAgainst += gw[6].team0Result;
      if (gw[6].team0Result > gw[6].team1Result) {
        _groupTwoTeamsForTable[team13Index].wins++;
        _groupTwoTeamsForTable[team14Index].lose++;
        _groupTwoTeamsForTable[team13Index].points += 3;
      } else if (gw[6].team0Result < gw[6].team1Result) {
        _groupTwoTeamsForTable[team14Index].wins++;
        _groupTwoTeamsForTable[team13Index].lose++;
        _groupTwoTeamsForTable[team14Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team13Index].draw++;
        _groupTwoTeamsForTable[team14Index].draw++;
        _groupTwoTeamsForTable[team13Index].points += 1;
        _groupTwoTeamsForTable[team14Index].points += 1;
      }
    }
    http.Response response13 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team13Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team13Index].draw,
        'lose': _groupTwoTeamsForTable[team13Index].lose,
        'wins': _groupTwoTeamsForTable[team13Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team13Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team13Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team13Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team13Index].pointsScored -
            _groupTwoTeamsForTable[team13Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team13Index].teamId,
        'teamName': _groupTwoTeamsForTable[team13Index].teamName,
        'points': _groupTwoTeamsForTable[team13Index].points,
      }),
    );

    http.Response response14 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team14Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team14Index].draw,
        'lose': _groupTwoTeamsForTable[team14Index].lose,
        'wins': _groupTwoTeamsForTable[team14Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team14Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team14Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team14Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team14Index].pointsScored -
            _groupTwoTeamsForTable[team14Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team14Index].teamId,
        'teamName': _groupTwoTeamsForTable[team14Index].teamName,
        'points': _groupTwoTeamsForTable[team14Index].points,
      }),
    );
    if (gw[7].team0Result != 0 && gw[7].team1Result != 0) {
      _groupTwoTeamsForTable[team15Index].matchesPlayed++;
      _groupTwoTeamsForTable[team16Index].matchesPlayed++;
      _groupTwoTeamsForTable[team15Index].pointsScored += gw[7].team0Result;
      _groupTwoTeamsForTable[team16Index].pointsScored += gw[7].team1Result;
      _groupTwoTeamsForTable[team15Index].pointsAgainst += gw[7].team1Result;
      _groupTwoTeamsForTable[team16Index].pointsAgainst += gw[7].team0Result;
      if (gw[7].team0Result > gw[7].team1Result) {
        _groupTwoTeamsForTable[team15Index].wins++;
        _groupTwoTeamsForTable[team16Index].lose++;
        _groupTwoTeamsForTable[team15Index].points += 3;
      } else if (gw[7].team0Result < gw[7].team1Result) {
        _groupTwoTeamsForTable[team16Index].wins++;
        _groupTwoTeamsForTable[team15Index].lose++;
        _groupTwoTeamsForTable[team16Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team15Index].draw++;
        _groupTwoTeamsForTable[team16Index].draw++;
        _groupTwoTeamsForTable[team15Index].points += 1;
        _groupTwoTeamsForTable[team16Index].points += 1;
      }
    }
    http.Response response15 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team15Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team15Index].draw,
        'lose': _groupTwoTeamsForTable[team15Index].lose,
        'wins': _groupTwoTeamsForTable[team15Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team15Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team15Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team15Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team15Index].pointsScored -
            _groupTwoTeamsForTable[team15Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team15Index].teamId,
        'teamName': _groupTwoTeamsForTable[team15Index].teamName,
        'points': _groupTwoTeamsForTable[team15Index].points,
      }),
    );

    http.Response response16 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team16Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team16Index].draw,
        'lose': _groupTwoTeamsForTable[team16Index].lose,
        'wins': _groupTwoTeamsForTable[team16Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team16Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team16Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team16Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team16Index].pointsScored -
            _groupTwoTeamsForTable[team16Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team16Index].teamId,
        'teamName': _groupTwoTeamsForTable[team16Index].teamName,
        'points': _groupTwoTeamsForTable[team16Index].points,
      }),
    );
    if (gw[8].team0Result != 0 && gw[8].team1Result != 0) {
      _groupTwoTeamsForTable[team17Index].matchesPlayed++;
      _groupTwoTeamsForTable[team18Index].matchesPlayed++;
      _groupTwoTeamsForTable[team17Index].pointsScored += gw[8].team0Result;
      _groupTwoTeamsForTable[team18Index].pointsScored += gw[8].team1Result;
      _groupTwoTeamsForTable[team17Index].pointsAgainst += gw[8].team1Result;
      _groupTwoTeamsForTable[team18Index].pointsAgainst += gw[8].team0Result;
      if (gw[8].team0Result > gw[8].team1Result) {
        _groupTwoTeamsForTable[team17Index].wins++;
        _groupTwoTeamsForTable[team18Index].lose++;
        _groupTwoTeamsForTable[team17Index].points += 3;
      } else if (gw[8].team0Result < gw[8].team1Result) {
        _groupTwoTeamsForTable[team18Index].wins++;
        _groupTwoTeamsForTable[team17Index].lose++;
        _groupTwoTeamsForTable[team18Index].points += 3;
      } else {
        _groupTwoTeamsForTable[team17Index].draw++;
        _groupTwoTeamsForTable[team18Index].draw++;
        _groupTwoTeamsForTable[team17Index].points += 1;
        _groupTwoTeamsForTable[team18Index].points += 1;
      }
    }
    http.Response response17 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team17Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team17Index].draw,
        'lose': _groupTwoTeamsForTable[team17Index].lose,
        'wins': _groupTwoTeamsForTable[team17Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team17Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team17Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team17Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team17Index].pointsScored -
            _groupTwoTeamsForTable[team17Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team17Index].teamId,
        'teamName': _groupTwoTeamsForTable[team17Index].teamName,
        'points': _groupTwoTeamsForTable[team17Index].points,
      }),
    );

    http.Response response18 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupTwo/${_groupTwoTeamsForTable[team18Index].id}.json'),
      body: json.encode({
        'draw': _groupTwoTeamsForTable[team18Index].draw,
        'lose': _groupTwoTeamsForTable[team18Index].lose,
        'wins': _groupTwoTeamsForTable[team18Index].wins,
        'matchesPlayed': _groupTwoTeamsForTable[team18Index].matchesPlayed,
        'pointsScored': _groupTwoTeamsForTable[team18Index].pointsScored,
        'pointsAgainst': _groupTwoTeamsForTable[team18Index].pointsAgainst,
        'pointsDiff': (_groupTwoTeamsForTable[team18Index].pointsScored -
            _groupTwoTeamsForTable[team18Index].pointsAgainst),
        'teamId': _groupTwoTeamsForTable[team18Index].teamId,
        'teamName': _groupTwoTeamsForTable[team18Index].teamName,
        'points': _groupTwoTeamsForTable[team18Index].points,
      }),
    );
  }
}
