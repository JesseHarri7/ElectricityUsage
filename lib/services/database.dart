import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/MeterReading.dart';

class Database {

  static String COLLECTION = "meterReadings";

  static insert(MeterReading meterReading) async {
    FirebaseFirestore.instance
        .collection(COLLECTION)
        .add(meterReading.toMap());
  }

  static Future<List<QueryDocumentSnapshot<Object?>>> readDocuments() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(COLLECTION).get();
    return snapshot.docs;
  }

  static update(MeterReading meterReading) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION)
        .doc(meterReading.id)
        .update(meterReading.toMap())
        .then((_) {
          print('Successfully updated document with ID: ' + meterReading.id);
        }).catchError((error) {
          print('Error updating document:' + error);
        });
  }

  static delete(MeterReading meterReading) async {
    await FirebaseFirestore.instance
        .collection(COLLECTION)
        .doc(meterReading.id)
        .delete().then((_) {
          print('Successfully deleted document with ID: ' + meterReading.id);
        }).catchError((error) {
          print('Error deleting document: $error');
        });
  }

}