import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<String>> loadDataset() async {
  String datasetPath = 'assets/Symptoms_dataset.csv';
  String datasetContent = await rootBundle.loadString(datasetPath);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(datasetContent);

  // Extract symptom names from the first row (excluding "Disease" column)
  List<String> symptomNames = List.from(csvTable[0]);
  symptomNames.removeAt(0); // Remove "Disease" column name

  return symptomNames;
}
