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
  String? _selectedSymptom;
  List<String> _filteredSymptoms = [];

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      _filteredSymptoms = widget.symptoms
          .where((symptom) => symptom
              .toLowerCase()
              .contains(_textEditingController.text.toLowerCase()))
          .toList();
    });
  }

  void _onDropdownSelected(String? value) {
    setState(() {
      _selectedSymptom = value;
      _filteredSymptoms.clear();
      widget.onChanged(_selectedSymptom);

      // Clear the input field after selecting a symptom
      _textEditingController.clear();
    });
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
                _onDropdownSelected(symptom);
                _focusNode.unfocus(); // Clear focus to hide the keyboard
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _textEditingController,
          focusNode: _focusNode,
          onChanged: (value) {
            setState(() {
              _onSearchTextChanged();
            });
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: Icon(Icons.search),
          ),
        ),
        _buildDropdownList(),
      ],
    );
  }
}
