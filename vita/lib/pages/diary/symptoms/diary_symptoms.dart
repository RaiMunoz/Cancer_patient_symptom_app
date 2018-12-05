import 'package:flutter/material.dart';

import 'symptom_button.dart';
import '../../../assets/constants/symptoms.dart';
import '../../../assets/theme/theme.dart';
import 'package:vita/pages/login/login_auth.dart';

class diary_symptoms extends StatefulWidget {
  //diary_symptoms();
  diary_symptoms({Key key, this.auth}): super(key:key);
  final loginAuthImplement auth;


  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  List<symptom_button> all_symptoms = <symptom_button>[];

  void submit_all_symptoms() {
    for(int i = 0; i < all_symptoms.length; i++) {
      all_symptoms[i].submitForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(all_symptoms.length == 0) {
      for(int i = 0; i < symptoms.length; i++) {
        all_symptoms.add(symptom_button(
          title: symptoms[i],
          custom: false,
          auth: widget.auth
        ));
      }
    }

    IconButton add_button = IconButton(
      icon: Icon(Icons.add_circle),
      iconSize: MediaQuery.of(context).size.width * 0.1,
      color: ThemeColors.lightGreen,
      padding: EdgeInsets.only(top: 5.0),
      onPressed: () {
        setState(() {
          all_symptoms.insert(
              all_symptoms.length,
              symptom_button(
                title: 'Other: ',
                custom: true,
              ));
        });
      },
    );

    // TODO: find a more efficient way to do this b/c list casting doesn't work
    List<Widget> scroll_children = [];
    for(int i = 0; i < all_symptoms.length; i++) {
      scroll_children.add(all_symptoms[i]);
    }
    scroll_children.add(add_button);

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Track My Symptoms'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            submit_all_symptoms();
            Navigator.maybePop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        itemBuilder: (context, i) => scroll_children[i],
        itemCount: scroll_children.length,
      ),
    );
  }
}
