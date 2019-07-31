import 'package:flutter/material.dart';
import 'package:octane_gg/model/news.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:provider/provider.dart';

import 'octane.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => NewsModel()),
        ChangeNotifierProvider(builder: (_) => ParticipantModel()),
      ],
      child: Octane(),
    ),
  );
}
