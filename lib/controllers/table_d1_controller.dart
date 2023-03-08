import 'dart:convert';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/match_gw_model.dart';
import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin TableD1Controller on Model {
  List<TeamTableModel> _divOneTeamsForTable = [];

  Future<void> getTeamsDivOneTeamsForTable() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsDivOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _divOneTeamsForTable.add(TeamTableModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> makingTableD1({
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
    required int team19Index,
    required int team20Index,
  }) async {
    await getTeamsDivOneTeamsForTable();
    if (gw[0].team0Result != 0 && gw[0].team1Result != 0) {
      _divOneTeamsForTable[team1Index].matchesPlayed++;
      _divOneTeamsForTable[team2Index].matchesPlayed++;
      _divOneTeamsForTable[team1Index].pointsScored += gw[0].team0Result;
      _divOneTeamsForTable[team2Index].pointsScored += gw[0].team1Result;
      _divOneTeamsForTable[team1Index].pointsAgainst += gw[0].team1Result;
      _divOneTeamsForTable[team2Index].pointsAgainst += gw[0].team0Result;
      if (gw[0].team0Result > gw[0].team1Result) {
        _divOneTeamsForTable[team1Index].wins++;
        _divOneTeamsForTable[team2Index].lose++;
        _divOneTeamsForTable[team1Index].points += 3;
      } else if (gw[0].team0Result < gw[0].team1Result) {
        _divOneTeamsForTable[team2Index].wins++;
        _divOneTeamsForTable[team1Index].lose++;
        _divOneTeamsForTable[team2Index].points += 3;
      } else {
        _divOneTeamsForTable[team1Index].draw++;
        _divOneTeamsForTable[team2Index].draw++;
        _divOneTeamsForTable[team1Index].points += 1;
        _divOneTeamsForTable[team2Index].points += 1;
      }
    }
    http.Response response1 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team1Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team1Index].draw,
        'lose': _divOneTeamsForTable[team1Index].lose,
        'wins': _divOneTeamsForTable[team1Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team1Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team1Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team1Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team1Index].pointsDiff +=
            (_divOneTeamsForTable[team1Index].pointsScored -
                _divOneTeamsForTable[team1Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team1Index].teamId,
        'teamName': _divOneTeamsForTable[team1Index].teamName,
        'points': _divOneTeamsForTable[team1Index].points,
      }),
    );

    http.Response response2 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team2Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team2Index].draw,
        'lose': _divOneTeamsForTable[team2Index].lose,
        'wins': _divOneTeamsForTable[team2Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team2Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team2Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team2Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team2Index].pointsDiff +=
            (_divOneTeamsForTable[team2Index].pointsScored -
                _divOneTeamsForTable[team2Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team2Index].teamId,
        'teamName': _divOneTeamsForTable[team2Index].teamName,
        'points': _divOneTeamsForTable[team2Index].points,
      }),
    );

    if (gw[1].team0Result != 0 && gw[1].team1Result != 0) {
      _divOneTeamsForTable[team3Index].matchesPlayed++;
      _divOneTeamsForTable[team4Index].matchesPlayed++;
      _divOneTeamsForTable[team3Index].pointsScored += gw[1].team0Result;
      _divOneTeamsForTable[team4Index].pointsScored += gw[1].team1Result;
      _divOneTeamsForTable[team3Index].pointsAgainst += gw[1].team1Result;
      _divOneTeamsForTable[team4Index].pointsAgainst += gw[1].team0Result;
      if (gw[1].team0Result > gw[1].team1Result) {
        _divOneTeamsForTable[team3Index].wins++;
        _divOneTeamsForTable[team4Index].lose++;
        _divOneTeamsForTable[team3Index].points += 3;
      } else if (gw[1].team0Result < gw[1].team1Result) {
        _divOneTeamsForTable[team4Index].wins++;
        _divOneTeamsForTable[team3Index].lose++;
        _divOneTeamsForTable[team4Index].points += 3;
      } else {
        _divOneTeamsForTable[team3Index].draw++;
        _divOneTeamsForTable[team4Index].draw++;
        _divOneTeamsForTable[team3Index].points += 1;
        _divOneTeamsForTable[team4Index].points += 1;
      }
    }
    http.Response response3 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team3Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team3Index].draw,
        'lose': _divOneTeamsForTable[team3Index].lose,
        'wins': _divOneTeamsForTable[team3Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team3Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team3Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team3Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team3Index].pointsDiff +=
            (_divOneTeamsForTable[team3Index].pointsScored -
                _divOneTeamsForTable[team3Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team3Index].teamId,
        'teamName': _divOneTeamsForTable[team3Index].teamName,
        'points': _divOneTeamsForTable[team3Index].points,
      }),
    );

    http.Response response4 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team4Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team4Index].draw,
        'lose': _divOneTeamsForTable[team4Index].lose,
        'wins': _divOneTeamsForTable[team4Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team4Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team4Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team4Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team4Index].pointsDiff +=
            (_divOneTeamsForTable[team4Index].pointsScored -
                _divOneTeamsForTable[team4Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team4Index].teamId,
        'teamName': _divOneTeamsForTable[team4Index].teamName,
        'points': _divOneTeamsForTable[team4Index].points,
      }),
    );
    if (gw[2].team0Result != 0 && gw[2].team1Result != 0) {
      _divOneTeamsForTable[team5Index].matchesPlayed++;
      _divOneTeamsForTable[team6Index].matchesPlayed++;
      _divOneTeamsForTable[team5Index].pointsScored += gw[2].team0Result;
      _divOneTeamsForTable[team6Index].pointsScored += gw[2].team1Result;
      _divOneTeamsForTable[team5Index].pointsAgainst += gw[2].team1Result;
      _divOneTeamsForTable[team6Index].pointsAgainst += gw[2].team0Result;
      if (gw[2].team0Result > gw[2].team1Result) {
        _divOneTeamsForTable[team5Index].wins++;
        _divOneTeamsForTable[team6Index].lose++;
        _divOneTeamsForTable[team5Index].points += 3;
      } else if (gw[2].team0Result < gw[2].team1Result) {
        _divOneTeamsForTable[team6Index].wins++;
        _divOneTeamsForTable[team5Index].lose++;
        _divOneTeamsForTable[team6Index].points += 3;
      } else {
        _divOneTeamsForTable[team5Index].draw++;
        _divOneTeamsForTable[team6Index].draw++;
        _divOneTeamsForTable[team5Index].points += 1;
        _divOneTeamsForTable[team6Index].points += 1;
      }
    }
    http.Response response5 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team5Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team5Index].draw,
        'lose': _divOneTeamsForTable[team5Index].lose,
        'wins': _divOneTeamsForTable[team5Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team5Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team5Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team5Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team5Index].pointsDiff +=
            (_divOneTeamsForTable[team5Index].pointsScored -
                _divOneTeamsForTable[team5Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team5Index].teamId,
        'teamName': _divOneTeamsForTable[team5Index].teamName,
        'points': _divOneTeamsForTable[team5Index].points,
      }),
    );

    http.Response response6 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team6Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team6Index].draw,
        'lose': _divOneTeamsForTable[team6Index].lose,
        'wins': _divOneTeamsForTable[team6Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team6Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team6Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team6Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team6Index].pointsDiff +=
            (_divOneTeamsForTable[team6Index].pointsScored -
                _divOneTeamsForTable[team6Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team6Index].teamId,
        'teamName': _divOneTeamsForTable[team6Index].teamName,
        'points': _divOneTeamsForTable[team6Index].points,
      }),
    );
    if (gw[3].team0Result != 0 && gw[3].team1Result != 0) {
      _divOneTeamsForTable[team7Index].matchesPlayed++;
      _divOneTeamsForTable[team8Index].matchesPlayed++;
      _divOneTeamsForTable[team7Index].pointsScored += gw[3].team0Result;
      _divOneTeamsForTable[team8Index].pointsScored += gw[3].team1Result;
      _divOneTeamsForTable[team7Index].pointsAgainst += gw[3].team1Result;
      _divOneTeamsForTable[team8Index].pointsAgainst += gw[3].team0Result;
      if (gw[3].team0Result > gw[3].team1Result) {
        _divOneTeamsForTable[team7Index].wins++;
        _divOneTeamsForTable[team8Index].lose++;
        _divOneTeamsForTable[team7Index].points += 3;
      } else if (gw[3].team0Result < gw[3].team1Result) {
        _divOneTeamsForTable[team8Index].wins++;
        _divOneTeamsForTable[team7Index].lose++;
        _divOneTeamsForTable[team8Index].points += 3;
      } else {
        _divOneTeamsForTable[team7Index].draw++;
        _divOneTeamsForTable[team8Index].draw++;
        _divOneTeamsForTable[team7Index].points += 1;
        _divOneTeamsForTable[team8Index].points += 1;
      }
    }
    http.Response response7 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team7Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team7Index].draw,
        'lose': _divOneTeamsForTable[team7Index].lose,
        'wins': _divOneTeamsForTable[team7Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team7Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team7Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team7Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team7Index].pointsDiff +=
            (_divOneTeamsForTable[team7Index].pointsScored -
                _divOneTeamsForTable[team7Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team7Index].teamId,
        'teamName': _divOneTeamsForTable[team7Index].teamName,
        'points': _divOneTeamsForTable[team7Index].points,
      }),
    );

    http.Response response8 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team8Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team8Index].draw,
        'lose': _divOneTeamsForTable[team8Index].lose,
        'wins': _divOneTeamsForTable[team8Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team8Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team8Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team8Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team8Index].pointsDiff +=
            (_divOneTeamsForTable[team8Index].pointsScored -
                _divOneTeamsForTable[team8Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team8Index].teamId,
        'teamName': _divOneTeamsForTable[team8Index].teamName,
        'points': _divOneTeamsForTable[team8Index].points,
      }),
    );
    if (gw[4].team0Result != 0 && gw[4].team1Result != 0) {
      _divOneTeamsForTable[team9Index].matchesPlayed++;
      _divOneTeamsForTable[team10Index].matchesPlayed++;
      _divOneTeamsForTable[team9Index].pointsScored += gw[4].team0Result;
      _divOneTeamsForTable[team10Index].pointsScored += gw[4].team1Result;
      _divOneTeamsForTable[team9Index].pointsAgainst += gw[4].team1Result;
      _divOneTeamsForTable[team10Index].pointsAgainst += gw[4].team0Result;
      if (gw[4].team0Result > gw[4].team1Result) {
        _divOneTeamsForTable[team9Index].wins++;
        _divOneTeamsForTable[team10Index].lose++;
        _divOneTeamsForTable[team9Index].points += 3;
      } else if (gw[4].team0Result < gw[4].team1Result) {
        _divOneTeamsForTable[team10Index].wins++;
        _divOneTeamsForTable[team9Index].lose++;
        _divOneTeamsForTable[team10Index].points += 3;
      } else {
        _divOneTeamsForTable[team9Index].draw++;
        _divOneTeamsForTable[team10Index].draw++;
        _divOneTeamsForTable[team9Index].points += 1;
        _divOneTeamsForTable[team10Index].points += 1;
      }
    }
    http.Response response9 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team9Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team9Index].draw,
        'lose': _divOneTeamsForTable[team9Index].lose,
        'wins': _divOneTeamsForTable[team9Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team9Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team9Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team9Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team9Index].pointsDiff +=
            (_divOneTeamsForTable[team9Index].pointsScored -
                _divOneTeamsForTable[team9Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team9Index].teamId,
        'teamName': _divOneTeamsForTable[team9Index].teamName,
        'points': _divOneTeamsForTable[team9Index].points,
      }),
    );

    http.Response response10 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team10Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team10Index].draw,
        'lose': _divOneTeamsForTable[team10Index].lose,
        'wins': _divOneTeamsForTable[team10Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team10Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team10Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team10Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team10Index].pointsDiff +=
            (_divOneTeamsForTable[team10Index].pointsScored -
                _divOneTeamsForTable[team10Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team10Index].teamId,
        'teamName': _divOneTeamsForTable[team10Index].teamName,
        'points': _divOneTeamsForTable[team10Index].points,
      }),
    );
    if (gw[5].team0Result != 0 && gw[5].team1Result != 0) {
      _divOneTeamsForTable[team11Index].matchesPlayed++;
      _divOneTeamsForTable[team12Index].matchesPlayed++;
      _divOneTeamsForTable[team11Index].pointsScored += gw[5].team0Result;
      _divOneTeamsForTable[team12Index].pointsScored += gw[5].team1Result;
      _divOneTeamsForTable[team11Index].pointsAgainst += gw[5].team1Result;
      _divOneTeamsForTable[team12Index].pointsAgainst += gw[5].team0Result;
      if (gw[5].team0Result > gw[5].team1Result) {
        _divOneTeamsForTable[team11Index].wins++;
        _divOneTeamsForTable[team12Index].lose++;
        _divOneTeamsForTable[team11Index].points += 3;
      } else if (gw[5].team0Result < gw[5].team1Result) {
        _divOneTeamsForTable[team12Index].wins++;
        _divOneTeamsForTable[team11Index].lose++;
        _divOneTeamsForTable[team12Index].points += 3;
      } else {
        _divOneTeamsForTable[team11Index].draw++;
        _divOneTeamsForTable[team12Index].draw++;
        _divOneTeamsForTable[team11Index].points += 1;
        _divOneTeamsForTable[team12Index].points += 1;
      }
    }
    http.Response response11 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team11Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team11Index].draw,
        'lose': _divOneTeamsForTable[team11Index].lose,
        'wins': _divOneTeamsForTable[team11Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team11Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team11Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team11Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team11Index].pointsDiff +=
            (_divOneTeamsForTable[team11Index].pointsScored -
                _divOneTeamsForTable[team11Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team11Index].teamId,
        'teamName': _divOneTeamsForTable[team11Index].teamName,
        'points': _divOneTeamsForTable[team11Index].points,
      }),
    );

    http.Response response12 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team12Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team12Index].draw,
        'lose': _divOneTeamsForTable[team12Index].lose,
        'wins': _divOneTeamsForTable[team12Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team12Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team12Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team12Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team12Index].pointsDiff +=
            (_divOneTeamsForTable[team12Index].pointsScored -
                _divOneTeamsForTable[team12Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team12Index].teamId,
        'teamName': _divOneTeamsForTable[team12Index].teamName,
        'points': _divOneTeamsForTable[team12Index].points,
      }),
    );
    if (gw[6].team0Result != 0 && gw[6].team1Result != 0) {
      _divOneTeamsForTable[team13Index].matchesPlayed++;
      _divOneTeamsForTable[team14Index].matchesPlayed++;
      _divOneTeamsForTable[team13Index].pointsScored += gw[6].team0Result;
      _divOneTeamsForTable[team14Index].pointsScored += gw[6].team1Result;
      _divOneTeamsForTable[team13Index].pointsAgainst += gw[6].team1Result;
      _divOneTeamsForTable[team14Index].pointsAgainst += gw[6].team0Result;
      if (gw[6].team0Result > gw[6].team1Result) {
        _divOneTeamsForTable[team13Index].wins++;
        _divOneTeamsForTable[team14Index].lose++;
        _divOneTeamsForTable[team13Index].points += 3;
      } else if (gw[6].team0Result < gw[6].team1Result) {
        _divOneTeamsForTable[team14Index].wins++;
        _divOneTeamsForTable[team13Index].lose++;
        _divOneTeamsForTable[team14Index].points += 3;
      } else {
        _divOneTeamsForTable[team13Index].draw++;
        _divOneTeamsForTable[team14Index].draw++;
        _divOneTeamsForTable[team13Index].points += 1;
        _divOneTeamsForTable[team14Index].points += 1;
      }
    }
    http.Response response13 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team13Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team13Index].draw,
        'lose': _divOneTeamsForTable[team13Index].lose,
        'wins': _divOneTeamsForTable[team13Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team13Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team13Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team13Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team13Index].pointsDiff +=
            (_divOneTeamsForTable[team13Index].pointsScored -
                _divOneTeamsForTable[team13Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team13Index].teamId,
        'teamName': _divOneTeamsForTable[team13Index].teamName,
        'points': _divOneTeamsForTable[team13Index].points,
      }),
    );

    http.Response response14 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team14Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team14Index].draw,
        'lose': _divOneTeamsForTable[team14Index].lose,
        'wins': _divOneTeamsForTable[team14Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team14Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team14Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team14Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team14Index].pointsDiff +=
            (_divOneTeamsForTable[team14Index].pointsScored -
                _divOneTeamsForTable[team14Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team14Index].teamId,
        'teamName': _divOneTeamsForTable[team14Index].teamName,
        'points': _divOneTeamsForTable[team14Index].points,
      }),
    );
    if (gw[7].team0Result != 0 && gw[7].team1Result != 0) {
      _divOneTeamsForTable[team15Index].matchesPlayed++;
      _divOneTeamsForTable[team16Index].matchesPlayed++;
      _divOneTeamsForTable[team15Index].pointsScored += gw[7].team0Result;
      _divOneTeamsForTable[team16Index].pointsScored += gw[7].team1Result;
      _divOneTeamsForTable[team15Index].pointsAgainst += gw[7].team1Result;
      _divOneTeamsForTable[team16Index].pointsAgainst += gw[7].team0Result;
      if (gw[7].team0Result > gw[7].team1Result) {
        _divOneTeamsForTable[team15Index].wins++;
        _divOneTeamsForTable[team16Index].lose++;
        _divOneTeamsForTable[team15Index].points += 3;
      } else if (gw[7].team0Result < gw[7].team1Result) {
        _divOneTeamsForTable[team16Index].wins++;
        _divOneTeamsForTable[team15Index].lose++;
        _divOneTeamsForTable[team16Index].points += 3;
      } else {
        _divOneTeamsForTable[team15Index].draw++;
        _divOneTeamsForTable[team16Index].draw++;
        _divOneTeamsForTable[team15Index].points += 1;
        _divOneTeamsForTable[team16Index].points += 1;
      }
    }
    http.Response response15 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team15Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team15Index].draw,
        'lose': _divOneTeamsForTable[team15Index].lose,
        'wins': _divOneTeamsForTable[team15Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team15Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team15Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team15Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team15Index].pointsDiff +=
            (_divOneTeamsForTable[team15Index].pointsScored -
                _divOneTeamsForTable[team15Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team15Index].teamId,
        'teamName': _divOneTeamsForTable[team15Index].teamName,
        'points': _divOneTeamsForTable[team15Index].points,
      }),
    );

    http.Response response16 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team16Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team16Index].draw,
        'lose': _divOneTeamsForTable[team16Index].lose,
        'wins': _divOneTeamsForTable[team16Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team16Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team16Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team16Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team16Index].pointsDiff +=
            (_divOneTeamsForTable[team16Index].pointsScored -
                _divOneTeamsForTable[team16Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team16Index].teamId,
        'teamName': _divOneTeamsForTable[team16Index].teamName,
        'points': _divOneTeamsForTable[team16Index].points,
      }),
    );
    if (gw[8].team0Result != 0 && gw[8].team1Result != 0) {
      _divOneTeamsForTable[team17Index].matchesPlayed++;
      _divOneTeamsForTable[team18Index].matchesPlayed++;
      _divOneTeamsForTable[team17Index].pointsScored += gw[8].team0Result;
      _divOneTeamsForTable[team18Index].pointsScored += gw[8].team1Result;
      _divOneTeamsForTable[team17Index].pointsAgainst += gw[8].team1Result;
      _divOneTeamsForTable[team18Index].pointsAgainst += gw[8].team0Result;
      if (gw[8].team0Result > gw[8].team1Result) {
        _divOneTeamsForTable[team17Index].wins++;
        _divOneTeamsForTable[team18Index].lose++;
        _divOneTeamsForTable[team17Index].points += 3;
      } else if (gw[8].team0Result < gw[8].team1Result) {
        _divOneTeamsForTable[team18Index].wins++;
        _divOneTeamsForTable[team17Index].lose++;
        _divOneTeamsForTable[team18Index].points += 3;
      } else {
        _divOneTeamsForTable[team17Index].draw++;
        _divOneTeamsForTable[team18Index].draw++;
        _divOneTeamsForTable[team17Index].points += 1;
        _divOneTeamsForTable[team18Index].points += 1;
      }
    }
    http.Response response17 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team17Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team17Index].draw,
        'lose': _divOneTeamsForTable[team17Index].lose,
        'wins': _divOneTeamsForTable[team17Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team17Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team17Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team17Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team17Index].pointsDiff +=
            (_divOneTeamsForTable[team17Index].pointsScored -
                _divOneTeamsForTable[team17Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team17Index].teamId,
        'teamName': _divOneTeamsForTable[team17Index].teamName,
        'points': _divOneTeamsForTable[team17Index].points,
      }),
    );

    http.Response response18 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team18Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team18Index].draw,
        'lose': _divOneTeamsForTable[team18Index].lose,
        'wins': _divOneTeamsForTable[team18Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team18Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team18Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team18Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team18Index].pointsDiff +=
            (_divOneTeamsForTable[team18Index].pointsScored -
                _divOneTeamsForTable[team18Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team18Index].teamId,
        'teamName': _divOneTeamsForTable[team18Index].teamName,
        'points': _divOneTeamsForTable[team18Index].points,
      }),
    );
    if (gw[9].team0Result != 0 && gw[9].team1Result != 0) {
      _divOneTeamsForTable[team19Index].matchesPlayed++;
      _divOneTeamsForTable[team20Index].matchesPlayed++;
      _divOneTeamsForTable[team19Index].pointsScored += gw[9].team0Result;
      _divOneTeamsForTable[team20Index].pointsScored += gw[9].team1Result;
      _divOneTeamsForTable[team19Index].pointsAgainst += gw[9].team1Result;
      _divOneTeamsForTable[team20Index].pointsAgainst += gw[9].team0Result;
      if (gw[9].team0Result > gw[9].team1Result) {
        _divOneTeamsForTable[team19Index].wins++;
        _divOneTeamsForTable[team20Index].lose++;
        _divOneTeamsForTable[team19Index].points += 3;
      } else if (gw[9].team0Result < gw[9].team1Result) {
        _divOneTeamsForTable[team20Index].wins++;
        _divOneTeamsForTable[team19Index].lose++;
        _divOneTeamsForTable[team20Index].points += 3;
      } else {
        _divOneTeamsForTable[team19Index].draw++;
        _divOneTeamsForTable[team20Index].draw++;
        _divOneTeamsForTable[team19Index].points += 1;
        _divOneTeamsForTable[team20Index].points += 1;
      }
    }
    http.Response response19 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team19Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team19Index].draw,
        'lose': _divOneTeamsForTable[team19Index].lose,
        'wins': _divOneTeamsForTable[team19Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team19Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team19Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team19Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team19Index].pointsDiff +=
            (_divOneTeamsForTable[team19Index].pointsScored -
                _divOneTeamsForTable[team19Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team19Index].teamId,
        'teamName': _divOneTeamsForTable[team19Index].teamName,
        'points': _divOneTeamsForTable[team19Index].points,
      }),
    );

    http.Response response20 = await http.put(
      Uri.parse(
          '${fireBase}teamsDivOne/${_divOneTeamsForTable[team20Index].id}.json'),
      body: json.encode({
        'draw': _divOneTeamsForTable[team20Index].draw,
        'lose': _divOneTeamsForTable[team20Index].lose,
        'wins': _divOneTeamsForTable[team20Index].wins,
        'matchesPlayed': _divOneTeamsForTable[team20Index].matchesPlayed,
        'pointsScored': _divOneTeamsForTable[team20Index].pointsScored,
        'pointsAgainst': _divOneTeamsForTable[team20Index].pointsAgainst,
        'pointsDiff': _divOneTeamsForTable[team20Index].pointsDiff +=
            (_divOneTeamsForTable[team20Index].pointsScored -
                _divOneTeamsForTable[team20Index].pointsAgainst),
        'teamId': _divOneTeamsForTable[team20Index].teamId,
        'teamName': _divOneTeamsForTable[team20Index].teamName,
        'points': _divOneTeamsForTable[team20Index].points,
      }),
    );
  }
}
