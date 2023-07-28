import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'Screen/predictions.dart';
import 'load_dataset.dart';
import 'package:symptom_analysis/Widget/Heading_text.dart';
import 'package:symptom_analysis/Widget/symptom_dropdown.dart';
import 'package:symptom_analysis/Widget/symptom_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> symptoms = [];
  List<String> selectedSymptoms = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadSymptoms();
  }

  Future<void> loadSymptoms() async {
    List<String> loadedSymptoms = await loadDataset();
    setState(() {
      symptoms = loadedSymptoms;
      symptoms = symptoms.toSet().toList(); // Filter out repeating symptoms
    });
  }

  void onRemoveSymptom(String symptom) {
    setState(() {
      selectedSymptoms.remove(symptom);
    });
  }

  void predictDiseases() async {
    setState(() {
      isLoading = true;
    });

    final jsonData = {
      "test_data": [selectedSymptoms.join(', ')],
    };
    final jsonString = jsonEncode(jsonData);

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/Predict/'),
        body: jsonString,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PredictionScreen(predictions: responseData),
          ),
        );
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Analysis'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SymptomsTitle(
              text: "The Symptoms Are:",
            ),
            SizedBox(height: 8.0),
            SymptomDropdown(
              hint: 'Select Symptoms',
              value: null,
              symptoms: symptoms,
              onChanged: (String? selectedSymptom) {
                setState(() {
                  if (selectedSymptom != null) {
                    if (!selectedSymptoms.contains(selectedSymptom)) {
                      selectedSymptoms.add(selectedSymptom);
                    }
                  }
                });
              },
            ),
            SizedBox(height: 16.0),
            SymptomsTitle(text: "Selected Symptoms:"),
            SizedBox(height: 8.0),
            selectedSymptoms.isNotEmpty
                ? SymptomList(
                    selectedSymptoms: selectedSymptoms,
                    onRemove: onRemoveSymptom,
                  )
                : Text('No symptoms selected'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedSymptoms.isNotEmpty) {
            predictDiseases();
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Please enter a symptom'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: isLoading ? CircularProgressIndicator() : Icon(Icons.check),
      ),
    );
  }
}
