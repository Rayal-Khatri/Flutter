import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'recordtype.dart';
import 'models/record_model.dart';

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  late SharedPreferences _prefs;
  String _selectedRecordType = '';
  String _notes = '';
  DateTime? _administrationDate;
  TimeOfDay _administrationTime =
      TimeOfDay(hour: 7, minute: 0); // Default time is set to 7:00 AM

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a record'),
        backgroundColor: Color(0xFF6200EE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _navigateToRecordType(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedRecordType.isEmpty
                            ? 'Record type'
                            : _selectedRecordType,
                        style: TextStyle(
                          color: _selectedRecordType.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  _notes = value;
                },
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Notes',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    // Disable time picker
                    initialDatePickerMode: DatePickerMode.day,
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _administrationDate = selectedDate;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _administrationDate == null
                            ? 'Administration date'
                            : '${_administrationDate!.day}/${_administrationDate!.month}/${_administrationDate!.year}', // Display only date
                        style: TextStyle(
                          color: _administrationDate == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      Icon(Icons.calendar_today, size: 16.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: _administrationTime,
                  );
                  if (selectedTime != null) {
                    setState(() {
                      _administrationTime = selectedTime;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _administrationTime.format(context),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.access_time, size: 16.0),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    RecordModel record = RecordModel(
                      recordType: _selectedRecordType,
                      notes: _notes,
                      administrationDate: _administrationDate,
                      administrationTime: _administrationTime,
                    );
                    _saveRecord(record);
                    Navigator.pop(context, record); // Return the record
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF9800),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRecordType(BuildContext context) async {
    final selectedRecordType = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordType(
          onSelectRecordType: (recordType) {
            setState(() {
              _selectedRecordType = recordType;
            });
          },
        ),
      ),
    );
    if (selectedRecordType != null) {
      setState(() {
        _selectedRecordType = selectedRecordType;
      });
    }
  }

  Future<void> _saveRecord(RecordModel record) async {
    final int lastIndex = _prefs.getInt('lastIndex') ?? 0;
    final int newIndex = lastIndex + 1;

    await _prefs.setString('recordType$newIndex', record.recordType);
    await _prefs.setString('notes$newIndex', record.notes);
    if (record.administrationDate != null) {
      await _prefs.setString(
          'administrationDate$newIndex', record.administrationDate.toString());
    }
    if (record.administrationTime != null) {
      await _prefs.setString(
          'administrationTime$newIndex', record.administrationTime.toString());
    }

    await _prefs.setInt('lastIndex', newIndex);
  }
}
