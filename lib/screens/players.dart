import 'package:flutter/material.dart';
import 'package:octane_gg/model/participant.dart';
import 'package:provider/provider.dart';

class PlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players"),
      ),
      body: Consumer<ParticipantModel>(
        builder: (context, participant, child) {
          if (participant.participantsLoaded) {
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
    );
  }
}
