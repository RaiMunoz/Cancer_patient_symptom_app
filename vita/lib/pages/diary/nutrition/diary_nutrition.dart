import 'package:flutter/material.dart';

import 'nutrition_button.dart';
import '../../../assets/theme/theme.dart';
import '../entry_button_generic.dart';

class diary_nutrition extends StatefulWidget {
  diary_nutrition();

  @override
  _diary_nutrition createState() => new _diary_nutrition();
}

class _diary_nutrition extends State<diary_nutrition> {
  List<nutrition_button> all_nutrition= <nutrition_button>[];

  void submit_all_nutrition() {
    for(int i = 0; i < all_nutrition.length; i++) {
      all_nutrition[i].submitForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    /*if(all_nutrition.length == 0) { // get from database
      for(int i = 0; i < nutrition.length; i++) {
        all_nutrition.add(activity_button(
          title: activities[i],
          custom: false,
        ));
      }
    }*/

    IconButton add_button = IconButton(
      icon: Icon(Icons.add_circle),
      iconSize: MediaQuery.of(context).size.width * 0.1,
      color: ThemeColors.darkGreen,
      padding: EdgeInsets.only(top: 5.0),
      onPressed: () {
        setState(() {
          all_nutrition.insert(
            all_nutrition.length,
            nutrition_button(custom: false)
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
