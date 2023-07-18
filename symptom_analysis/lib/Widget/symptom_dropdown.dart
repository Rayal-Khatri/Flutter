import 'package:flutter/material.dart';

class SymptomDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> symptoms;
  final ValueChanged<String?> onChanged;

  const SymptomDropdown({
    Key? key,
    this.hint = 'Select Symptoms',
    this.value,
    required this.symptoms,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(hint),
      value: value,
      onChanged: onChanged,
      items: symptoms.map<DropdownMenuItem<String>>((String symptom) {
        return DropdownMenuItem<String>(
          value: symptom,
          child: Text(symptom),
        );
      }).toList(),
    );
  }
}
