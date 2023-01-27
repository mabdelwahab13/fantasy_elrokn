import 'dart:convert';
import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/models/player_gw_points.dart';
import 'package:fantasy_elrokn/models/player_info_model.dart';
import 'package:fantasy_elrokn/models/team_players_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin PlayerDataController on Model {
  List<PlayerInfoModel> _playerInfo = [];
  List<PlayerInfoModel> get playerInfo => _playerInfo;

  List<PlayerGwPoints> _playerPoints = [];
  List<PlayerGwPoints> get playerPoints => _playerPoints;

  List<TeamPlayersModel> _allTeamPlayers = [];
  List<TeamPlayersModel> get allTeamPlayers => _allTeamPlayers;

  List _ids = [];
  var x;

  bool _isteamPlayersNull = false;

  late String _playerName;
  late String _playerteamName;
  late String _playerId;
  late int _gwPoints;
  late int _totalPoints;
  late int _minus;

  Future<bool> addPlayersId(Map<String, dynamic> teamPlayersData) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamPlayers.json'),
      body: json.encode(teamPlayersData),
    );

    if (response.statusCode == 200) {
      teamPlayersData['id'] = json.decode(response.body)['name'];
      _allTeamPlayers.add(TeamPlayersModel.fromjson(teamPlayersData));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<void> getPlayersId(String teamId) async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamPlayers.json'),
    );

    var teamPlayersData = json.decode(response.body);

    if (teamPlayersData != null) {
      teamPlayersData.forEach(
        (k, v) {
          v['id'] = k;
          _allTeamPlayers.add(TeamPlayersModel.fromjson(v));
          _isteamPlayersNull = false;
          notifyListeners();
        },
      );
    } else {
      _isteamPlayersNull = true;
      notifyListeners();
    }
    for (int i = 0; i < _allTeamPlayers.length; i++) {
      _ids=[];
      if (_allTeamPlayers[i].teamId == teamId) {
        _ids = _allTeamPlayers[i].playersId;
        break;
      }else{
         _ids=[];
      }
    }
    notifyListeners();
  }

  Future<void> getPlayerInfo(String playerId) async {
    http.Response respo = await http.get(
      Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
    );
    var info = json.decode(respo.body);
    info['kit'] ?? (info['kit']='');
    info['favourite_team']?? (info['favourite_team']=0);
    
   _playerInfo.add(PlayerInfoModel.fromjson(info));

    notifyListeners();
  }

  Future<void> getData(String teamId) async {
    _playerInfo.clear();
    _playerPoints.clear();
   await getPlayersId(teamId);
     print(_ids);
     print(teamId);
    for (int i = 0; i < _ids.length; i++) {
      await getPlayerInfo(_ids[i]);
      await getPlayerPoints(_ids[i],playerInfo[i].currentEvent.toString());
      notifyListeners();
    }
    notifyListeners();
  }

   Future<void> getPerviousData(String teamId, String event) async {
    _playerInfo.clear();
    _playerPoints.clear();
   await getPlayersId(teamId);
     print(_ids);
     print(teamId);
    for (int i = 0; i < _ids.length; i++) {
      await getPlayerInfo(_ids[i]);
      await getPlayerPoints(_ids[i],event);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getPlayerPoints(String playerId, String event) async {
    http.Response res = await http.get(
      Uri.parse(
          'https://fantasy.premierleague.com/api/entry/$playerId/event/$event/picks/'),
    );

    var points = json.decode(res.body);
    points['active_chip']??(points['active_chip']='');
    points['automatic_subs']??(points['automatic_subs']=[]);
     
   _playerPoints.add(PlayerGwPoints.fromjson(points));
    notifyListeners();
  }
}
