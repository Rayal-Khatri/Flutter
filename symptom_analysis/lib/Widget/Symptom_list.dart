import 'package:flutter/material.dart';

class SymptomList extends StatelessWidget {
  final List<String> selectedSymptoms;
  final Function(String) onRemove;

  const SymptomList(
      {Key? key, required this.selectedSymptoms, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: selectedSymptoms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedSymptoms[index]),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => onRemove(selectedSymptoms[index]),
            ),
          );
        },
      ),
    );
  }
}
