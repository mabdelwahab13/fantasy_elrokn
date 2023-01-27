// ignore_for_file: public_member_api_docs, sort_constructors_first

class TeamPlayersModel {
  String id;
  List playersId;
  String teamId;
  TeamPlayersModel(
    this.id,
    this.playersId,
    this.teamId,
  );

  factory TeamPlayersModel.fromjson(Map<String, dynamic> data) {
    return TeamPlayersModel(
      data['id'],
      data['playersId'],
      data['teamId'],
    );
  }
}
