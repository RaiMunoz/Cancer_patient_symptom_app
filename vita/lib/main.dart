import 'package:flutter/material.dart';
import '../assets/theme/theme.dart';
import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: ThemeColors.grey1,
  accentColor: ThemeColors.darkGreen,
  primaryColor: ThemeColors.lightGreen,
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
