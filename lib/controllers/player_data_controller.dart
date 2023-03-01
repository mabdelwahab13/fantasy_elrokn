import 'dart:convert';
import 'dart:ffi';
import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/player_gw_points.dart';
import 'package:fantasy_elrokn/models/player_info_model.dart';
import 'package:fantasy_elrokn/models/team_points_model.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin PlayerDataController on Model {
  List<PlayerInfoModel> _playerInfo = [];
  List<PlayerInfoModel> get playerInfo => _playerInfo;

  List<PlayerGwPoints> _playerPoints = [];
  List<PlayerGwPoints> get playerPoints => _playerPoints;

  List<TeamPlayersModel> _allTeamPlayersD1 = [];
  List<TeamPlayersModel> get allTeamPlayersD1 => _allTeamPlayersD1;

  List<TeamPlayersModel> _allTeamPlayersG1 = [];
  List<TeamPlayersModel> get allTeamPlayersG1 => _allTeamPlayersG1;

  List<TeamPlayersModel> _allTeamPlayersG2 = [];
  List<TeamPlayersModel> get allTeamPlayersG2 => _allTeamPlayersG2;


  List _idsD1 = [];
  List _idsG1 = [];
  List _idsG2 = [];
  var x;

  bool _isteamPlayersNull = false;

  late String _playerName;
  late String _playerteamName;
  late String _playerId;
  late int _gwPoints;
  late int _totalPoints;
  late int _minus;

  Future<bool> addPlayersIdD1(Map<String, dynamic> teamPlayersDataD1) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamPlayers.json'),
      body: json.encode(teamPlayersDataD1),
    );

    if (response.statusCode == 200) {
      teamPlayersDataD1['id'] = json.decode(response.body)['name'];
      _allTeamPlayersD1.add(TeamPlayersModel.fromjson(teamPlayersDataD1));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> addPlayersIdG1(Map<String, dynamic> teamPlayersDataG1) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamPlayersG1.json'),
      body: json.encode(teamPlayersDataG1),
    );

    if (response.statusCode == 200) {
      teamPlayersDataG1['id'] = json.decode(response.body)['name'];
      _allTeamPlayersG1.add(TeamPlayersModel.fromjson(teamPlayersDataG1));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> addPlayersIdG2(Map<String, dynamic> teamPlayersDataG2) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamPlayersG2.json'),
      body: json.encode(teamPlayersDataG2),
    );

    if (response.statusCode == 200) {
      teamPlayersDataG2['id'] = json.decode(response.body)['name'];
      _allTeamPlayersG2.add(TeamPlayersModel.fromjson(teamPlayersDataG2));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<void> getPlayersIdD1(String teamId) async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersDataD1 = json.decode(response.body);

    if (teamPlayersDataD1 != null) {
      teamPlayersDataD1.forEach(
        (k, v) {
          v['id'] = k;
          _allTeamPlayersD1.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
    for (int i = 0; i < _allTeamPlayersD1.length; i++) {
      _idsD1 = [];
      if (_allTeamPlayersD1[i].teamId == teamId) {
        _idsD1 = _allTeamPlayersD1[i].playersId;
        break;
      } else {
        _idsD1 = [];
      }
    }
    notifyListeners();
  }

  Future<void> getPlayersIdG1(String teamId) async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG1.json'),
    );

    var teamPlayersDataG1 = json.decode(response.body);

    if (teamPlayersDataG1 != null) {
      teamPlayersDataG1.forEach(
        (k, v) {
          v['id'] = k;
          _allTeamPlayersG1.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
    for (int i = 0; i < _allTeamPlayersG1.length; i++) {
      _idsG1 = [];
      if (_allTeamPlayersG1[i].teamId == teamId) {
        _idsG1 = _allTeamPlayersG1[i].playersId;
        break;
      } else {
        _idsG1 = [];
      }
    }
    notifyListeners();
  }


  Future<void> getPlayersIdG2(String teamId) async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayersG2.json'),
    );

    var teamPlayersDataG2 = json.decode(response.body);

    if (teamPlayersDataG2 != null) {
      teamPlayersDataG2.forEach(
        (k, v) {
          v['id'] = k;
          _allTeamPlayersG2.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
    for (int i = 0; i < _allTeamPlayersG2.length; i++) {
      _idsG2 = [];
      if (_allTeamPlayersG2[i].teamId == teamId) {
        _idsG2 = _allTeamPlayersG2[i].playersId;
        break;
      } else {
        _idsG2 = [];
      }
    }
    notifyListeners();
  }

  Future<void> getPlayerInfo(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit'] = '');
    info['favourite_team'] ?? (info['favourite_team'] = 0);
    info['summary_event_rank']?? (info['summary_event_rank'] = 0);

    _playerInfo.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getPlayerPoints(String playerId) async {
    http.Response res = await http.get(
      Uri.parse(
          'https://fantasy.premierleague.com/api/entry/$playerId/history/'),
    );

    var points = json.decode(res.body);

    _playerPoints.add(PlayerGwPoints.fromjson(points));
    notifyListeners();
  }

  Future<void> getDataD1(String teamId) async {
    _playerInfo.clear();
    _playerPoints.clear();
    await getPlayersIdD1(teamId);
    for (int i = 0; i < _idsD1.length; i++) {
      await getPlayerInfo(_idsD1[i]);
      await getPlayerPoints(_idsD1[i]);
      notifyListeners();
    }   
    notifyListeners();
  }

  Future<void> getDataG1(String teamId) async {
    _playerInfo.clear();
    _playerPoints.clear();
    await getPlayersIdG1(teamId);
    for (int i = 0; i < _idsG1.length; i++) {
      await getPlayerInfo(_idsG1[i]);
      await getPlayerPoints(_idsG1[i]);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getDataG2(String teamId) async {
    _playerInfo.clear();
    _playerPoints.clear();
    await getPlayersIdG2(teamId);
    for (int i = 0; i < _idsG2.length; i++) {
      await getPlayerInfo(_idsG2[i]);
      await getPlayerPoints(_idsG2[i]);
      notifyListeners();
    }
    notifyListeners();
  }

  // Future<void> getPerviousDataD1(String teamId, String event) async {
  //   _playerInfo.clear();
  //   _playerPoints.clear();
  //   await getPlayersIdD1(teamId);
  //   for (int i = 0; i < _idsD1.length; i++) {
  //     await getPlayerInfo(_idsD1[i]);
  //     await getPlayerPoints(_idsD1[i]);
  //     notifyListeners();
  //   }
   
  //   notifyListeners();
  // }

  // Future<void> getPerviousDataG1(String teamId, String event) async {
  //   _playerInfo.clear();
  //   _playerPoints.clear();
  //   await getPlayersIdG1(teamId);
  //   for (int i = 0; i < _idsG1.length; i++) {
  //     await getPlayerInfo(_idsG1[i]);
  //     await getPlayerPoints(_idsG1[i]);
  //     notifyListeners();
  //   }
   
  //   notifyListeners();
  // }

  // Future<void> getPerviousDataG2(String teamId, String event) async {
  //   _playerInfo.clear();
  //   _playerPoints.clear();
  //   await getPlayersIdG2(teamId);
  //   for (int i = 0; i < _idsG2.length; i++) {
  //     await getPlayerInfo(_idsG2[i]);
  //     await getPlayerPoints(_idsG2[i]);
  //     notifyListeners();
  //   }
   
  //   notifyListeners();
  // }

  // Future<bool> addPlayersData(String teamId, String event) async {
  //   getPerviousData(teamId, event);
  //   http.Response response = await http.post(
  //       Uri.parse('${fireBase}playersData.json'),
  //       body: json.encode(value));
  // }
}
