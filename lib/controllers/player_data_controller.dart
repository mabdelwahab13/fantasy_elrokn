import 'dart:convert';
import 'package:fantasy_elrokn/models/player_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin PlayerDataController on Model {
  

  // late int _index;
  // late String _id;

  // int get index => _index;
  // String get id => _id;

  // set(String id, int index) {
  //   _id = id;
  //   _index = index;
  // }

  // List<PlayerDataModel> _playerData = [];
  // List<PlayerDataModel> get playerData => _playerData;

  // Future<void> getPlayerData() async {
  //   http.Response respo = await http.get(
  //     Uri.parse('https://fantasy.premierleague.com/api/entry/704941/'),
  //   );
  //   http.Response res = await http.get(
  //     Uri.parse(
  //         'https://fantasy.premierleague.com/api/entry/704941/event/1/picks/'),
  //   );
  //   var data2 = json.decode(respo.body);
  //   var data = json.decode(res.body);

  //   _playerData.add(
  //     PlayerDataModel(
  //       playerName:
  //           '${data2['player_first_name']} ${data2['player_last_name']}',
  //       playerteamName: '${data2['name']}',
  //       gwPoints: data['entry_history']['points'],
  //       totalPoints: data['entry_history']['total_points'],
  //       minus: data['entry_history']['event_transfers_cost'],
  //     ),
  //   );
  // }
}
