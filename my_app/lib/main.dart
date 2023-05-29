import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int passengerCount = 0; // Variable to store the counter value

  void incPassenger() {
    setState(() {
      passengerCount++; // Increment passengerCount by one
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Passenger Counting Apps",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Passenger Counting Apps'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                passengerCount.toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: incPassenger, child: Text('Pasenger On')),
            ElevatedButton(onPressed: () {}, child: Text('Change Bus')),
            ElevatedButton(onPressed: () {}, child: Text('Reset App')),
          ],
        ),
      ),
    );
  }
}
