import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_usage/entities/MeterReading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/database.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController unitsController = TextEditingController();
  TextEditingController amountSpentController = TextEditingController();
  TextEditingController kWhRechargedController = TextEditingController();
  late DateTime selectedDate;

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    unitsController.dispose();
    amountSpentController.dispose();
    kWhRechargedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MeterReading? meterReading = null;
    try {
      meterReading = ModalRoute
          .of(context)
          ?.settings
          .arguments as MeterReading;
    }catch (e){
      print("This is null but ignore it");
    }

    var widgetText = 'Add Meter Reading';

    if (meterReading != null) {
      dateController.text = meterReading.date.toDate().toString();
      unitsController.text = meterReading.units.toString();
      amountSpentController.text = meterReading.amountSpent.toString();
      kWhRechargedController.text = meterReading.kWhRecharged.toString();

      widgetText = 'Update User';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetText),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: "Select a date",
                    ),
                    onTap: selectDate, // call the _selectDate function when the text field is tapped
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: unitsController,
                    decoration: InputDecoration(labelText: 'Units'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountSpentController,
                    decoration: InputDecoration(labelText: 'Amount Spent'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: kWhRechargedController,
                    decoration: InputDecoration(labelText: 'kWh recharged'),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
              child: ElevatedButton(
                child: Text(widgetText),
                onPressed: () {
                  if (meterReading != null) {
                    updateUser(meterReading);
                  } else {
                    insertUser();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  insertUser() async {

    final meterReading = MeterReading(
      id: "",
      date: Timestamp.fromDate(DateTime.parse(dateController.text)),
      units: int.parse(unitsController.text),
      amountSpent: int.parse(amountSpentController.text),
      kWhRecharged: int.parse(kWhRechargedController.text),
    );

    await Database.insert(meterReading);
    Navigator.pop(context);
  }

  updateUser(MeterReading meterReading) async {
    print('updating: ${dateController.text}');
    final u = MeterReading(
      id: meterReading.id,
      date: Timestamp.fromDate(DateTime.parse(dateController.text)),
      units: int.parse(unitsController.text),
      amountSpent: int.parse(amountSpentController.text),
      kWhRecharged: int.parse(kWhRechargedController.text),
    );
    await Database.update(u);
    Navigator.pop(context);
  }

  selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2060),
    );

    if (picked != null) {
      // dateController.text = DateFormat.yMMMd().format(picked);
      // dateController.text = DateFormat.yMd().format(picked);
      dateController.text = picked.toString();

      setState(() {
        selectedDate = picked;
      });
    }
  }
}