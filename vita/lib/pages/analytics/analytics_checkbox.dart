import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './analytics_diary_button.dart';
import '../../placeholder_widget.dart';
import '../../assets/constants/symptoms.dart';
import './checkbox_button.dart';

class analytics_checkbox extends StatefulWidget {
  analytics_checkbox();

  @override
  _analytics_checkbox createState() => new _analytics_checkbox();
}

class _analytics_checkbox extends State<analytics_checkbox> {
  List<entry_button_generic> all_symptoms = <entry_button_generic>[];


  @override
  Widget build(BuildContext context) {
    if(all_symptoms.length == 0) {
      for(int i = 0; i < symptoms.length; i++) {
        all_symptoms.add(entry_button_generic(title: symptoms[i], checkValue:false));
        };
      }

    // TODO: find a more efficient way to do this b/c list casting doens't work
    List<Widget> scroll_children = [];
    scroll_children.add(
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(5.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: ThemeColors.orange,
        ),
        child: FlatButton(
          //color: ThemeColors.orange,
          child: entry_title("Make charts"),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => PlaceholderWidget(ThemeColors.orange)),
            );
          },
        )
      ),
    );
    for(int i = 0; i < all_symptoms.length; i++) {
      scroll_children.add(all_symptoms[i]);
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('Chart my Symptoms'),
        centerTitle: true,
        leading: IconButton(
          icon: BackButtonIcon(),
          onPressed: () {
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