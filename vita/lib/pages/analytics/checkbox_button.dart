import 'package:flutter/material.dart';

import '../../assets/theme/theme.dart';

class entry_title extends StatelessWidget {
  final String title;

  entry_title(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: DefaultTextStyle.of(context).style.apply(
        fontSizeFactor: 1.35,
        color: ThemeColors.white,
        fontWeightDelta: 1,
      ),
    );
  }
}

class entry_button_generic extends StatefulWidget {
  final String title;
  bool checkValue;
  Function(bool,String) callback;

  entry_button_generic({Key key, this.title, this.checkValue, this.callback}): super(key: key);

  @override
  _entry_button_generic createState() => new _entry_button_generic();
}

class _entry_button_generic extends State<entry_button_generic> {
  @override
  Widget build(BuildContext) {
    var button_color = ThemeColors.lightGreen;
    var no_borders = Theme.of(context).copyWith(dividerColor: button_color);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.08,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: button_color,
      ),
      child: FlatButton(
        onPressed: () {
          setState(() {
            widget.checkValue = !widget.checkValue;
            widget.callback(widget.checkValue, widget.title);
          });
        },
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                child: Padding(
                  padding: new EdgeInsets.only(left:15.0, right:10.0),
                  child: Container(
                    child: entry_title(widget.title),
                    width: 130.0,
                  ),
                ),
              ),
              Expanded(
                //height:250.0,
                //alignment: Alignment.centerRight,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Checkbox(
                    value: widget.checkValue,
                    onChanged: (bool value) {
                      setState(() {
                        widget.checkValue = value;
                        widget.callback(widget.checkValue, widget.title);
                      });
                    },
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
