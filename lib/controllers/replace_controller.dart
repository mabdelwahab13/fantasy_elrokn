import 'dart:convert';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin ReplacePlayerController on Model {
  List _playersIdD1 = [];
  List _playersIdG1 = [];
  List _playersIdG2 = [];

  bool isSuccsess = false;

  int _subedPlayerIndex = 0;

  Map<String, dynamic> _ids = {};

  String _id = '';

  Future<void> getIdsForReplacePlayerD1() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersDataD1 = json.decode(response.body);

    if (teamPlayersDataD1 != null) {
      teamPlayersDataD1.forEach(
        (k, v) {
          v['id'] = k;
          _playersIdD1.add(TeamPlayersModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
  }
  

  Future<bool> replacePlayerD1(
      {required String enteredPlayerID,
      required String outputtedPlayerID}) async {
    await getIdsForReplacePlayerD1();
    for (int i = 0; i < _playersIdD1.length; i++) {
      _subedPlayerIndex = _playersIdD1[i]
          .playersId
          .indexWhere((element) => element == outputtedPlayerID);
      if (_subedPlayerIndex != -1) {
        _playersIdD1[i].playersId[_subedPlayerIndex] = enteredPlayerID;
        _ids = {
          'playersId': _playersIdD1[i].playersId,
          'teamId': _playersIdD1[i].teamId,
        };
        _id = _playersIdD1[i].id;
        break;
      } else {
        continue;
      }
    }

    http.Response response = await http.put(
      Uri.parse('${fireBase}teamPlayers/$_id.json'),
      body: json.encode(_ids),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }


  Future<void> getIdsForReplacePlayerG1() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG1.json'),
    );

    var teamPlayersDataG1 = json.decode(response.body);

    if (teamPlayersDataG1 != null) {
      teamPlayersDataG1.forEach(
        (k, v) {
          v['id'] = k;
          _playersIdG1.add(TeamPlayersModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
  }

  Future<bool> replacePlayerG1(
      {required String enteredPlayerID,
      required String outputtedPlayerID}) async {
    await getIdsForReplacePlayerG1();
    for (int i = 0; i < _playersIdG1.length; i++) {
      _subedPlayerIndex = _playersIdG1[i]
          .playersId
          .indexWhere((element) => element == outputtedPlayerID);
      if (_subedPlayerIndex != -1) {
        _playersIdG1[i].playersId[_subedPlayerIndex] = enteredPlayerID;
        _ids = {
          'playersId': _playersIdG1[i].playersId,
          'teamId': _playersIdG1[i].teamId,
        };
        _id = _playersIdG1[i].id;
        break;
      } else {
        continue;
      }
    }

    http.Response response = await http.put(
      Uri.parse('${fireBase}teamPlayersG1/$_id.json'),
      body: json.encode(_ids),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }


  Future<void> getIdsForReplacePlayerG2() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG2.json'),
    );

    var teamPlayersDataG2 = json.decode(response.body);

    if (teamPlayersDataG2 != null) {
      teamPlayersDataG2.forEach(
        (k, v) {
          v['id'] = k;
          _playersIdG2.add(TeamPlayersModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
  }

  Future<bool> replacePlayerG2(
      {required String enteredPlayerID,
      required String outputtedPlayerID}) async {
    await getIdsForReplacePlayerG2();
    for (int i = 0; i < _playersIdG2.length; i++) {
      _subedPlayerIndex = _playersIdG2[i]
          .playersId
          .indexWhere((element) => element == outputtedPlayerID);
      if (_subedPlayerIndex != -1) {
        _playersIdG2[i].playersId[_subedPlayerIndex] = enteredPlayerID;
        _ids = {
          'playersId': _playersIdG2[i].playersId,
          'teamId': _playersIdG2[i].teamId,
        };
        _id = _playersIdG2[i].id;
        break;
      } else {
        continue;
      }
    }

    http.Response response = await http.put(
      Uri.parse('${fireBase}teamPlayersG1/$_id.json'),
      body: json.encode(_ids),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
