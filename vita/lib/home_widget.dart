import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';

import 'pages/profile/account.dart';
import 'pages/diary/diary_main.dart';
import 'pages/messaging/inbox_screen.dart';
import 'pages/analytics/test_viz.dart';
import 'pages/addInformation/add_information.dart';
import 'pages/home/home_widget.dart';
import 'placeholder_widget.dart';
import 'pages/diary/add_diary_entry_widget.dart';
import 'package:vita/pages/login/login_auth.dart';

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
  final List<Widget> _children = [
    new Home(),
    new diary_main(),
    new AddInformation(),
    new AnimatedPieChartExample(),
    new InboxScreen(),
  ];

  void _signOut() async{
    try
        {
          await widget.auth.signOut();
          widget.onSignedOut();
        }
     catch(e)
     {
       print(e);
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('Vita'),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _signOut();
              //_appDocumentsDirectory= getApplicationDocumentsDirectory();
              //path= _appDocumentsDirectory.path;
              //new_image = _image.copy('$path/image1.png')

              // do something
            },
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new account()));},
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
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: new Text('Diary'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline),
            title: new Text('Add'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_chart),
            title: new Text('Analytics'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            title: new Text('Message'),
            backgroundColor: Colors.blue,
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
