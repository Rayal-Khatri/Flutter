import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
          // Convert selected symptoms to a single string separated by commas
          final jsonData = {
            "test_data": [selectedSymptoms.join(', ')],
          };
          final jsonString = jsonEncode(jsonData);

          print(jsonString); // Print the JSON payload

          // Send the JSON payload to the API endpoint
          http.post(
            Uri.parse('http://127.0.0.1:8000/Predict/'),
            body: jsonString,
            headers: {
              'Content-Type': 'application/json',
            },
          ).then((response) {
            // Handle the response here
            if (response.statusCode == 200) {
              // Success
              final responseData = jsonDecode(response.body);
              print(responseData); // Print the obtained result
              // Process the response data
            } else {
              // Failed
              // Handle error
            }
          });
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
