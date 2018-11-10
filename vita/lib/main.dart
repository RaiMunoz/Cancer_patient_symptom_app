import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightBlueAccent,
  accentColor: Colors.blueAccent,
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Vita",
      home:HomePage(),
    );
  }
}
