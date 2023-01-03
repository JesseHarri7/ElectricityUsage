import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_usage/entities/MeterReading.dart';
import 'package:flutter/material.dart';

import '../services/database.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.meterReading, required this.onTapDelete, required this.onTapEdit});
  final MeterReading meterReading;
  final Function onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: const Icon(
          Icons.power,
        ),
        title: Text(convertTimestampToDateString(meterReading.date)),
        subtitle: Text(
            'Units: ${meterReading.units}\n'
                'Amount: R${meterReading.amountSpent}',
          maxLines: 2,
        ),
        isThreeLine: true,
        trailing:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Icon(Icons.edit),
              onTap: () {
                print("Trying to edit");
                onTapEdit.call();
                },
            ),
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                print("Trying to delete");
                onTapDelete.call();
              }
            ),
          ],
        ),
      ),
    );
  }

  String convertTimestampToDateString(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return "$day/$month/$year";
  }

}