import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> recordedTimes = [];

  @override
  void initState() {
    super.initState();
    loadRecordedTimes();
  }

  Future<void> loadRecordedTimes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recordedTimes = prefs.getStringList('recorded_times') ?? [];
    });
  }

  Future<void> saveRecordedTimes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recorded_times', recordedTimes);
  }

  void onPressedAdd() {
    DateTime now = DateTime.now();
    String date = DateFormat.yMd().add_jm().format(now);

    setState(() {
      recordedTimes.add(date);
    });
    saveRecordedTimes();
  }

  void onPressedReset() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This will remove all recorded times.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                resetRecordedTimes();
                Navigator.of(context).pop();
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void resetRecordedTimes() {
    setState(() {
      recordedTimes.clear();
    });
    saveRecordedTimes();
  }

  void removeRecordedTime(int index) {
    setState(() {
      recordedTimes.removeAt(index);
    });
    saveRecordedTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recorded Times'),
      ),
      body: ListView.builder(
        itemCount: recordedTimes.length,
        itemBuilder: (context, index) {
          final dateTime =
              DateFormat.yMd().add_jm().parse(recordedTimes[index]);
          final formattedTime = DateFormat.jm().format(dateTime);
          final formattedDay = DateFormat('EEEE').format(dateTime);
          int displayedIndex = index + 1;

          return ListTile(
            title: Text('$displayedIndex. $formattedTime'),
            subtitle: Text(formattedDay),
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text('This will remove the recorded time.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            removeRecordedTime(index);
                            Navigator.of(context).pop();
                          },
                          child: Text('Remove'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.clear),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: onPressedReset,
            child: Icon(Icons.delete),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: onPressedAdd,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
