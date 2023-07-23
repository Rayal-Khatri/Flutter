import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Screen/predictions.dart';
import 'load_dataset.dart';
import 'package:symptom_analysis/Widget/Heading_text.dart';
import 'package:symptom_analysis/Widget/symptom_dropdown.dart';
import 'package:symptom_analysis/Widget/symptom_list.dart';
import 'package:symptom_analysis/Widget/loading_popup.dart'; // Import the LoadingPopup widget

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
      symptoms = symptoms.toSet().toList();
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

    print(jsonString);

    try {
      showDialog(
        context: context,
        builder: (_) => LoadingPopup(), // Show the LoadingPopup
        barrierDismissible: false,
      );

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/Predict/'),
        body: jsonString,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

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
          if (selectedSymptoms.isEmpty) {
            // Show a snackbar message to enter a symptom
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please enter a symptom.'),
              ),
            );
          } else {
            predictDiseases();
          }
        },
        child: isLoading ? CircularProgressIndicator() : Icon(Icons.check),
      ),
    );
  }
}
