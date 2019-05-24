import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const apiBase = "https://api.octane.gg/api";

class NewsArticle {
  int id;
  int publish;
  DateTime date;
  String author;
  String twitter;
  String hyphenated;
  String title;
  String description;
  String image;
  String article;
  String article2;

  NewsArticle(Map<String, dynamic> json)
      : this.id = json['id'],
        this.publish = json['Publish'],
        this.date = DateTime.parse(json['Date']),
        this.author = json['Author'],
        this.twitter = json['Twitter'],
        this.hyphenated = json['hyphenated'],
        this.title = json['Title'],
        this.description = json['Description'],
        this.image = json['Image'],
        this.article = json['Article'],
        this.article2 = json['Article2'];
}

class NewsModel extends ChangeNotifier {
  final List<NewsArticle> _articles = [];
  bool loaded = false;

  UnmodifiableListView<NewsArticle> get articles =>
      UnmodifiableListView(_articles);

  void getNews() async {
    var resp = await http.get("$apiBase/news");
    if (resp.statusCode == 200) {
      String body = resp.body;
      var respJson = json.decode(body);
      for (var article in respJson['data']) {
        _articles.add(NewsArticle(article));
      }
      loaded = true;
      notifyListeners();
    }
  }
}
