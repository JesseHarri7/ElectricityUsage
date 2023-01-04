import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../components/simple_time_graph.dart';
import '../entities/MeterReading.dart';

class SimpleTimeSeriesChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MeterReading>? meterReading = null;
    try {
      meterReading = ModalRoute
          .of(context)
          ?.settings
          .arguments as List<MeterReading>;
    }catch (e){
      print("This is null but ignore it");
    }

    print(meterReading);

    return Scaffold(
      appBar: AppBar(
        title: Text('Time x units'),
      ),
      body: Padding(
              padding: const EdgeInsets.all(20.0),
              /*child: charts.TimeSeriesChart(
                SimpleTimeSeriesChart.withSampleData().seriesList,
                animate: SimpleTimeSeriesChart.withSampleData().animate,
              ),*/
              child: charts.TimeSeriesChart(
                SimpleTimeSeriesChart.createUnitGraph(meterReading).seriesList,
                animate: SimpleTimeSeriesChart.createUnitGraph(meterReading).animate,
              ),
            ),
    );
  }
}