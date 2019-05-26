import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:octane_gg/components/app_scaffold.dart';
import 'package:octane_gg/model/news.dart';

class Article extends StatelessWidget {
  final NewsArticle article;

  Article({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "",
      child: ListView(
        children: <Widget>[
          Image.network(article.image),
          Text(article.title),
          Html(
            padding: EdgeInsets.all(16.0),
            data: article.article2,
            blockSpacing: 16.0,

            /// TODO: Anything that might be required to make the content look decent....
            /// as of right now the rendered result ususally doesn't look very good at all!
            /// TODO: create a renderer method that will handle the customRender and customTextStyle stuff..

            // customTextStyle: (node, _) {
            //   print(node);
            //   return TextStyle(
            //     color: Colors.red,
            //   );
            // },
            // customRender: (node, children) {
            //   print(node);
            //   print(children);
            //   return Text("hello");
            // },
          ),
        ],
      ),
    );
  }
}
