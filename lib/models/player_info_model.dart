// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlayerInfoModel {
  int id;
  var joinedTime;
  int startedEvent;
  int favouriteTeam;
  String playerFirstName;
  String playerLastName;
  int playerRegionId;
  String playerRegionName;
  String playerRegionIsoCodeShort;
  String playerRegionIsoCodeLong;
  int summaryOverallPoints;
  int summaryOverallRank;
  int summaryeventPoints;
  int summaryEventRank;
  int currentEvent;
  Map<String, dynamic> leagues;
  String name;
  bool nameChangeBlocked;
  String kit;
  int lastDeadlineBank;
  int lastDeadlineValue;
  int lastDeadlineTotalTransfers; 

  PlayerInfoModel(
    this.id,
    this.joinedTime,
    this.startedEvent,
    this.favouriteTeam,
    this.playerFirstName,
    this.playerLastName,
    this.playerRegionId,
    this.playerRegionName,
    this.playerRegionIsoCodeShort,
    this.playerRegionIsoCodeLong,
    this.summaryOverallPoints,
    this.summaryOverallRank,
    this.summaryeventPoints,
    this.summaryEventRank,
    this.currentEvent,
    this.leagues,
    this.name,
    this.nameChangeBlocked,
    final this.kit,
    this.lastDeadlineBank,
    this.lastDeadlineValue,
    this.lastDeadlineTotalTransfers,
  );

  factory PlayerInfoModel.fromjson(Map<String, dynamic> info) {
    return PlayerInfoModel(
     info['id'],
     info['joined_time'],
     info['started_event'],
     info['favourite_team'],
     info['player_first_name'],
     info['player_last_name'],
     info['player_region_id'],
     info['player_region_name'],
     info['player_region_iso_code_short'],
     info['player_region_iso_code_long'],
     info['summary_overall_points'],
     info['summary_overall_rank'],
     info['summary_event_points'],
     info['summary_event_rank'],
     info['current_event'],
     info['leagues'],
     info['name'],
     info['name_change_blocked'],
     info['kit'],
     info['last_deadline_bank'],
     info['last_deadline_value'],
     info['last_deadline_total_transfers'],
    );
  }
}

