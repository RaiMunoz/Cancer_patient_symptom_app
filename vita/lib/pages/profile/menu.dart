import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './pages/personal_settings/personal_settings_widget.dart';
import './pages/notification_settings/notification_settings_widget.dart';
import './pages/help/help_widget.dart';
import 'package:vita/pages/login/login_auth.dart';

class menu extends StatefulWidget {
  menu({Key key, this.auth, this.onSignedOut}): super(key:key);

  final loginAuthImplement auth;
  final VoidCallback onSignedOut;

  @override
  _menu createState() => _menu();
}

class _menu extends State<menu> {

  void _signOut(BuildContext context) async{
    try
    {
      await widget.auth.signOut();
      widget.onSignedOut();
      Navigator.pop(context);
    }
    catch(e)
    {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: const BoxConstraints(maxHeight: 240.0),
      child: new ListView(
        padding: const EdgeInsets.only(left: 5.0),
        children: <Widget>[
          _buildListItem("Personal Settings", Icons.settings, MaterialPageRoute(builder: (context) => new personalSettings()), context),
          _buildListItem("Notification Settings", Icons.notifications, MaterialPageRoute(builder: (context) => new notifSettings()), context),
          _buildListItem("Help", Icons.help, MaterialPageRoute(builder: (context) => new help()), context),
          _buildPowerOffItem("Log Out", Icons.power_settings_new, context),
        ],
      ),
    );
  }


  Widget _buildListItem(String title, IconData iconData, MaterialPageRoute nextScreen, BuildContext context) {
    final textStyle = new TextStyle(
        color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.w600);

    return new InkWell(
      onTap: () {Navigator.push(context, nextScreen);},
      child: new Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(
                color: ThemeColors.lightGreen,
                borderRadius: new BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              child: new Icon(iconData, color: Colors.white, size: 24.0),
            ),
            new Text(title, style: textStyle),
            new Expanded(child: new Container()),
            new IconButton(
              icon: new Icon(Icons.chevron_right, color: Colors.black26),
              onPressed: () {Navigator.push(context, nextScreen);},)
          ],
        ),
      ),
    );
  }

  Widget _buildPowerOffItem(String title, IconData iconData, BuildContext context) {
    final textStyle = new TextStyle(
        color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.w600);

    return new InkWell(
      onTap: () {_signOut(context);},
      child: new Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(
                color: ThemeColors.lightGreen,
                borderRadius: new BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              child: new Icon(iconData, color: Colors.white, size: 24.0),
            ),
            new Text(title, style: textStyle),
            new Expanded(child: new Container()),
            new IconButton(
              icon: new Icon(Icons.chevron_right, color: Colors.black26),
              onPressed: () {
                _signOut(context);
              },
            )
          ],
        ),
      ),
    );
  }

}