// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayerGwPoints {
  String activeChip;
  List automaticSubs;
  Map<String, dynamic> entryHistory;
  List picks;

  PlayerGwPoints(
    this.activeChip,
    this.automaticSubs,
    this.entryHistory,
    this.picks,
  );

  factory PlayerGwPoints.fromjson(Map<String, dynamic> points) {
   return PlayerGwPoints(
      points['active_chip'],
      points['automatic_subs'],
      points['entry_history'],
      points['picks'],
    );
  }
}
