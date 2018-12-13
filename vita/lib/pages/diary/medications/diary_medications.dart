import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'medication_button.dart';
import 'medication.dart';
import 'package:vita/pages/login/login_auth.dart';

import '../diary_info.dart';

class diary_medications extends StatefulWidget {
  diary_medications({Key key, this.auth}): super(key:key);

  final loginAuthImplement auth;

  @override
  _diary_medications createState() => new _diary_medications();
}

class _diary_medications extends State<diary_medications> {
  List<medication_button> all_medications = <medication_button>[];

  void submit_all_medications() {
    for(int i = 0; i < all_medications.length; i++) {
      all_medications[i].submitForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(all_medications.length == 0) {
      for(int i = 0; i < meds.length; i++) {
        all_medications.add(medication_button(
          title: meds[i].name,
          med: meds[i],
          custom: false,
          auth: widget.auth
        ));
      }
    }

    IconButton add_button = IconButton(
      icon: Icon(Icons.add_circle),
      iconSize: MediaQuery.of(context).size.width * 0.1,
      color: ThemeColors.darkGreen,
      padding: EdgeInsets.only(top: 5.0),
      onPressed: () {
        setState(() {
          all_medications.insert(
              all_medications.length,
              medication_button(
                title: 'New Medication: ',
                med: medication(
                  times: [],
                ),
                custom: true,
                auth: widget.auth
              ));
        });
      },
    );
    List<Widget> scroll_children = [];
    for(int i = 0; i < all_medications.length; i++) {
      scroll_children.add(all_medications[i]);
    }
    scroll_children.add(add_button);

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Track My Medications'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            submit_all_medications();
            Navigator.maybePop(context);
          }
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, int i) {
          return scroll_children[i];
        },
        itemCount: scroll_children.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
