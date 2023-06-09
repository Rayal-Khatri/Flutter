import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(SymptomAnalysisApp());
}

class SymptomAnalysisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptom Analysis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
