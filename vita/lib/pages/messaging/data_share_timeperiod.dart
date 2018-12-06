import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './contact_button.dart';
//import '../../assets/constants/contacts.dart';
import 'package:vita/pages/profile/profile_info.dart';
import './data_share_addmessage.dart';
import './data_share_sent.dart';


class data_share_timeperiod extends StatefulWidget {

  final List<bool> fullCheckValueList;
  final List<String> fullContactNames;

  const data_share_timeperiod({Key key, this.fullContactNames, this.fullCheckValueList}): super(key: key);

  @override
  _data_share_timeperiod createState() => new _data_share_timeperiod();
}

class _data_share_timeperiod extends State<data_share_timeperiod> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        //title: Text('Over what time period would you like to share your data?'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            setState(() {
              Navigator.maybePop(context);
            });
          }
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Next'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                setState(() {
                  Navigator.push(data_share_sent());
                });
              }
            ),
          ]
        ),
      ),
    );
  }
}