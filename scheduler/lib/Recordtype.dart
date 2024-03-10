import 'package:flutter/material.dart';

class RecordType extends StatefulWidget {
  final Function(String) onSelectRecordType;

  const RecordType({Key? key, required this.onSelectRecordType})
      : super(key: key);

  @override
  _RecordTypeState createState() => _RecordTypeState();
}

class _RecordTypeState extends State<RecordType> {
  final List<String> recordTypes = ['Bathing', 'Feeding'];
  TextEditingController _customRecordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Type'),
        backgroundColor: Color(0xFF6200EE), // Set the appbar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Record Type:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: recordTypes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recordTypes[index]),
                  onTap: () {
                    widget.onSelectRecordType(recordTypes[index]);
                    Navigator.pop(context); // Close the RecordType page
                  },
                );
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Add Custom Record Type:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _customRecordController,
              decoration: InputDecoration(
                hintText: 'Type here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String customRecord = _customRecordController.text;
                  if (customRecord.isNotEmpty) {
                    widget.onSelectRecordType(customRecord);
                    Navigator.pop(context); // Close the RecordType page
                  }
                });
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _customRecordController.dispose();
    super.dispose();
  }
}
