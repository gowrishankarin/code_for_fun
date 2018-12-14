import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class ChartsDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChartsDemoState();
  }
}

class _ChartsDemoState extends State<ChartsDemo> {
  @override
  Widget build(BuildContext context) {
    final data = [
      new ClicksPerYear('2016', 12, Colors.red),
      new ClicksPerYear('2017', 42, Colors.yellow),
      new ClicksPerYear('2018', 12, Colors.green),
      new ClicksPerYear('2019', 12, Colors.red),
      new ClicksPerYear('2020', 42, Colors.yellow),
      new ClicksPerYear('2021', 12, Colors.green),
    ];

    var series = [
      new charts.Series(
        id: 'Clicks',
        domainFn: (ClicksPerYear clickData, _) {
          return clickData.year;
        },
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) {
          return clickData.color;
        },
        data: data,
      )
    ];

    final chart = new charts.BarChart(series, animate: true);
    final chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('You have pushed the button this many times'),
          new Text(
            'Count',
            style: Theme.of(context).textTheme.display1,
          ),
          chartWidget,
        ],
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
