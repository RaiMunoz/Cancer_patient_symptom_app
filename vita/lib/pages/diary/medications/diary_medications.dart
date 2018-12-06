import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'medication_button.dart';
import 'medication.dart';
import '../../../assets/constants/medications.dart';

class diary_medications extends StatefulWidget {
  diary_medications();

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
        ));
      }
    }

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
          return all_medications[i];
        },
        itemCount: meds.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
