import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';

import 'pages/profile/account.dart';

import 'pages/messaging/inbox_screen.dart';

import 'pages/diary/add_information.dart';
import 'pages/home/home_widget.dart';

import 'package:vita/pages/login/login_auth.dart';
import './pages/analytics/analytics_checkbox.dart';

//Referenced https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//for bottom navigation bar

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.onSignedOut}): super(key:key);

  final loginAuthImplement auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [
      new Home(),
      new AddInformation(auth:widget.auth),
      new analytics_checkbox(),
      new InboxScreen(),
    ];

    final List<String> _children_name = [
      "Home",
      "Add",
      "Analytics",
      "Messaging",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Vita'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new account(auth:widget.auth, onSignedOut:widget.onSignedOut)));},
          ),
        ],
      ),

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            backgroundColor: ThemeColors.darkGreen,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline),
            title: new Text('Add'),
            backgroundColor: ThemeColors.darkGreen,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_chart),
            title: new Text('Analytics'),
            backgroundColor: ThemeColors.darkGreen,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mobile_screen_share),
            title: new Text('Share'),
            backgroundColor: ThemeColors.darkGreen,
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
