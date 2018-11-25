import 'package:flutter/material.dart';

import '../../../assets/theme/theme.dart';
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
      body: Container(
        child: sleep_button(),
        color: ThemeColors.grey2,
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
