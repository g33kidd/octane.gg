import 'package:flutter/material.dart';
import 'package:octane_gg/model/news.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:octane_gg/screens/home.dart';
import 'package:octane_gg/screens/players.dart';
import 'package:octane_gg/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        builder: (_) => NewsModel(),
      ),
      ChangeNotifierProvider(
        builder: (_) => ParticipantModel(),
      ),
    ],
    child: Octane(),
  ));
}

class Octane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
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
      routes: {
        '/players': (_) => PlayersScreen(),
        // '/teams': TeamsScreen(),
      },
    );
  }
}
