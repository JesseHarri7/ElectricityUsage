import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../entities/MeterReading.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    MeterReading meterReading = new MeterReading(id: "", date: Timestamp.now(), units: 10, amountSpent: 100, kWhRecharged: 50);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'id': meterReading.id,
      'date': meterReading.date,
      'units': meterReading.units,
      'amountSpent': meterReading.amountSpent,
      'kWhRecharged': meterReading.kWhRecharged,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
