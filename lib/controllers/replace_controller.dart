import 'dart:convert';

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin ReplacePlayerController on Model {
  List _playersID = [];

  bool isSuccsess = false;

  int _subedPlayerIndex = 0;

  Map<String, dynamic> _ids = {};

  String _id = '';

  Future<void> getIdsForReplacePlayer() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _playersID.add(TeamPlayersModel.fromjson(v));
          notifyListeners();
        },
      );
    } else {
      notifyListeners();
    }
  }

  Future<bool> replacePlayer(
      {required String enteredPlayerID,
      required String outputtedPlayerID}) async {
    await getIdsForReplacePlayer();
    for (int i = 0; i < _playersID.length; i++) {
      _subedPlayerIndex = _playersID[i]
          .playersId
          .indexWhere((element) => element == outputtedPlayerID);
      if (_subedPlayerIndex != -1) {
        _playersID[i].playersId[_subedPlayerIndex] = enteredPlayerID;
        _ids = {
          'playersId': _playersID[i].playersId,
          'teamId': _playersID[i].teamId,
        };
        _id = _playersID[i].id;
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
}
