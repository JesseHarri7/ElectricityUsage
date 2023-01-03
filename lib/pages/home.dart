import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../components/user_card.dart';
import '../entities/MeterReading.dart';
import '../services/database.dart';
import 'add_user_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: Database.readDocuments(),
        builder: (context, AsyncSnapshot<List<QueryDocumentSnapshot<Object?>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Something went wrong, try again.',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Electricity Usage'),
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserCard(
                        meterReading: MeterReading.fromMap(snapshot.data![index]),
                        onTapDelete: () async {
                          _deleteUser(MeterReading.fromMap(snapshot.data![index]));
                        },
                        onTapEdit: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AddUserPage();
                              },
                              settings: RouteSettings(
                                arguments: MeterReading.fromMap(snapshot.data![index]),
                              ),
                            ),
                          ).then((value) => setState(() {}));
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data?.length,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.pushNamed(context, '/add').then((value) => setState(() {}));
                    });
                  },
                  child: Icon(Icons.add),
                ),
              );
            }
          }
        });
  }

  _deleteUser(MeterReading meterReading) async {
    await Database.delete(meterReading);
    setState(() {});
  }
}
