

import 'package:fantasy_elrokn/controllers/team_controller.dart';
import 'package:fantasy_elrokn/controllers/player_data_controller.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with PlayerDataController, TeamsController{}