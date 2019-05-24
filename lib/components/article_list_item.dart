import 'package:flutter/material.dart';
import 'package:octane_gg/model/news.dart';
import 'package:intl/intl.dart';
import 'package:octane_gg/screens/article.dart';

class ArticleListItem extends StatelessWidget {
  final NewsArticle article;

  ArticleListItem({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MMMM d, yyyy');

    return Container(
      margin: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Article(article: article),
              ),
            );
          },
          splashColor: Color(0xFF2fca7c),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // TODO somehow load the images faster when scrolling, lazy loading or whatever. Maybe cache.
              Image(
                image: NetworkImage(article.image),
              ),
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
        ),
      ),
    );
  }
}
