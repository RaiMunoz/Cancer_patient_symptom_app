import 'package:flutter/material.dart';

import '../../../assets/theme/theme.dart';
import 'sleep_button.dart';
import 'package:vita/pages/login/login_auth.dart';

class diary_sleep extends StatefulWidget {
 // diary_sleep();
  diary_sleep({Key key, this.auth}): super(key:key);

  final loginAuthImplement auth;
  @override
  _diary_sleep createState() => new _diary_sleep();
}

class _diary_sleep extends State<diary_sleep> {
  void submit_sleep() {
    print('Sleep submitted');
  }

  @override
  Widget build(BuildContext context) {
    sleep_button button = new sleep_button(auth:widget.auth);

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Sleep'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            submit_sleep(); // button.submit();
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Container(
        child: button,
        color: ThemeColors.grey2,
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
