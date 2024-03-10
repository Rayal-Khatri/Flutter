// import 'package:shared_preferences/shared_preferences.dart';
// import '../record_model.dart';
// import '../services/notification_service.dart';

// class ReminderService {
//   static const String _recordsKey = 'records';

//   Future<void> saveRecord(RecordModel record) async {
//     final prefs = await SharedPreferences.getInstance();
//     final records = await getRecords();
//     final int id = records.length + 1;
//     records.add(record.copyWith(id: id));
//     await prefs.setStringList(
//         _recordsKey, records.map((r) => r.toJson()).toList());
//     _scheduleReminder(record, id);
//   }

//   Future<List<RecordModel>> getRecords() async {
//     final prefs = await SharedPreferences.getInstance();
//     final recordsJson = prefs.getStringList(_recordsKey) ?? [];
//     return recordsJson.map((json) => RecordModel.fromJson(json)).toList();
//   }

//   Future<void> removeRecord(RecordModel record) async {
//     final prefs = await SharedPreferences.getInstance();
//     final records = await getRecords();
//     records.removeWhere((r) => r.id == record.id);
//     await prefs.setStringList(
//         _recordsKey, records.map((r) => r.toJson()).toList());
//     _cancelReminder(record.id!);
//   }

//   void _scheduleReminder(RecordModel record, int id) {
//     if (record.administrationDate != null &&
//         record.administrationTime != null) {
//       final scheduledDate = DateTime(
//         record.administrationDate!.year,
//         record.administrationDate!.month,
//         record.administrationDate!.day,
//         record.administrationTime!.hour,
//         record.administrationTime!.minute,
//       );
//       NotificationService().showNotification(
//         id,
//         record.recordType,
//         record.notes,
//         scheduledDate,
//       );
//     }
//   }

//   void _cancelReminder(int id) {
//     NotificationService().cancelNotification(id);
//   }
// }
