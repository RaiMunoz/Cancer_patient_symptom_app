// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';
import 'package:logging/logging.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sensors Demo Test',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int _snakeRows = 20;
  static const int _snakeColumns = 20;
  static const double _snakeCellSize = 10.0;
  static int buffer_var = 50;

  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  double sigma = 0.5, th = 10.0, th1 = 5.0, th2 = 2.0;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  final Logger log = new Logger('MyClassName');

  double a_norm;
  int i = 0;
  int BUFF_SIZE = 20;
  List<double> window = [];
  FlutterTts flutterTts = new FlutterTts();

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        ?.toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Sensor Example Test'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Padding(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text('Accelerometer: $accelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          new Padding(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text('UserAccelerometer: $userAccelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          new Padding(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text('Gyroscope: $gyroscope'),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
        AddData(event.x, event.y, event.z);
        fallDetect();
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
  }

  void AddData(double ax, double ay, double az) {
    // TODO Auto-generated method stub
    a_norm = sqrt(ax * ax + ay * ay + az * az);
    window.add(a_norm);
    if (window.length > BUFF_SIZE) {
      window.removeAt(0);
    }
    //print("added");
  }

  void fallDetect() {
    double min = 999.0;
    double max = 0.0;
    if (buffer_var < BUFF_SIZE) {
      buffer_var = buffer_var + 1;
    }

    for (int i = 1; i < window.length; i++) {
      if (min > window[i]) {
        min = window[i];
      }
      if (max < window[i]) {
        max = window[i];
      }
    }
    //print(window);
    if ((max - min) > 5) {
      if (buffer_var >= BUFF_SIZE) {
        buffer_var = 0;
      }

      if (buffer_var == 0) {
        print("fall");
        print(" max $max");
        print(" min $min");
        speak();
        window.clear();
      }
    }
  }

  void speak() async {
    await flutterTts.speak('Ouch');
    print("that hurt");
  }

  int compute_zrc() {
    // TODO Auto-generated method stub
    int count = 0;
    for (i = 1; i <= window.length - 1; i++) {
      if ((window[i] - th) < sigma && (window[i - 1] - th) > sigma) {
        count = count + 1;
      }
    }
    return count;
  }
}
