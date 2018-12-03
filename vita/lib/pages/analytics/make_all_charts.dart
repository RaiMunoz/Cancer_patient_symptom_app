import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import './test_viz.dart';
import './make_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class make_all_charts extends StatefulWidget {

  final List<bool> fullCheckValueList;
  final List<String> fullSymptomNames;

  const make_all_charts({Key key, this.fullSymptomNames, this.fullCheckValueList}): super(key: key);

  @override
  _make_all_charts createState() => new _make_all_charts();
}

class _make_all_charts extends State<make_all_charts> {
  List<make_chart> all_charts = <make_chart>[];
  List<charts.Series> sampleData;

  @override
  Widget build(BuildContext context) {
    if(all_charts.length == 0) {
      for(int i = 0; i < widget.fullSymptomNames.length; i++) {
        if (widget.fullCheckValueList[i]) {
          sampleData = createSampleData();
          all_charts.add(make_chart(symptomName: widget.fullSymptomNames[i], seriesList: sampleData));
        };
      };
    }

    List<Widget> scroll_children = [];

    for(int i = 0; i < all_charts.length; i++) {
      scroll_children.add(all_charts[i]);
    }

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Charts'),
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