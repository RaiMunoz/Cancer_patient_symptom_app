import 'package:flutter/material.dart';
import 'home_widget.dart';


void main() => runApp(App());

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightBlueAccent,
  accentColor: Colors.blueAccent,
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Vita",
      home:Home(),
    );
  }
}
