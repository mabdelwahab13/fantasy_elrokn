import 'package:fantasy_elrokn/controllers/get_previous_data.dart';
import 'package:fantasy_elrokn/controllers/matches_fixutre_dev_one_controller.dart';
import 'package:fantasy_elrokn/controllers/matches_fixutre_grp_one_controller.dart';
import 'package:fantasy_elrokn/controllers/replace_controller.dart';
import 'package:fantasy_elrokn/controllers/table_d1_controller.dart';
import 'package:fantasy_elrokn/controllers/table_g1_controller.dart';
import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/controllers/player_data_controller.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model
    with
        PlayerDataController,
        TeamsController,
        MatchesFixtureDevOneController,
        ReplacePlayerController,
        TableD1Controller,
        MatchesFixtureGroupOneController,
        TableG1Controller {}
