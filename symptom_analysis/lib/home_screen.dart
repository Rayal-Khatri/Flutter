import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<dynamic>> data = [];

  Future<void> loadAsset() async {
    final csvData = await rootBundle.loadString('assets/disease_data.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
    setState(() {
      data = csvTable;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Analysis'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: data.isNotEmpty
            ? DataTable(
                columns: List<DataColumn>.generate(
                  data[0].length,
                  (index) => DataColumn(
                    label: Text(data[0][index].toString()),
                  ),
                ),
                rows: List<DataRow>.generate(
                  data.length > 1 ? data.length - 1 : 0,
                  (index) => DataRow(
                    cells: List<DataCell>.generate(
                      data[index + 1].length,
                      (cellIndex) => DataCell(
                        Text(data[index + 1][cellIndex].toString()),
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: Text('No data available'),
              ),
      ),
    );
  }
}
