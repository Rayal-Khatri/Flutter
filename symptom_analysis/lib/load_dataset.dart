import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<String>> loadDataset() async {
  String datasetPath = 'assets/disease_data.csv';
  String datasetContent = await rootBundle.loadString(datasetPath);
  List<List<dynamic>> csvTable = CsvToListConverter().convert(datasetContent);

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

  List<String> symptoms = allSymptoms.cast<String>();
  return symptoms;
}
