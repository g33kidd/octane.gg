import 'package:flutter/material.dart';
import 'package:octane_gg/components/app_scaffold.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:provider/provider.dart';

class TeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Teams",
      child: Consumer<ParticipantModel>(
        builder: (context, participant, child) {
          if (participant.teamsLoaded) {
            return ListView.builder(
              itemCount: participant.teams.length,
              itemBuilder: (context, index) {
                final team = participant.teams[index];
                return Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(team.icon),
                    ),
                    Text("${team.team} | ${team.region.toString()}")
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
