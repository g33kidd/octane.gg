import 'package:flutter/material.dart';

/// TODO create a sliver variant of this Scaffold that allows for... SLIVERS!

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  AppScaffold({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: FlatButton(
            child: Text("Players"),
            onPressed: () {
              Navigator.pushNamed(context, "/players");
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.child,
    );
  }
}
