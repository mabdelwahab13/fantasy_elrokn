// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlayerDataModel {
  String playerName;
  String playerteamName;
  // String playerId;
  int gwPoints;
  int totalPoints;
  int minus;
  PlayerDataModel({
    required this.playerName,
    required this.playerteamName,
    // required this.playerId,
    required this.gwPoints,
    required this.totalPoints,
    required this.minus,
  });

 

  // factory PlayerDataModel.fromjson(Map<String,dynamic> data){
  //   return PlayerDataModel(
  //     data['playerName'], 
  //     data['playerteamName'], 
  //     data['gwPoints'], 
  //     data['totalPoints'], 
  //     data['minus'],
  //     data['playerId'],
  //   );
  // }
}
