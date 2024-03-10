import 'package:flutter/material.dart';
import 'alarm_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Alarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlarmListScreen(),
    );
  }
}
