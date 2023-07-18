import 'package:flutter/material.dart';

class SymptomList extends StatelessWidget {
  final List<String> selectedSymptoms;

  const SymptomList({Key? key, required this.selectedSymptoms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: selectedSymptoms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedSymptoms[index]),
          );
        },
      ),
    );
  }
}
