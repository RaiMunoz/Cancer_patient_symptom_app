import 'package:flutter/material.dart';
import '../../assets/theme/theme.dart';

class DiaryButton extends StatelessWidget {
  final String title;
  final VoidCallback action;

  DiaryButton(this.title, this.action);

  @override
  Widget build(context) {
    var height = MediaQuery.of(context).size.height;
    var button_height = height * 0.125;

    return Container(
        padding: EdgeInsets.only(bottom: height / 50),
        height: button_height,
        child: RaisedButton(
          child: Text(title,
            style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 2.0,
              fontWeightDelta: 2,
              color: ThemeColors.white,
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
          color: ThemeColors.lightGreen,
          elevation: button_height / 15,
          onPressed: action,
        )
    );
  }
}