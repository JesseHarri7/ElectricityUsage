import 'package:electricity_usage/pages/SimpleTimeSeriesChartExample.dart';
import 'package:electricity_usage/pages/add_meterReading_page.dart';
import 'package:electricity_usage/pages/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:electricity_usage/pages/home.dart';

import 'firebase_options.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    return MaterialApp(
      home: Home(),
      routes: {
        // '/home' : (context) => Home(),
        '/add' : (context) => AddMeterReadingPage(),
        '/chart' : (context) => SimpleTimeSeriesChartExample(),
      },
    );

    /*WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    runApp(MaterialApp(
      //initialRoute: '/home',
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/add' : (context) => AddUserPage(),
      },
    ));*/
  }
  
}