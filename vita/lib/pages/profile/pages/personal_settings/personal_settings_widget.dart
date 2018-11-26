import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _personalSettings extends State<personalSettings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Personal Settings'),
      ),
      body: Container(
        color: ThemeColors.grey2,
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          padding: const EdgeInsets.only(left: 5.0),
          children: <Widget>[
            _settingItem("Name", "Rai Munoz", TextInputType.text),
            _settingItem("Location", "New York", TextInputType.text),
            _settingItem("Weight", "123.45", TextInputType.number),
          ],
        ),
      ),
    );
  }

}
class personalSettings extends StatefulWidget {
  @override
  _personalSettings createState() => _personalSettings();
}

Widget _settingItem(String title, String initialValue, TextInputType keyboard) {
  final titleTextStyle = new TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

  final textboxTextStyle = new TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600);

  return Padding(padding: new EdgeInsets.all(10.0),
      child: Container(
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration (
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          color: ThemeColors.grey4
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: titleTextStyle),
            Container(
              decoration: new BoxDecoration (
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.white
              ),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                  keyboardType: keyboard,
                  maxLength: 10,
                  initialValue: initialValue,
                  style: textboxTextStyle,
              ),
            ),
          ],
      ),
    ),
  );
}