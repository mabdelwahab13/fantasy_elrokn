// import 'dart:convert';
// import 'package:fantasy_elrokn/controllers/team_controller.dart';
// import 'package:fantasy_elrokn/models/player_gw_points.dart';
// import 'package:fantasy_elrokn/models/player_info_model.dart';
// import 'package:fantasy_elrokn/models/team_points_model.dart';
// import 'package:fantasy_elrokn/models/team_players_model.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:http/http.dart' as http;


// mixin PerviousData on Model {
//   List<List> _allPlayersId = [];
//   List<List> get allPlayersId => _allPlayersId;

//   List<TeamPlayersModel> _teamPlayers = [];

//   List<PlayerInfoModel> _previousPlayerInfo = [];
//   List<PlayerInfoModel> get previousPlayerInfo => _previousPlayerInfo;

//   List<PlayerGwPoints> _previousPlayerPoints = [];
//   List<PlayerGwPoints> get previousPlayerPoints => _previousPlayerPoints;

//   List _previousTeamsPlayerPoints = [];
//   List get previousTeamsPlayerPoints => _previousTeamsPlayerPoints;

//   List __totalCurrentGWPoints = [];
//   List get _totalCurrentGWPoints => __totalCurrentGWPoints;

//   num _points = 0;

//   bool _isteamPlayersNull = true;

//   Future<void> getIds() async {
//     http.Response response = await http.get(
//       Uri.parse('${fireBase}teamPlayers.json'),
//     );

//     var teamPlayersData = json.decode(response.body);

//     if (teamPlayersData != null) {
//       teamPlayersData.forEach(
//         (k, v) {
//           v['id'] = k;
//           _teamPlayers.add(TeamPlayersModel.fromjson(v));
//           _isteamPlayersNull = false;
//           notifyListeners();
//         },
//       );
//       for (int i = 0; i < _teamPlayers.length; i++) {
//         _allPlayersId.add(_teamPlayers[i].playersId);
//       }
//     } else {
//       _isteamPlayersNull = true;
//       notifyListeners();
//     }
//   }

//   Future<void> getPreviousPlayerInfo(String playerId) async {
//     http.Response respo = await http.get(
//       Uri.parse('https://fantasy.premierleague.com/api/entry/$playerId/'),
//     );
//     var info = json.decode(respo.body);
//     info['kit'] ?? (info['kit'] = '');
//     info['favourite_team'] ?? (info['favourite_team'] = 0);
//     info['summary_event_rank'] ?? (info['summary_event_rank'] = 0);

//     _previousPlayerInfo.add(PlayerInfoModel.fromjson(info));

//     notifyListeners();
//   }

  // Future<void> getPreviousPlayerPoints(String playerId) async {
  //   http.Response res = await http.get(
  //     Uri.parse(
  //         'https://fantasy.premierleague.com/api/entry/$playerId/history/'),
  //   );

  //   var pointsData = json.decode(res.body);

  //   _previousPlayerPoints.add(PlayerGwPoints.fromjson(pointsData));
  //   notifyListeners();
  // }

  
  
// }
