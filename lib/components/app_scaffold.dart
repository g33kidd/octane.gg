import 'package:flutter/material.dart';

/// TODO create a sliver variant of this Scaffold that allows for... SLIVERS!

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final bool hasDrawer;

  AppScaffold({
    Key key,
    this.child,
    this.title,
    this.hasDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hasDrawer ??
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("Octane.gg"),
                ),
                ListTile(
                  title: Text("Players"),
                  onTap: () {
                    Navigator.pushNamed(context, "/players");
                  },
                ),
                ListTile(
                  title: Text("Teams"),
                  onTap: () {
                    Navigator.pushNamed(context, "/teams");
                  },
                ),
              ],
            ),
          ),
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.child,
    );
  }
}
