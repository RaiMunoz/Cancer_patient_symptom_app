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
  final ValueGetter<bool> getSubmit;

  const entry_button_generic({Key key, this.title, this.children, this.action, this.getSubmit}): super(key: key);

  @override
  _entry_button_generic createState() => new _entry_button_generic();
}

class _entry_button_generic extends State<entry_button_generic> {
  Icon collapse_expand = Icon(Icons.add_circle);
  bool submit = false;

  @override
  Widget build(BuildContext) {
    bool expanded = false;
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
          title: widget.title,
          children: widget.children,
          onExpansionChanged: (expanded) {
            widget.action(expanded);
            if(getSubmit != null) submit = widget.getSubmit();
            setState((){
              if(expanded) {
                collapse_expand = Icon(Icons.remove_circle);
              }
              else if(submit) {
                collapse_expand = Icon(Icons.check_circle);
              }
              else {
                collapse_expand = Icon(Icons.add_circle);
              }
            });
          },
          trailing: collapse_expand,
        ),
      ),
    );
  }
}

class sub_entry_container extends StatelessWidget {
  final Widget child;
  sub_entry_container({this.child});

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
      alignment: Alignment.center,
      child: child,
    );
  }
}

class entry_text_field extends StatefulWidget {
  final String title;
  final String label;
  final FormFieldSetter<String> saved;
  final TextInputType keyboard;

  const entry_text_field({Key key, this.title = '', this.label = '', this.saved,
    this.keyboard = TextInputType.text}): super(key: key);

  @override
  _entry_text_field createState() => new _entry_text_field();
}

class _entry_text_field extends State<entry_text_field> {
  @override
  Widget build(BuildContext context) {
    return sub_entry_container(
      child: new TextFormField(
        initialValue: widget.title,
        decoration: InputDecoration(
          hintText: widget.label,
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