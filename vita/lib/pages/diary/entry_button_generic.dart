import 'package:flutter/material.dart';

import '../../assets/theme/theme.dart';

class entry_button_generic extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final ValueChanged<bool> action;

  const entry_button_generic({Key key, this.title, this.children, this.action}): super(key: key);

  @override
  _entry_button_generic createState() => new _entry_button_generic();
}

class _entry_button_generic extends State<entry_button_generic> {
  @override
  Widget build(BuildContext) {
    final button_color = ThemeColors.lightGreen;
    final no_borders = Theme.of(context).copyWith(dividerColor: button_color);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: button_color,
      ),
      child: Theme(
        data: no_borders,
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          children: widget.children,
          onExpansionChanged: widget.action,
          trailing: Icon(Icons.add_circle),
        ),
      ),
    );
  }
}