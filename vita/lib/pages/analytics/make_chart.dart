//Example From https://google.github.io/charts/flutter/example/line_charts/dash_pattern.html


/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'dart:math';

class make_chart extends StatefulWidget {
  final String symptomName;
  final List<charts.Series> seriesList;

  make_chart({Key key, this.symptomName, this.seriesList}): super(key: key);

  @override
  _make_chart createState() => new _make_chart();
}

class _make_chart extends State<make_chart> {


  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 425.0,
      padding: EdgeInsets.only(left:5.0, right:5.0, bottom:35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(widget.symptomName,
              style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 1.5,
              color: ThemeColors.grey4,
              fontWeightDelta: 1,
              ),
            ),
          ),
          Container(
            height: 350.0,
            child: charts.TimeSeriesChart(
              widget.seriesList,
              animate: false,
            ),
          ),
        ],
      ),
    );
  }

}

List<charts.Series<TimeSeriesSales, DateTime>> createSampleData() {
  /// Create one series with random data.
  var rng = new Random();
  final data = [
    new TimeSeriesSales(new DateTime(2017, 9, 19), rng.nextInt(5)+1),
    new TimeSeriesSales(new DateTime(2017, 9, 26), rng.nextInt(5)+1),
    new TimeSeriesSales(new DateTime(2017, 10, 3), rng.nextInt(5)+1),
    new TimeSeriesSales(new DateTime(2017, 10, 10), rng.nextInt(5)+1),
  ];

  return [
    new charts.Series<TimeSeriesSales, DateTime>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (TimeSeriesSales sales, _) => sales.time,
      measureFn: (TimeSeriesSales sales, _) => sales.sales,
      data: data,
      )
  ];
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
