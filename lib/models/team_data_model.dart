// ignore_for_file: public_member_api_docs, sort_constructors_first
class TeamDataModel {
  String id;
  String teamId;
  String teamName;
  int matchesPlayed;
  int wins;
  int draw;
  int lose;
  int pointsScored;
  int pointsAgainst;
  int pointsDiff;
  int points;
  
  TeamDataModel(
    this.id,
    this.teamId,
    this.teamName,
    this.matchesPlayed,
    this.wins,
    this.draw,
    this.lose,
    this.pointsScored,
    this.pointsAgainst,
    this.pointsDiff,
    this.points,
  );

  factory TeamDataModel.fromjson(Map<String,dynamic> data){
    return TeamDataModel(
      data['id'],
      data['teamId'],
      data['teamName'],
      data['matchesPlayed'],
      data['wins'],
      data['draw'],
      data['lose'],
      data['pointsScored'],
      data['pointsAgainst'],
      data['pointsDiff'],
      data['points'], 
    );
  }
}
