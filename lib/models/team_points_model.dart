// ignore_for_file: public_member_api_docs, sort_constructors_first
class GWPointsModel {
  String id;
  List gwPoints;
  List playerOfWeekName;
  String playerOfWeek;
  List teamOfWeekName;
  String teamOfWeek;


  GWPointsModel(
    this.id,
    this.gwPoints,
    this.playerOfWeekName,
    this.playerOfWeek,
    this.teamOfWeekName,
    this.teamOfWeek,
  );
  factory GWPointsModel.fromjson(Map<String, dynamic> gWsPoints) {
    return GWPointsModel(
      gWsPoints['id'],
      gWsPoints['gwPoints'],
      gWsPoints['playerOfWeekName'],
      gWsPoints['playerOfWeek'],
      gWsPoints['teamOfWeekName'],
      gWsPoints['teamOfWeek'],
    );
  }
}
