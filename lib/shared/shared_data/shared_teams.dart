import 'package:flutter/material.dart';

class TeamsName {
  static Map<int, Map> firstDivisionTeams = {
    0: {
      'name': 'The Boys',
      'points': 78,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    1: {
      'name': 'Xhakalaka Boom	',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    2: {
      'name': '5 Angry Men',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    3: {
      'name': 'Better Call Us',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    4: {
      'name': 'Goat MMI',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    5: {
      'name': 'GodFather',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    6: {
      'name': 'Barbers',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    7: {
      'name': 'Goat',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    8: {
      'name': 'La Fábrica',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    9: {
      'name': 'Manchester',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    10: {
      'name': 'Band of Brothers',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    11: {
      'name': 'The Gabblers',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    12: {
      'name': 'Danger',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    13: {
      'name': 'GoodFellas',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    14: {
      'name': 'Red Wolves',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    15: {
      'name': 'Suicide Squad',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    16: {
      'name': 'Luka',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    17: {
      'name': 'Boca Seniors',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    18: {
      'name': 'Fury',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
    19: {
      'name': 'Catalonia Clowns',
      'points': 0,
      'matchPlayed': 0,
      'wins': 0,
      'draws': 0,
      'lose': 0,
      'pointsdiff': 0,
    },
  };
}

class SharedLeagueD1GameWeeks {
  static List<Widget> tabs = [
    for(int i =1; i<=38; i++)
    Tab(
      text: 'GW$i',
    ),
  ];
}

class SharedLeagueD2GameWeeks {
  static List<Widget> tabs = [
    for(int i =1; i<=34; i++)
    Tab(
      text: 'GW$i',
    ),
  ];
}

class SharedCupGameWeeks {
  static List<Widget> tabs = [
    for(int i =1; i<=15; i++)
    Tab(
      text: 'GW$i',
    ),
  ];
}

class SharedPlayOffWeeks {
  static List<Widget> tabs = [
    for(int i =1; i<=4; i++)
    Tab(
      text: 'GW${i+34}',
    ),
  ];
}