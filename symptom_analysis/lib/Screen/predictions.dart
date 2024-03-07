import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:symptom_analysis/Widget/Heading_text.dart';

class PredictionScreen extends StatelessWidget {
  final List<dynamic> predictions;

  PredictionScreen({required this.predictions});

  @override
  Widget build(BuildContext context) {
    print(predictions); // Print predictions in the terminal

    return Scaffold(
      appBar: AppBar(
        title: Text('Predictions'),
      ),
      body: ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          final disease = prediction['Disease'];
          final accuracy = prediction['Probability'];
          final accuracyPercentage = (accuracy * 100).toStringAsFixed(1);

          return Column(
            children: [
              ListTile(
                title: SymptomsTitle(text: "$disease :"),
              ),
              CircularPercentIndicator(
                radius: 200,
                lineWidth: 25,
                backgroundColor: Color.fromARGB(255, 122, 179, 232),
                percent: accuracy, // Ensure accuracy is between 0 and 1
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "$accuracyPercentage%", // Display the percentage with % symbol
                  style: TextStyle(fontSize: 45, color: Colors.blue),
                ),
                progressColor: Colors.blue[700],
                animation: true,
                animationDuration: 1000,
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
