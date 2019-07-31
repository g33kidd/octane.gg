import 'package:flutter/material.dart';

import 'screens/players.dart';
import 'screens/splash.dart';
import 'screens/teams.dart';

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
        '/teams': (_) => TeamsScreen(),
      },
    );
  }
}
