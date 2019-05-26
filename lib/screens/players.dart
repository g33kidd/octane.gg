import 'package:flutter/material.dart';
import 'package:octane_gg/components/app_scaffold.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:provider/provider.dart';

class PlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Players",
      child: Consumer<ParticipantModel>(
        builder: (context, participant, child) {
          if (participant.playersLoaded) {
            return ListView.builder(
              itemCount: participant.participants.length,
              itemBuilder: (context, index) {
                final p = participant.participants[index];
                return Text("${p.name} | ${p.type}");
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    )
  }
}
