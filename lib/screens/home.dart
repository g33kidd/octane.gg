import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:octane_gg/model/news.dart';
import 'package:intl/intl.dart';

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
          final date = DateFormat('MMMM d, yyyy');
          return Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // TODO somehow load the images faster when scrolling, lazy loading or whatever. Maybe cache.
                Image.network(article.image),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        article.author,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        date.format(article.date),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 0,
                    bottom: 12.0,
                  ),
                  child: Text(
                    article.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
