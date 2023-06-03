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
  int savedPassengerCount = 0;
  String BusCount = "The number of passengers are: ";

  void incPassenger() {
    setState(() {
      passengerCount++; // Increment passengerCount by one
    });
  }

  void _changeBus() {
    setState(() {
      savedPassengerCount = passengerCount;
      BusCount = BusCount + passengerCount.toString() + " ";
      passengerCount = 0;
    });
  }

  void _Reset() {
    setState(() {
      BusCount = "The Number of passengers are: ";
      passengerCount = 0;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                passengerCount.toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                onPressed: incPassenger,
                child: Text('Pasenger On'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
              ElevatedButton(
                onPressed: _changeBus,
                child: Text('Change Bus'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: _Reset,
                child: Text('Reset App'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
            ]),
            Center(
              child: Text('$BusCount'),
            )
          ],
        ),
      ),
    );
  }
}
