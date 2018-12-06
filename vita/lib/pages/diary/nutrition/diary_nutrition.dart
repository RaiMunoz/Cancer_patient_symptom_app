import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'nutrition_button.dart';
import 'nutrition_entry.dart';
import '../../../assets/theme/theme.dart';
import '../entry_button_generic.dart';
import 'package:vita/pages/login/login_auth.dart';

import '../diary_info.dart';

class diary_nutrition extends StatefulWidget {
  diary_nutrition({Key key, this.auth}): super(key:key);
  final loginAuthImplement auth;

  @override
  _diary_nutrition createState() => new _diary_nutrition();
}

class _diary_nutrition extends State<diary_nutrition> {
  List<nutrition_button> all_nutrition = <nutrition_button>[];

  void submit_all_nutrition() {
    for(int i = 0; i < all_nutrition.length; i++) {
      all_nutrition[i].submitForm();
    }
  }
  @override
  Widget build(BuildContext context) {
    if(all_nutrition.length == 0) {
      for(int i = 0; i < meals.length; i++) {
        all_nutrition.add(nutrition_button(
          title: DateFormat.yMd().add_jm().format(meals[i].time_eaten),
          custom: false,
        ));
      }
    }

    IconButton add_button = IconButton(
      icon: Icon(Icons.add_circle),
      iconSize: MediaQuery.of(context).size.width * 0.1,
      color: ThemeColors.darkGreen,
      padding: EdgeInsets.only(
          top : 5.0),
      onPressed: () {
        setState(() {
          all_nutrition.insert(
            all_nutrition.length,
            nutrition_button(custom: true)
          );
        });
      },
    );

    List<Widget> scroll_children = [];
    for(int i = 0; i < all_nutrition.length; i++) {
      scroll_children.add(all_nutrition[i]);
    }
    scroll_children.add(add_button);

    return new Scaffold(
      appBar: AppBar(
        title: Text('Nutrition'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            submit_all_nutrition();
            Navigator.maybePop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder:
            (context, int i) {
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
