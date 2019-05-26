import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:octane_gg/api.dart';

enum PlayerType { Player, Team }

class Participant {
  String type;
  String name;

  Participant(Map<String, dynamic> participant)
      : this.type = participant['type'],
        this.name = participant['name'];
}

enum Region { NA, EU, OCE }

class ParticipantModel extends ChangeNotifier {
  final List<Participant> _participants = [];
  final List<Team> _teams = [];
  final List<Player> _players = [];

  bool participantsLoaded = false;
  bool playersLoaded = false;
  bool teamsLoaded = false;

  UnmodifiableListView<Participant> get participants =>
      UnmodifiableListView(_participants);
  UnmodifiableListView<Player> get players => UnmodifiableListView(_players);
  UnmodifiableListView<Team> get teams => UnmodifiableListView(_teams);

  Future getAll() async {
    await getParticipants();
    await getPlayers();
    await getTeams();
  }

  Future getPlayers() async {
    final players = await API.getPlayersDetail();
    playersLoaded = true;
    _players
      ..clear()
      ..addAll(players);
    notifyListeners();
  }

  Future getTeams() async {
    final teams = await API.getTeamsDetail();
    teamsLoaded = true;
    _teams
      ..clear()
      ..addAll(teams);
    notifyListeners();
  }

  Future getParticipants() async {
    final players = await API.getPlayers();
    final teams = await API.getTeams();

    participantsLoaded = true;
    _participants
      ..clear()
      ..addAll([...players, ...teams]);

    notifyListeners();
  }
}

class Player {
  int playerId;
  String player;
  String name;
  String country;
  Region region;
  DateTime birthday;
  String team;
  String secondary;
  String twitter;
  String twitch;
  String credit;
  int sarpbc;
  int sub1;
  int sub2;
  int newPlayer;

  String get image =>
      Uri.encodeFull("https://octane.gg/player-pictures/$player.png");

  Player(Map<String, dynamic> data)
      : playerId = data['player_id'],
        player = data['player'],
        name = data['name'],
        country = data['country'],
        birthday = DateTime.parse(data['birthday']),
        team = data['team'],
        secondary = data['secondary'],
        twitter = data['twitter'],
        twitch = data['twitch'],
        credit = data['credit'],
        sarpbc = data['sarpbc'],
        sub1 = data['sub1'],
        sub2 = data['sub2'],
        newPlayer = data['new'];
}

class Team {
  int teamId;
  String team;
  String shortName;
  Region region;
  String type;
  String twitter;
  String site;

  String get icon => Uri.encodeFull("https://octane.gg/team-icons/$team.png");
  String get logo => Uri.encodeFull("https://octane.gg/team-logos/$team.png");

  static Region getRegion(String _region) {
    switch (_region) {
      case "NA":
        return Region.NA;
        break;
      case "EU":
        return Region.EU;
        break;
      case "OCE":
        return Region.OCE;
        break;
      default:
        return Region.NA;
    }
  }

  Team(Map<String, dynamic> data)
      : teamId = data['team_id'],
        team = data['team'],
        shortName = data['short_name'],
        region = getRegion(data['region']),
        type = data['type'],
        twitter = data['twitter'],
        site = data['site'];
}
