import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'HomePage.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'route_page.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    theme: themeData,
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: ThemeColors.grey1,
  accentColor: ThemeColors.lightGreen,
  primaryColor: ThemeColors.darkGreen,
);

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Vita",
      home:new RoutePage(auth: new Auth()),//HomePage(),
    );
  }
}
