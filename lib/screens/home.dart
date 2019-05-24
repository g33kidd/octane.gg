import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:octane_gg/components/article_list_item.dart';
import 'package:octane_gg/model/news.dart';
import 'package:provider/provider.dart';

const apiBase = "https://api.octane.gg/api";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<NewsModel>(context).getNews();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsModel>(
      builder: (context, news, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Octane"),
          ),
          body: (news.loaded)
              ? ListView.builder(
                  itemCount: news.articles.length,
                  itemBuilder: (context, index) {
                    final article = news.articles[index];
                    return ArticleListItem(article: article);
                  },
                )
              : Text("Loading..."),
        );
      },
    );
  }
}
