enum PlayerType { Player, Team }

class Participant {
  String type;
  String name;

  Participant(Map<String, dynamic> participant)
      : this.type = participant['Type'],
        this.name = participant['Name'];
}

enum Region { NA, EU, OCE }

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
        birthday = data['birthday'],
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
