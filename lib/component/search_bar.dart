import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final ValueChanged<String> onTextChanged;

  SearchBar({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _textEditingController,
        onChanged: onTextChanged,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _textEditingController.clear();
              onTextChanged('');
            },
          ),
        ),
      ),
    );
  }
}
