import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<dynamic>> data = [];
  List<String> symptoms = [];
  List<String> selectedSymptoms = [];

  Future<void> loadDataset() async {
    // Load dataset from CSV file
    String datasetPath = 'assets/disease_data.csv';
    String datasetContent = await rootBundle.loadString(datasetPath);
    List<List<dynamic>> csvTable = CsvToListConverter().convert(datasetContent);

    // Extract symptoms from the dataset
    List<String?> allSymptoms = [];
    for (var disease in csvTable) {
      String symptomString = disease[1].toString();
      RegExp regExp = RegExp(r"'(.*?)'");
      Iterable<Match> matches = regExp.allMatches(symptomString);
      List<String?> extractedSymptoms =
          matches.map((match) => match.group(1)).toList();
      allSymptoms.addAll(extractedSymptoms);
    }
    allSymptoms = allSymptoms.where((symptom) => symptom != null).toList();
    allSymptoms.sort();

    setState(() {
      data = csvTable;
      symptoms = allSymptoms.cast<String>();
    });
  }

  @override
  void initState() {
    super.initState();
    loadDataset();
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
            Text(
              'List of Symptoms:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              hint: Text('Select Symptoms'),
              value: null,
              onChanged: (String? selectedSymptom) {
                setState(() {
                  if (selectedSymptom != null) {
                    if (!selectedSymptoms.contains(selectedSymptom)) {
                      selectedSymptoms.add(selectedSymptom);
                    }
                  }
                });
              },
              items: symptoms.map<DropdownMenuItem<String>>((String symptom) {
                return DropdownMenuItem<String>(
                  value: symptom,
                  child: Text(symptom),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Selected Symptoms:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            selectedSymptoms.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: selectedSymptoms.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(selectedSymptoms[index]),
                        );
                      },
                    ),
                  )
                : Text('No symptoms selected'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Use the selected symptoms for machine learning or any other purpose
          // Here, we are just printing the selected symptoms
          print(selectedSymptoms);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
