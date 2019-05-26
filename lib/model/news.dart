import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:octane_gg/api.dart';

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
    final news = await API.getNews();
    _articles.addAll(news);
    loaded = true;
    notifyListeners();
  }
}
