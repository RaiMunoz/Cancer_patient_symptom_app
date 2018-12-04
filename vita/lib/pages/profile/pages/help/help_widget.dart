import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './video.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'Video Example',
      child: VideoExample(),
    );*/
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Help Video'),
      ),
      body: Video(),
    );
  }
}

