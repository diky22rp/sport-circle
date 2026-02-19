import 'package:flutter/material.dart';

/// AppDivider is a styled divider for separating sections.
class AppDivider extends StatelessWidget {
  final double thickness;
  final double? indent;
  final double? endIndent;

  const AppDivider({
    this.thickness = 1,
    this.indent,
    this.endIndent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: Colors.grey.shade300,
    );
  }
}
