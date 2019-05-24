import 'package:flutter/material.dart';
import 'package:octane_gg/model/news.dart';

class Article extends StatelessWidget {
  final NewsArticle article;

  Article({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Octane"),
      ),
      body: Column(),
    );
  }
}
