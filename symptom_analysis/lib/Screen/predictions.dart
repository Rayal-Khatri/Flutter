import 'package:flutter/material.dart';

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
          final prediction = predictions[index]['Predictions'];
          final diseaseWidgets = prediction.map<Widget>((p) {
            final disease = p['Disease'];
            final accuracy = p['Accuracy'];
            return ListTile(
              title: Text('Disease: $disease'),
              subtitle: Text('Accuracy: $accuracy'),
            );
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Prediction ${index + 1}:'),
              ),
              ...diseaseWidgets,
              Divider(),
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
