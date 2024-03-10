import 'package:flutter/material.dart';
import 'record_model.dart';
import 'constants.dart';

class RecordListItem extends StatelessWidget {
  final RecordModel record;

  const RecordListItem({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.notifications_active, color: primaryColor),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.recordType,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${record.notes} - ${record.administrationDate?.day}/${record.administrationDate?.month}/${record.administrationDate?.year} at ${record.administrationTime?.format(context)}',
                    ),
                  ],
                ),
              ),
              Text(
                'Upcoming',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
