import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/MeterReading.dart';

class SimpleTimeSeriesChart {
  final List<charts.Series<MeterReading, DateTime>> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {required this.animate});

  factory SimpleTimeSeriesChart.createUnitGraph(List<MeterReading>? meterReadingData) {
    return SimpleTimeSeriesChart(
      unitData(meterReadingData!),
      animate: true,
    );
  }

  static List<charts.Series<MeterReading, DateTime>> unitData(List<MeterReading> meterReadingData) {
    return [
      charts.Series<MeterReading, DateTime>(
        id: 'Meter Reading',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MeterReading reading, _) => reading.date.toDate(),
        measureFn: (MeterReading reading, _) => reading.units,
        data: meterReadingData,
      )
    ];
  }

  factory SimpleTimeSeriesChart.withSampleData() {
    return SimpleTimeSeriesChart(
      _createSampleData(),
      animate: true,
    );
  }

  static List<charts.Series<MeterReading, DateTime>> _createSampleData() {
    DateTime date1 = DateTime.utc(2022, 12, 20);
    DateTime date2 = DateTime.utc(2022, 12, 21);
    DateTime date3 = DateTime.utc(2022, 12, 22);
    DateTime date4 = DateTime.utc(2022, 12, 23);

    final data = [
      new MeterReading(id: "", date: Timestamp.fromDate(date1), units: 50, amountSpent: 100, kWhRecharged: 50),
      new MeterReading(id: "", date: Timestamp.fromDate(date2), units: 60, amountSpent: 200, kWhRecharged: 100),
      new MeterReading(id: "", date: Timestamp.fromDate(date3), units: 30, amountSpent: 300, kWhRecharged: 120),
      new MeterReading(id: "", date: Timestamp.fromDate(date4), units: 60, amountSpent: 400, kWhRecharged: 150),
    ];

    return [
      charts.Series<MeterReading, DateTime>(
        id: 'Meter Reading',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MeterReading reading, _) => reading.date.toDate(),
        measureFn: (MeterReading reading, _) => reading.units,
        data: data,
      )
    ];
  }
}