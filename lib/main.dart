import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:octane_gg/model/news.dart';
import 'package:intl/intl.dart';
import 'package:octane_gg/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => NewsModel(),
          )
        ],
        child: Octane(),
      ),
    );

class Octane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        canvasColor: Color(0xFFe5e7ea),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFF38495a),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF2e3f52),
        ),
      ),
    );
  }
}
