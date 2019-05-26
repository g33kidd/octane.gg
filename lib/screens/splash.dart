import 'package:flutter/material.dart';
import 'package:octane_gg/model/news.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:octane_gg/screens/home.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<NewsModel>(context).getNews();
      Provider.of<ParticipantModel>(context).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<NewsModel, ParticipantModel>(
        builder: (context, news, participant, child) {
          if (news.loaded && participant.participantsLoaded) {
            /// TODO: This doesn't work... try to load images before we get to the [Home] screen.
            // news.articles.forEach(
            //   (f) => precacheImage(NetworkImage(f.image), context),
            // );
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Home()),
              );
            });
          }

          return Container(
            color: Color(0xFF2e3f52),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Color(0xFF2fca7c),
              ),
            ),
          );
        },
      ),
    );
  }
}
