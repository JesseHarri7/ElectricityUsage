import 'package:electricity_usage/pages/SimpleTimeSeriesChartExample.dart';
import 'package:electricity_usage/pages/add_user_page.dart';
import 'package:electricity_usage/pages/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:electricity_usage/pages/home.dart';

import 'firebase_options.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    return MaterialApp(
      home: Home(),
      routes: {
        // '/home' : (context) => Home(),
        '/add' : (context) => AddUserPage(),
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