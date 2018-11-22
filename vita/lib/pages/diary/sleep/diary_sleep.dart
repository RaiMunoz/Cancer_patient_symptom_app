import 'package:flutter/material.dart';

import 'sleep_button.dart';

class diary_sleep extends StatefulWidget {
  diary_sleep();

  @override
  _diary_sleep createState() => new _diary_sleep();
}

class _diary_sleep extends State<diary_sleep> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sleep'),
        centerTitle: true,
      ),
      body: sleep_button(),
    );
  }
}
