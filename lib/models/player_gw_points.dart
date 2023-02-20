// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayerGwPoints {
 List current;
 List past;
 List chips;
  PlayerGwPoints(
   this.current,
   this.past,
   this.chips,
  );

  factory PlayerGwPoints.fromjson(Map<String, dynamic> points) {
   return PlayerGwPoints(
      points['current'],
      points['past'],
      points['chips'],
    );
  }
}
