import 'package:flutter/material.dart';
import 'addrecords.dart';
import 'models/record_model.dart';
import 'widgets/record_list_item.dart';

class AlarmListScreen extends StatefulWidget {
  const AlarmListScreen({Key? key}) : super(key: key);

  @override
  _AlarmListScreenState createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  List<RecordModel> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Alarm'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/dog_icon.jpeg', // Replace with your image path
                          width: 200,
                          height: 128,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bella',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                                '${dataList.length} record${dataList.length != 1 ? 's' : ''}'),
                            SizedBox(height: 4),
                            Text(
                                '1 reminder'), // Assuming there's always 1 reminder for now
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _navigateToAddRecord();
                          },
                          child: Text('+ Add record'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF9800), // Set the button color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Upcoming reminders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return RecordListItem(record: dataList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToAddRecord() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddRecord()),
    );
    if (result != null) {
      setState(() {
        dataList.add(result);
      });
    }
  }
}
