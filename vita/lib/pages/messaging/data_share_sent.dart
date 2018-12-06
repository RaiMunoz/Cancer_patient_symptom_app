import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './contact_button.dart';
//import '../../assets/constants/contacts.dart';
import 'package:vita/pages/profile/profile_info.dart';
import './inbox_screen.dart';

class data_share_sent extends StatefulWidget {
  @override
  _data_share_sent createState() => new _data_share_sent();
}

class _data_share_sent extends State<data_share_sent> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: ThemeColors.lightGreen,
        floatingActionButton: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              //setState(() {
                Navigator.maybePop(context);
            }
        ),
        body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child:
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('Sent!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0, color: ThemeColors.darkGreen)),
                      ),
                ),

              ]
        ),
    );
  }
}