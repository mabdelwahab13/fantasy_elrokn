import 'dart:convert';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin TableG1Controller on Model {
  List<TeamTableModel> _groupOneTeamsForTable = [];

  Future<void> getTeamsGroupOneTeamsForTable() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _groupOneTeamsForTable.add(TeamTableModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> makingTableG1({
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
    await getTeamsGroupOneTeamsForTable();
    if (gw[0].team0Result != 0 && gw[0].team1Result != 0) {
      _groupOneTeamsForTable[team1Index].matchesPlayed++;
      _groupOneTeamsForTable[team2Index].matchesPlayed++;
      _groupOneTeamsForTable[team1Index].pointsScored += gw[0].team0Result;
      _groupOneTeamsForTable[team2Index].pointsScored += gw[0].team1Result;
      _groupOneTeamsForTable[team1Index].pointsAgainst += gw[0].team1Result;
      _groupOneTeamsForTable[team2Index].pointsAgainst += gw[0].team0Result;
      if (gw[0].team0Result > gw[0].team1Result) {
        _groupOneTeamsForTable[team1Index].wins++;
        _groupOneTeamsForTable[team2Index].lose++;
        _groupOneTeamsForTable[team1Index].points += 3;
      } else if (gw[0].team0Result < gw[0].team1Result) {
        _groupOneTeamsForTable[team2Index].wins++;
        _groupOneTeamsForTable[team1Index].lose++;
        _groupOneTeamsForTable[team2Index].points += 3;
      } else {
        _groupOneTeamsForTable[team1Index].draw++;
        _groupOneTeamsForTable[team2Index].draw++;
        _groupOneTeamsForTable[team1Index].points += 1;
        _groupOneTeamsForTable[team2Index].points += 1;
      }
    }
    http.Response response1 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team1Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team1Index].draw,
        'lose': _groupOneTeamsForTable[team1Index].lose,
        'wins': _groupOneTeamsForTable[team1Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team1Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team1Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team1Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team1Index].pointsDiff +=
            (_groupOneTeamsForTable[team1Index].pointsScored -
                _groupOneTeamsForTable[team1Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team1Index].teamId,
        'teamName': _groupOneTeamsForTable[team1Index].teamName,
        'points': _groupOneTeamsForTable[team1Index].points,
      }),
    );

    http.Response response2 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team2Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team2Index].draw,
        'lose': _groupOneTeamsForTable[team2Index].lose,
        'wins': _groupOneTeamsForTable[team2Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team2Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team2Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team2Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team2Index].pointsDiff +=
            (_groupOneTeamsForTable[team2Index].pointsScored -
                _groupOneTeamsForTable[team2Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team2Index].teamId,
        'teamName': _groupOneTeamsForTable[team2Index].teamName,
        'points': _groupOneTeamsForTable[team2Index].points,
      }),
    );

    if (gw[1].team0Result != 0 && gw[1].team1Result != 0) {
      _groupOneTeamsForTable[team3Index].matchesPlayed++;
      _groupOneTeamsForTable[team4Index].matchesPlayed++;
      _groupOneTeamsForTable[team3Index].pointsScored += gw[1].team0Result;
      _groupOneTeamsForTable[team4Index].pointsScored += gw[1].team1Result;
      _groupOneTeamsForTable[team3Index].pointsAgainst += gw[1].team1Result;
      _groupOneTeamsForTable[team4Index].pointsAgainst += gw[1].team0Result;
      if (gw[1].team0Result > gw[1].team1Result) {
        _groupOneTeamsForTable[team3Index].wins++;
        _groupOneTeamsForTable[team4Index].lose++;
        _groupOneTeamsForTable[team3Index].points += 3;
      } else if (gw[1].team0Result < gw[1].team1Result) {
        _groupOneTeamsForTable[team4Index].wins++;
        _groupOneTeamsForTable[team3Index].lose++;
        _groupOneTeamsForTable[team4Index].points += 3;
      } else {
        _groupOneTeamsForTable[team3Index].draw++;
        _groupOneTeamsForTable[team4Index].draw++;
        _groupOneTeamsForTable[team3Index].points += 1;
        _groupOneTeamsForTable[team4Index].points += 1;
      }
    }
    http.Response response3 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team3Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team3Index].draw,
        'lose': _groupOneTeamsForTable[team3Index].lose,
        'wins': _groupOneTeamsForTable[team3Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team3Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team3Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team3Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team3Index].pointsDiff +=
            (_groupOneTeamsForTable[team3Index].pointsScored -
                _groupOneTeamsForTable[team3Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team3Index].teamId,
        'teamName': _groupOneTeamsForTable[team3Index].teamName,
        'points': _groupOneTeamsForTable[team3Index].points,
      }),
    );

    http.Response response4 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team4Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team4Index].draw,
        'lose': _groupOneTeamsForTable[team4Index].lose,
        'wins': _groupOneTeamsForTable[team4Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team4Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team4Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team4Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team4Index].pointsDiff +=
            (_groupOneTeamsForTable[team4Index].pointsScored -
                _groupOneTeamsForTable[team4Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team4Index].teamId,
        'teamName': _groupOneTeamsForTable[team4Index].teamName,
        'points': _groupOneTeamsForTable[team4Index].points,
      }),
    );
    if (gw[2].team0Result != 0 && gw[2].team1Result != 0) {
      _groupOneTeamsForTable[team5Index].matchesPlayed++;
      _groupOneTeamsForTable[team6Index].matchesPlayed++;
      _groupOneTeamsForTable[team5Index].pointsScored += gw[2].team0Result;
      _groupOneTeamsForTable[team6Index].pointsScored += gw[2].team1Result;
      _groupOneTeamsForTable[team5Index].pointsAgainst += gw[2].team1Result;
      _groupOneTeamsForTable[team6Index].pointsAgainst += gw[2].team0Result;
      if (gw[2].team0Result > gw[2].team1Result) {
        _groupOneTeamsForTable[team5Index].wins++;
        _groupOneTeamsForTable[team6Index].lose++;
        _groupOneTeamsForTable[team5Index].points += 3;
      } else if (gw[2].team0Result < gw[2].team1Result) {
        _groupOneTeamsForTable[team6Index].wins++;
        _groupOneTeamsForTable[team5Index].lose++;
        _groupOneTeamsForTable[team6Index].points += 3;
      } else {
        _groupOneTeamsForTable[team5Index].draw++;
        _groupOneTeamsForTable[team6Index].draw++;
        _groupOneTeamsForTable[team5Index].points += 1;
        _groupOneTeamsForTable[team6Index].points += 1;
      }
    }
    http.Response response5 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team5Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team5Index].draw,
        'lose': _groupOneTeamsForTable[team5Index].lose,
        'wins': _groupOneTeamsForTable[team5Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team5Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team5Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team5Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team5Index].pointsDiff +=
            (_groupOneTeamsForTable[team5Index].pointsScored -
                _groupOneTeamsForTable[team5Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team5Index].teamId,
        'teamName': _groupOneTeamsForTable[team5Index].teamName,
        'points': _groupOneTeamsForTable[team5Index].points,
      }),
    );

    http.Response response6 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team6Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team6Index].draw,
        'lose': _groupOneTeamsForTable[team6Index].lose,
        'wins': _groupOneTeamsForTable[team6Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team6Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team6Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team6Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team6Index].pointsDiff +=
            (_groupOneTeamsForTable[team6Index].pointsScored -
                _groupOneTeamsForTable[team6Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team6Index].teamId,
        'teamName': _groupOneTeamsForTable[team6Index].teamName,
        'points': _groupOneTeamsForTable[team6Index].points,
      }),
    );
    if (gw[3].team0Result != 0 && gw[3].team1Result != 0) {
      _groupOneTeamsForTable[team7Index].matchesPlayed++;
      _groupOneTeamsForTable[team8Index].matchesPlayed++;
      _groupOneTeamsForTable[team7Index].pointsScored += gw[3].team0Result;
      _groupOneTeamsForTable[team8Index].pointsScored += gw[3].team1Result;
      _groupOneTeamsForTable[team7Index].pointsAgainst += gw[3].team1Result;
      _groupOneTeamsForTable[team8Index].pointsAgainst += gw[3].team0Result;
      if (gw[3].team0Result > gw[3].team1Result) {
        _groupOneTeamsForTable[team7Index].wins++;
        _groupOneTeamsForTable[team8Index].lose++;
        _groupOneTeamsForTable[team7Index].points += 3;
      } else if (gw[3].team0Result < gw[3].team1Result) {
        _groupOneTeamsForTable[team8Index].wins++;
        _groupOneTeamsForTable[team7Index].lose++;
        _groupOneTeamsForTable[team8Index].points += 3;
      } else {
        _groupOneTeamsForTable[team7Index].draw++;
        _groupOneTeamsForTable[team8Index].draw++;
        _groupOneTeamsForTable[team7Index].points += 1;
        _groupOneTeamsForTable[team8Index].points += 1;
      }
    }
    http.Response response7 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team7Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team7Index].draw,
        'lose': _groupOneTeamsForTable[team7Index].lose,
        'wins': _groupOneTeamsForTable[team7Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team7Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team7Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team7Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team7Index].pointsDiff +=
            (_groupOneTeamsForTable[team7Index].pointsScored -
                _groupOneTeamsForTable[team7Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team7Index].teamId,
        'teamName': _groupOneTeamsForTable[team7Index].teamName,
        'points': _groupOneTeamsForTable[team7Index].points,
      }),
    );

    http.Response response8 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team8Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team8Index].draw,
        'lose': _groupOneTeamsForTable[team8Index].lose,
        'wins': _groupOneTeamsForTable[team8Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team8Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team8Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team8Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team8Index].pointsDiff +=
            (_groupOneTeamsForTable[team8Index].pointsScored -
                _groupOneTeamsForTable[team8Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team8Index].teamId,
        'teamName': _groupOneTeamsForTable[team8Index].teamName,
        'points': _groupOneTeamsForTable[team8Index].points,
      }),
    );
    if (gw[4].team0Result != 0 && gw[4].team1Result != 0) {
      _groupOneTeamsForTable[team9Index].matchesPlayed++;
      _groupOneTeamsForTable[team10Index].matchesPlayed++;
      _groupOneTeamsForTable[team9Index].pointsScored += gw[4].team0Result;
      _groupOneTeamsForTable[team10Index].pointsScored += gw[4].team1Result;
      _groupOneTeamsForTable[team9Index].pointsAgainst += gw[4].team1Result;
      _groupOneTeamsForTable[team10Index].pointsAgainst += gw[4].team0Result;
      if (gw[4].team0Result > gw[4].team1Result) {
        _groupOneTeamsForTable[team9Index].wins++;
        _groupOneTeamsForTable[team10Index].lose++;
        _groupOneTeamsForTable[team9Index].points += 3;
      } else if (gw[4].team0Result < gw[4].team1Result) {
        _groupOneTeamsForTable[team10Index].wins++;
        _groupOneTeamsForTable[team9Index].lose++;
        _groupOneTeamsForTable[team10Index].points += 3;
      } else {
        _groupOneTeamsForTable[team9Index].draw++;
        _groupOneTeamsForTable[team10Index].draw++;
        _groupOneTeamsForTable[team9Index].points += 1;
        _groupOneTeamsForTable[team10Index].points += 1;
      }
    }
    http.Response response9 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team9Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team9Index].draw,
        'lose': _groupOneTeamsForTable[team9Index].lose,
        'wins': _groupOneTeamsForTable[team9Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team9Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team9Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team9Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team9Index].pointsDiff +=
            (_groupOneTeamsForTable[team9Index].pointsScored -
                _groupOneTeamsForTable[team9Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team9Index].teamId,
        'teamName': _groupOneTeamsForTable[team9Index].teamName,
        'points': _groupOneTeamsForTable[team9Index].points,
      }),
    );

    http.Response response10 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team10Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team10Index].draw,
        'lose': _groupOneTeamsForTable[team10Index].lose,
        'wins': _groupOneTeamsForTable[team10Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team10Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team10Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team10Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team10Index].pointsDiff +=
            (_groupOneTeamsForTable[team10Index].pointsScored -
                _groupOneTeamsForTable[team10Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team10Index].teamId,
        'teamName': _groupOneTeamsForTable[team10Index].teamName,
        'points': _groupOneTeamsForTable[team10Index].points,
      }),
    );
    if (gw[5].team0Result != 0 && gw[5].team1Result != 0) {
      _groupOneTeamsForTable[team11Index].matchesPlayed++;
      _groupOneTeamsForTable[team12Index].matchesPlayed++;
      _groupOneTeamsForTable[team11Index].pointsScored += gw[5].team0Result;
      _groupOneTeamsForTable[team12Index].pointsScored += gw[5].team1Result;
      _groupOneTeamsForTable[team11Index].pointsAgainst += gw[5].team1Result;
      _groupOneTeamsForTable[team12Index].pointsAgainst += gw[5].team0Result;
      if (gw[5].team0Result > gw[5].team1Result) {
        _groupOneTeamsForTable[team11Index].wins++;
        _groupOneTeamsForTable[team12Index].lose++;
        _groupOneTeamsForTable[team11Index].points += 3;
      } else if (gw[5].team0Result < gw[5].team1Result) {
        _groupOneTeamsForTable[team12Index].wins++;
        _groupOneTeamsForTable[team11Index].lose++;
        _groupOneTeamsForTable[team12Index].points += 3;
      } else {
        _groupOneTeamsForTable[team11Index].draw++;
        _groupOneTeamsForTable[team12Index].draw++;
        _groupOneTeamsForTable[team11Index].points += 1;
        _groupOneTeamsForTable[team12Index].points += 1;
      }
    }
    http.Response response11 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team11Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team11Index].draw,
        'lose': _groupOneTeamsForTable[team11Index].lose,
        'wins': _groupOneTeamsForTable[team11Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team11Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team11Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team11Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team11Index].pointsDiff +=
            (_groupOneTeamsForTable[team11Index].pointsScored -
                _groupOneTeamsForTable[team11Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team11Index].teamId,
        'teamName': _groupOneTeamsForTable[team11Index].teamName,
        'points': _groupOneTeamsForTable[team11Index].points,
      }),
    );

    http.Response response12 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team12Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team12Index].draw,
        'lose': _groupOneTeamsForTable[team12Index].lose,
        'wins': _groupOneTeamsForTable[team12Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team12Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team12Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team12Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team12Index].pointsDiff +=
            (_groupOneTeamsForTable[team12Index].pointsScored -
                _groupOneTeamsForTable[team12Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team12Index].teamId,
        'teamName': _groupOneTeamsForTable[team12Index].teamName,
        'points': _groupOneTeamsForTable[team12Index].points,
      }),
    );
    if (gw[6].team0Result != 0 && gw[6].team1Result != 0) {
      _groupOneTeamsForTable[team13Index].matchesPlayed++;
      _groupOneTeamsForTable[team14Index].matchesPlayed++;
      _groupOneTeamsForTable[team13Index].pointsScored += gw[6].team0Result;
      _groupOneTeamsForTable[team14Index].pointsScored += gw[6].team1Result;
      _groupOneTeamsForTable[team13Index].pointsAgainst += gw[6].team1Result;
      _groupOneTeamsForTable[team14Index].pointsAgainst += gw[6].team0Result;
      if (gw[6].team0Result > gw[6].team1Result) {
        _groupOneTeamsForTable[team13Index].wins++;
        _groupOneTeamsForTable[team14Index].lose++;
        _groupOneTeamsForTable[team13Index].points += 3;
      } else if (gw[6].team0Result < gw[6].team1Result) {
        _groupOneTeamsForTable[team14Index].wins++;
        _groupOneTeamsForTable[team13Index].lose++;
        _groupOneTeamsForTable[team14Index].points += 3;
      } else {
        _groupOneTeamsForTable[team13Index].draw++;
        _groupOneTeamsForTable[team14Index].draw++;
        _groupOneTeamsForTable[team13Index].points += 1;
        _groupOneTeamsForTable[team14Index].points += 1;
      }
    }
    http.Response response13 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team13Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team13Index].draw,
        'lose': _groupOneTeamsForTable[team13Index].lose,
        'wins': _groupOneTeamsForTable[team13Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team13Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team13Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team13Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team13Index].pointsDiff +=
            (_groupOneTeamsForTable[team13Index].pointsScored -
                _groupOneTeamsForTable[team13Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team13Index].teamId,
        'teamName': _groupOneTeamsForTable[team13Index].teamName,
        'points': _groupOneTeamsForTable[team13Index].points,
      }),
    );

    http.Response response14 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team14Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team14Index].draw,
        'lose': _groupOneTeamsForTable[team14Index].lose,
        'wins': _groupOneTeamsForTable[team14Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team14Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team14Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team14Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team14Index].pointsDiff +=
            (_groupOneTeamsForTable[team14Index].pointsScored -
                _groupOneTeamsForTable[team14Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team14Index].teamId,
        'teamName': _groupOneTeamsForTable[team14Index].teamName,
        'points': _groupOneTeamsForTable[team14Index].points,
      }),
    );
    if (gw[7].team0Result != 0 && gw[7].team1Result != 0) {
      _groupOneTeamsForTable[team15Index].matchesPlayed++;
      _groupOneTeamsForTable[team16Index].matchesPlayed++;
      _groupOneTeamsForTable[team15Index].pointsScored += gw[7].team0Result;
      _groupOneTeamsForTable[team16Index].pointsScored += gw[7].team1Result;
      _groupOneTeamsForTable[team15Index].pointsAgainst += gw[7].team1Result;
      _groupOneTeamsForTable[team16Index].pointsAgainst += gw[7].team0Result;
      if (gw[7].team0Result > gw[7].team1Result) {
        _groupOneTeamsForTable[team15Index].wins++;
        _groupOneTeamsForTable[team16Index].lose++;
        _groupOneTeamsForTable[team15Index].points += 3;
      } else if (gw[7].team0Result < gw[7].team1Result) {
        _groupOneTeamsForTable[team16Index].wins++;
        _groupOneTeamsForTable[team15Index].lose++;
        _groupOneTeamsForTable[team16Index].points += 3;
      } else {
        _groupOneTeamsForTable[team15Index].draw++;
        _groupOneTeamsForTable[team16Index].draw++;
        _groupOneTeamsForTable[team15Index].points += 1;
        _groupOneTeamsForTable[team16Index].points += 1;
      }
    }
    http.Response response15 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team15Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team15Index].draw,
        'lose': _groupOneTeamsForTable[team15Index].lose,
        'wins': _groupOneTeamsForTable[team15Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team15Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team15Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team15Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team15Index].pointsDiff +=
            (_groupOneTeamsForTable[team15Index].pointsScored -
                _groupOneTeamsForTable[team15Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team15Index].teamId,
        'teamName': _groupOneTeamsForTable[team15Index].teamName,
        'points': _groupOneTeamsForTable[team15Index].points,
      }),
    );

    http.Response response16 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team16Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team16Index].draw,
        'lose': _groupOneTeamsForTable[team16Index].lose,
        'wins': _groupOneTeamsForTable[team16Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team16Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team16Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team16Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team16Index].pointsDiff +=
            (_groupOneTeamsForTable[team16Index].pointsScored -
                _groupOneTeamsForTable[team16Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team16Index].teamId,
        'teamName': _groupOneTeamsForTable[team16Index].teamName,
        'points': _groupOneTeamsForTable[team16Index].points,
      }),
    );
    if (gw[8].team0Result != 0 && gw[8].team1Result != 0) {
      _groupOneTeamsForTable[team17Index].matchesPlayed++;
      _groupOneTeamsForTable[team18Index].matchesPlayed++;
      _groupOneTeamsForTable[team17Index].pointsScored += gw[8].team0Result;
      _groupOneTeamsForTable[team18Index].pointsScored += gw[8].team1Result;
      _groupOneTeamsForTable[team17Index].pointsAgainst += gw[8].team1Result;
      _groupOneTeamsForTable[team18Index].pointsAgainst += gw[8].team0Result;
      if (gw[8].team0Result > gw[8].team1Result) {
        _groupOneTeamsForTable[team17Index].wins++;
        _groupOneTeamsForTable[team18Index].lose++;
        _groupOneTeamsForTable[team17Index].points += 3;
      } else if (gw[8].team0Result < gw[8].team1Result) {
        _groupOneTeamsForTable[team18Index].wins++;
        _groupOneTeamsForTable[team17Index].lose++;
        _groupOneTeamsForTable[team18Index].points += 3;
      } else {
        _groupOneTeamsForTable[team17Index].draw++;
        _groupOneTeamsForTable[team18Index].draw++;
        _groupOneTeamsForTable[team17Index].points += 1;
        _groupOneTeamsForTable[team18Index].points += 1;
      }
    }
    http.Response response17 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team17Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team17Index].draw,
        'lose': _groupOneTeamsForTable[team17Index].lose,
        'wins': _groupOneTeamsForTable[team17Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team17Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team17Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team17Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team17Index].pointsDiff +=
            (_groupOneTeamsForTable[team17Index].pointsScored -
                _groupOneTeamsForTable[team17Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team17Index].teamId,
        'teamName': _groupOneTeamsForTable[team17Index].teamName,
        'points': _groupOneTeamsForTable[team17Index].points,
      }),
    );

    http.Response response18 = await http.put(
      Uri.parse(
          '${fireBase}teamsGroupOne/${_groupOneTeamsForTable[team18Index].id}.json'),
      body: json.encode({
        'draw': _groupOneTeamsForTable[team18Index].draw,
        'lose': _groupOneTeamsForTable[team18Index].lose,
        'wins': _groupOneTeamsForTable[team18Index].wins,
        'matchesPlayed': _groupOneTeamsForTable[team18Index].matchesPlayed,
        'pointsScored': _groupOneTeamsForTable[team18Index].pointsScored,
        'pointsAgainst': _groupOneTeamsForTable[team18Index].pointsAgainst,
        'pointsDiff': _groupOneTeamsForTable[team18Index].pointsDiff +=
            (_groupOneTeamsForTable[team18Index].pointsScored -
                _groupOneTeamsForTable[team18Index].pointsAgainst),
        'taemId': _groupOneTeamsForTable[team18Index].teamId,
        'teamName': _groupOneTeamsForTable[team18Index].teamName,
        'points': _groupOneTeamsForTable[team18Index].points,
      }),
    );
  }
}
