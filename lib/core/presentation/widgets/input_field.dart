import 'package:flutter/material.dart';

/// InputField is a reusable text field for forms and search bars.
/// It supports password, icons, and validation.
class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool isMandatory;

  const InputField({
    super.key,
    required this.label,
    this.controller,
    this.isPassword = false,
    this.icon,
    this.hint,
    this.errorText,
    this.keyboardType,
    this.enabled = true,
    this.isMandatory = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: isMandatory ? '$label *' : label,
        hintText: hint,
        errorText: errorText,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade100,
      ),
    );
  }
}
