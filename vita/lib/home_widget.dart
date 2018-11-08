import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';

import 'placeholder_widget.dart';

import 'pages/profile/account.dart';
import 'pages/diary/diary_main.dart';
import 'pages/messaging/main_message.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  File _image;

  Future getImage() async{
    File image= await ImagePicker.pickImage(source:ImageSource.camera);
    Directory tmp_path= await getApplicationDocumentsDirectory();
    final String path = tmp_path.path;
    final File newImage = await image.copy('$path/image1.png');

    setState((){
      _image= newImage;
    });

  }


  final List<Widget> _children = [
    new account(),
    //PlaceholderWidget(Colors.white),
    //PlaceholderWidget(Colors.deepOrange),
    new diary_main(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.purple),
    new ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('Vita'),
          leading: IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              getImage();
              //_appDocumentsDirectory= getApplicationDocumentsDirectory();
              //path= _appDocumentsDirectory.path;
              //new_image = _image.copy('$path/image1.png')

              // do something
            },
          )
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