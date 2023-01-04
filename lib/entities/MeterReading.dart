
import 'package:cloud_firestore/cloud_firestore.dart';

class MeterReading {

  late String id;

  final Timestamp date;
  final int units;
  final int amountSpent;
  final int kWhRecharged;

  MeterReading({required this.date, required this.units, required this.amountSpent, required this.kWhRecharged, required this.id});

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'date': date,
      'units': units,
      'amountSpent': amountSpent,
      'kWhRecharged': kWhRecharged,
    };
  }

  static MeterReading fromMap(QueryDocumentSnapshot<Object?> query) {
    return MeterReading(
        id: query.id,
        date: query.get('date'),
        units: query.get('units'),
        amountSpent: query.get('amountSpent'),
        kWhRecharged: query.get('kWhRecharged')
    );
  }

}