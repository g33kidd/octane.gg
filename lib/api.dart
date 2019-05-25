import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:octane_gg/model/news.dart';
import 'package:octane_gg/model/participant.dart';

class APIError {
  final String err;
  final String detail;
  final int statusCode;

  APIError({this.err, this.detail, this.statusCode});

  String toString() {
    return "API Error Occurred (status code :: $statusCode):\n$err\n$detail";
  }
}

class API {
  // API Base URL
  static final String base = "https://api.octane.gg/api";

  // API Endpoints
  static String get news => "$base/news";
  static String get players => "$base/search/players";
  static String get teams => "$base/search/teams";
  static String get events => "$base/search/events";
  static String get matches => "$base/matches2";
  static String get match => "$base/match";
  static String get series => "$base/series";
  static String get h2h => "$base/head_to_head";

  static dynamic request(endpoint) async {
    final http.Response response = await http.get(endpoint);
    final Map<String, dynamic> responseJSON = json.decode(response.body);

    if (successfulResponse(response)) {
      return responseJSON;
    } else {
      return APIError(
        err: "Error",
        detail: "Something went wrong",
        statusCode: response.statusCode,
      );
    }
  }

  static bool successfulResponse(http.Response response) {
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJSON = json.decode(response.body);
      if (responseJSON.containsKey('Error')) {
        return false;
      } else if (responseJSON.containsKey('data')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<List<NewsArticle>> getNews() async {
    final List<NewsArticle> _articles = [];
    final responseJSON = await request(news);
    for (var article in responseJSON['data']) {
      _articles.add(NewsArticle(article));
    }
    return _articles;
  }

  static Future<List<Participant>> getPlayers() async {
    final List<Participant> _players = [];
    final responseJSON = await request(players);
    for (var player in responseJSON['data']) {
      _players.add(Participant(player));
    }
  }
}
