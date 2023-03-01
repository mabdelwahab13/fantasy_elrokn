// ignore_for_file: public_member_api_docs, sort_constructors_first

class GeneralInfoModel {
  List events;
  Map gameSettings;
  List phases;
  List teams;
  num totalPlayers;
  List elements;
  List elementStats;
  List elementTypes;

  GeneralInfoModel(
    this.events,
    this.gameSettings,
    this.phases,
    this.teams,
    this.totalPlayers,
    this.elements,
    this.elementStats,
    this.elementTypes,
  );

  factory GeneralInfoModel.fromjson(Map<String, dynamic> generalInfo) {
    return GeneralInfoModel(
      generalInfo['events'],
      generalInfo['game_settings'],
      generalInfo['phases'],
      generalInfo['teams'],
      generalInfo['total_players'],
      generalInfo['elements'],
      generalInfo['element_stats'],
      generalInfo['element_types'],
    );
  }
}
