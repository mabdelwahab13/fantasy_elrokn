// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrentPlayerGwPoints {
  String activeChip;
  List automaticSubs;
  Map<String, dynamic> entryHistory;
  List picks;
  CurrentPlayerGwPoints(
    this.activeChip,
    this.automaticSubs,
    this.entryHistory,
    this.picks,
  );

  factory CurrentPlayerGwPoints.fromjson(Map<String, dynamic> points) {
    return CurrentPlayerGwPoints(
      points['active_chip'],
      points['automatic_subs'],
      points['entry_history'],
      points['picks'],
    );
  }
}
