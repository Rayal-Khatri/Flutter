import 'package:flutter/material.dart';

class SymptomDropdown extends StatefulWidget {
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
  _SymptomDropdownState createState() => _SymptomDropdownState();
}

class _SymptomDropdownState extends State<SymptomDropdown> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> _filteredSymptoms = [];
  String? _selectedSymptom;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.value ?? '';
    _selectedSymptom = widget.value;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _textEditingController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
          onChanged: (text) {
            setState(() {
              _filteredSymptoms = widget.symptoms
                  .where((symptom) =>
                      symptom.toLowerCase().contains(text.toLowerCase()))
                  .toList();
            });
          },
        ),
        _buildDropdownList(),
      ],
    );
  }

  Widget _buildDropdownList() {
    if (_filteredSymptoms.isEmpty) {
      return SizedBox.shrink();
    }

    return Material(
      elevation: 4.0,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: _filteredSymptoms.length,
          itemBuilder: (BuildContext context, int index) {
            final symptom = _filteredSymptoms[index];
            return ListTile(
              title: Text(symptom),
              onTap: () {
                setState(() {
                  _textEditingController.text = symptom;
                  _focusNode.unfocus(); // Clear focus to hide the keyboard
                  _selectedSymptom = symptom;
                  _filteredSymptoms.clear();
                  widget.onChanged(_selectedSymptom);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
