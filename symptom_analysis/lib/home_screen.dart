import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<dynamic>> dataset = [];

  Future<void> loadDataset() async {
    try {
      String datasetPath = 'assets/disease_data.csv';
      String data = await rootBundle.loadString(datasetPath);
      List<List<dynamic>> csvTable = CsvToListConverter().convert(data);
      setState(() {
        dataset = csvTable;
      });
    } catch (e) {
      print('Error loading dataset: $e');
    }
  }

  List<String> parseSymptoms(String symptoms) {
    // Remove the brackets and leading/trailing spaces
    symptoms = symptoms.replaceAll('[', '').replaceAll(']', '').trim();
    // Split the symptoms by comma and remove leading/trailing spaces and single quotes of each symptom
    return symptoms
        .split(',')
        .map((symptom) => symptom.trim().replaceAll("'", ''))
        .toList();
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
      body: dataset.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 16.0,
                    columns: dataset[0]
                        .map((item) => DataColumn(label: Text(item)))
                        .toList(),
                    rows: dataset.sublist(1).map((row) {
                      return DataRow(
                        cells: row.map((item) {
                          // Check if the item is in the symptoms column
                          if (row.indexOf(item) == 1) {
                            List<String> symptoms = parseSymptoms(item);
                            return DataCell(Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: symptoms
                                  .map((symptom) => Text(symptom))
                                  .toList(),
                            ));
                          }
                          return DataCell(Text(item));
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
