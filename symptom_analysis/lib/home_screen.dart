import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
  bool isLoading = false; // Add isLoading variable

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

  void predictDiseases() async {
    setState(() {
      isLoading = true; // Set isLoading to true when starting prediction
    });

    final jsonData = {
      "test_data": [selectedSymptoms.join(', ')],
    };
    final jsonString = jsonEncode(jsonData);

    print(jsonString); // Print the JSON payload

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
        print(responseData); // Print the obtained result

        // Navigate to the PredictionScreen with the obtained predictions
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
        isLoading = false; // Set isLoading to false when prediction is complete
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
                ? SymptomList(selectedSymptoms: selectedSymptoms)
                : Text('No symptoms selected'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          predictDiseases(); // Call the predictDiseases method when button is pressed
        },
        child: isLoading ? CircularProgressIndicator() : Icon(Icons.check),
      ),
    );
  }
}
