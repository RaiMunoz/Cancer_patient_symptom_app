import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './analytics_diary_button.dart';
import '../../placeholder_widget.dart';
import './analytics_checkbox.dart';

class AnalyticsStartScreen extends StatefulWidget {
  @override
  _AnalyticsStartScreen createState() =>
      new _AnalyticsStartScreen();
}

class _AnalyticsStartScreen extends State<AnalyticsStartScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      color: ThemeColors.grey1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiaryButton('Press to start charting', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => analytics_checkbox()),
                  );
                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}