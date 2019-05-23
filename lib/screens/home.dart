import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:octane_gg/components/article_list_item.dart';
import 'package:octane_gg/model/news.dart';

const apiBase = "https://api.octane.gg/api";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsArticle> news = <NewsArticle>[];

  fetchNews() async {
    var resp = await http.get("$apiBase/news");
    if (resp.statusCode == 200) {
      String body = resp.body;
      var respJson = json.decode(body);
      for (var article in respJson['data']) {
        news.add(NewsArticle(article));
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Octane"),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];
          return ArticleListItem(article: article);
        },
      ),
    );
  }
}
