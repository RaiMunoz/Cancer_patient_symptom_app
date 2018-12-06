import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'activity_button.dart';
import '../../../assets/constants/activities.dart';
//import '../../../assets/theme/theme.dart';
import '../entry_button_generic.dart';

class diary_activities extends StatefulWidget {
  diary_activities();

  @override
  _diary_activities createState() => new _diary_activities();
}

class _diary_activities extends State<diary_activities> {
  List<activity_button> all_activities = <activity_button>[];

  void submit_all_activities() {
    for(int i = 0; i < all_activities.length; i++) {
      all_activities[i].submitForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(all_activities.length == 0) { // get from database
      for(int i = 0; i < activities.length; i++) {
        all_activities.add(activity_button(
          title: activities[i],
          custom: false,
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
          all_activities.insert(
              all_activities.length,
              activity_button(
                title: 'New Activity: ',
                custom: true,
              ));
        });
      },
    );

    List<Widget> scroll_children = [];
    for(int i = 0; i < all_activities.length; i++) {
      scroll_children.add(all_activities[i]);
    }
    scroll_children.add(add_button);

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Activity'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
            submit_all_activities();
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
