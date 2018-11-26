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
        fontSizeFactor: 1.25,
        color: ThemeColors.white,
        fontWeightDelta: 1,
      ),
    );
  }
}

class entry_button_generic extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final ValueChanged<bool> action;

  const entry_button_generic({Key key, this.title, this.children, this.action}): super(key: key);

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
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: button_color,
      ),
      child: Theme(
        data: no_borders,
        child: ExpansionTile(
          title: widget.title, /*Text(
            widget.title,
            style: entry_button_title_style(context),
          ),*/
          children: widget.children,
          onExpansionChanged: widget.action,
          trailing: Icon(Icons.add_circle),
        ),
      ),
    );
  }
}

class entry_text_field extends StatefulWidget {
  final String title;
  final FormFieldSetter<String> saved;
  final TextInputType keyboard;

  const entry_text_field({Key key, this.title, this.saved, this.keyboard = TextInputType.text}): super(key: key);

  @override
  _entry_text_field createState() => new _entry_text_field();
}

class _entry_text_field extends State<entry_text_field> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.3,
      margin: EdgeInsets.symmetric(horizontal: width * 0.1),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: ThemeColors.darkGreen,
      ),
      alignment: Alignment(0.0, 0.0),
      child: new TextFormField(
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle: TextStyle(
            color: ThemeColors.white,
          ),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: ThemeColors.white),
        keyboardType: widget.keyboard,
        onSaved: widget.saved,
      ),
    );
  }
}