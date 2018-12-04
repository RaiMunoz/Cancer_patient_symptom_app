import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import '../../placeholder_widget.dart';
import '../../assets/constants/symptoms.dart';
import './checkbox_button.dart';
import './make_all_charts.dart';

class analytics_checkbox extends StatefulWidget {
  analytics_checkbox();

  @override
  _analytics_checkbox createState() => new _analytics_checkbox();
}

class _analytics_checkbox extends State<analytics_checkbox> {
  List<entry_button_generic> all_symptoms = <entry_button_generic>[];
  List<bool> all_checks = <bool>[];
  List<String> all_names = <String>[];

  callback(newCheckVal, childTitle) {
    for(int i = 0; i < symptoms.length; i++) {
      if (all_names[i] == childTitle) {
        setState(() {
          all_checks[i] = newCheckVal;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    if(all_symptoms.length == 0) {
      for(int i = 0; i < symptoms.length; i++) {
        all_checks.add(false);
        all_symptoms.add(entry_button_generic(title: symptoms[i], checkValue:all_checks[i], callback: callback));
        all_names.add(symptoms[i]);
      };
    }

    // TODO: find a more efficient way to do this b/c list casting doens't work
    List<Widget> scroll_children = [];
    List<bool> scroll_children_checkValue = [];
    List<String> scroll_children_name = [];

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
          child: entry_title("Make charts"),
          onPressed: () {
            print(scroll_children_name.toString());
            print(all_checks.toString());
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => make_all_charts(fullSymptomNames: scroll_children_name, fullCheckValueList: all_checks,)),
            );
          },
        )
      ),
    );

    for(int i = 0; i < all_symptoms.length; i++) {
      scroll_children.add(all_symptoms[i]);
      scroll_children_checkValue.add(all_checks[i]);
      scroll_children_name.add(symptoms[i]);
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('Chart my Symptoms'),
        centerTitle: true,
        backgroundColor: ThemeColors.darkGreen,
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