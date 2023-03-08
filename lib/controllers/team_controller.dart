import 'dart:convert';

import 'package:fantasy_elrokn/models/team_table_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

String fireBase = 'https://fantasy-el-rokn-default-rtdb.firebaseio.com/';

mixin TeamsController on Model {
  List<TeamTableModel> _allDivOneTeams = [];
  List<TeamTableModel> get allDivOneTeams => _allDivOneTeams;

  List<TeamTableModel> _allGroupOneTeams = [];
  List<TeamTableModel> get allGroupOneTeams => _allGroupOneTeams;

  List<TeamTableModel> _allGroupTwoTeams = [];
  List<TeamTableModel> get allGroupTwoTeams => _allGroupTwoTeams;

  bool _isD1Null = false;
  bool get isD1Null => _isD1Null;

  bool _isG1Null = false;
  bool get isG1Null => _isG1Null;

  bool _isG2Null = false;
  bool get isG2Null => _isG2Null;

  Future<bool> addTeamsDivOne(Map<String, dynamic> teamData) async {
    http.Response response = await http.post(
      Uri.parse('${fireBase}teamsDivOne.json'),
      body: json.encode(teamData),
    );

    if (response.statusCode == 200) {
      teamData['id'] = json.decode(response.body)['name'];
      _allDivOneTeams.add(TeamTableModel.fromjson(teamData));
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
      _allGroupOneTeams.add(TeamTableModel.fromjson(teamData));
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
      _allGroupTwoTeams.add(TeamTableModel.fromjson(teamData));
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  bool _isTableD1Loading = true;
  bool get isTableD1Loading => _isTableD1Loading;

  Future<void> getTeamsDivOneData() async {
    _isTableD1Loading = true;
    notifyListeners();
    _allDivOneTeams.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsDivOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach(
        (k, v) {
          v['id'] = k;
          _allDivOneTeams.add(TeamTableModel.fromjson(v));
          _isD1Null = false;
          notifyListeners();
        },
      );
      _allDivOneTeams.sort((a, b) => b.points.compareTo(a.points));
      _isTableD1Loading = false;
      notifyListeners();
    } else {
      _isD1Null = true;
      _isTableD1Loading = false;
      notifyListeners();
    }
  }

  bool _isTableG1Loading = true;
  bool get isTableG1Loading => _isTableG1Loading;

  Future<void> getTeamsGroupOneData() async {
    _isTableG1Loading = true;
    notifyListeners();
     _allGroupOneTeams.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupOne.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach((k, v) {
        v['id'] = k;
        _allGroupOneTeams.add(TeamTableModel.fromjson(v));
        _isG1Null = false;
      });
      _allGroupOneTeams.sort((a, b) => b.points.compareTo(a.points));
      _isTableG1Loading = false;
      notifyListeners();
    } else {
      _isG1Null = true;
      _isTableG1Loading = false;
      notifyListeners();
    }
  }

  bool _isTableG2Loading = true;
  bool get isTableG2Loading => _isTableG2Loading;

  Future<void> getTeamsGroupTwoData() async {
    _isTableG2Loading = true;
    notifyListeners();
    _allGroupTwoTeams.clear();
    http.Response response = await http.get(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
    );

    var teamsData = json.decode(response.body);

    if (teamsData != null) {
      teamsData.forEach((k, v) {
        v['id'] = k;
        _allGroupTwoTeams.add(TeamTableModel.fromjson(v));
        _isG2Null = false;
      });
      _allGroupTwoTeams.sort((a, b) => b.points.compareTo(a.points));
      _isTableG2Loading = false;
      notifyListeners();
    } else {
      _isG2Null = true;
      _isTableG2Loading = false;
      notifyListeners();
    }
  }

  Future<bool> resetAllData() async {
    http.Response response = await http.delete(
      Uri.parse('$fireBase.json'),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> resetDivOneData() async {
    http.Response response = await http.delete(
      Uri.parse('${fireBase}teamsDivOne.json'),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> resetGroupOneData() async {
    http.Response response = await http.delete(
      Uri.parse('${fireBase}teamsGroupOne.json'),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  Future<bool> resetGroupTwoData() async {
    http.Response response = await http.delete(
      Uri.parse('${fireBase}teamsGroupTwo.json'),
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
