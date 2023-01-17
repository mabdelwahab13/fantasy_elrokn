import 'dart:convert';

import 'package:fantasy_elrokn/models/team_data_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

String fireBase = 'https://fantasy-el-rokn-default-rtdb.firebaseio.com/';

mixin TeamsController on Model {
  List<TeamDataModel> _allDivOneTeams = [];
  List<TeamDataModel> get allDivOneTeams => _allDivOneTeams;

  List<TeamDataModel> _allGroupOneTeams = [];
  List<TeamDataModel> get allGroupOneTeams => _allGroupOneTeams;

  List<TeamDataModel> _allGroupTwoTeams = [];
  List<TeamDataModel> get allGroupTwoTeams => _allGroupTwoTeams;

  Future<bool> addTeamsDivOne(Map<String, dynamic> teamData) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamsDivOne.json'),
      body: json.encode(teamData),
    );

    if (response.statusCode == 200) {
      teamData['id'] = json.decode(response.body)['name'];
      _allDivOneTeams.add(TeamDataModel.fromjson(teamData));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> addTeamsGroupOne(Map<String, dynamic> teamData) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamsGroupOne.json'),
      body: json.encode(teamData),
    );
    if (response.statusCode == 200) {
      teamData['id'] = json.decode(response.body)['name'];
      _allGroupOneTeams.add(TeamDataModel.fromjson(teamData));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> addTeamsGroupTwo(Map<String, dynamic> teamData) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
      body: json.encode(teamData),
    );
    if (response.statusCode == 200) {
      teamData['id'] = json.decode(response.body)['name'];
      _allGroupTwoTeams.add(TeamDataModel.fromjson(teamData));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<void> getTeamsDivOneData() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsDivOne.json'),
    );
    print(response.body);

    var teamsData = json.decode(response.body);

    teamsData.forEach((k, v) {
      v['id'] = k;
      _allDivOneTeams.add(TeamDataModel.fromjson(v));
    });

    notifyListeners();
  }

  Future<void> getTeamsGroupOneData() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupOne.json'),
    );


    var teamsData = json.decode(response.body);

    teamsData.forEach((k, v) {
      v['id'] = k;
      _allGroupOneTeams.add(TeamDataModel.fromjson(v));
    });

    notifyListeners();
  }

  Future<void> getTeamsGroupTwoData() async {
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
    );

    var teamsData = json.decode(response.body);
    print(teamsData);
    teamsData.forEach((k, v) {
      v['id'] = k;
      _allGroupTwoTeams.add(TeamDataModel.fromjson(v));
    });

    notifyListeners();
  }
}
