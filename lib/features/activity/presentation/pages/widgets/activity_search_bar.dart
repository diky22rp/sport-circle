import 'package:flutter/material.dart';

class ActivitySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFocused;
  final Function(String) onChanged;

  const ActivitySearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.all(isFocused ? 32.0 : 16.0),
      child: Material(
        elevation: isFocused ? 8 : 0,
        borderRadius: BorderRadius.circular(isFocused ? 24 : 16),
        color: Colors.white,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(
            fontSize: isFocused ? 20 : 16,
            fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, size: isFocused ? 28 : 24),
            hintText: 'Find your game',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(isFocused ? 24 : 16),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: isFocused ? 24 : 16,
              horizontal: isFocused ? 24 : 16,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
