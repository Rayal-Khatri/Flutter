import 'package:flutter/material.dart';

class RecordModel {
  final String recordType;
  final String notes;
  final DateTime? administrationDate;
  final TimeOfDay? administrationTime;

  RecordModel({
    required this.recordType,
    required this.notes,
    this.administrationDate,
    this.administrationTime,
  });
}
