import 'dart:async';

import 'package:flutter/material.dart';

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/landing');
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
    animation = Tween(
        begin: 0.0,
        end: 200.0
    ).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
    controller.forward();
    startTime();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return new _SplashScreenState();
  }
}