import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:octane_gg/model/news.dart';

const apiBase = "https://api.octane.gg/api";

void main() => runApp(Octane());

class Octane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF2e3f52),
        ),
      ),
    );
  }
}

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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Container(
            child: Text(news[index].title),
          );
        },
      ),
    );
  }
}
