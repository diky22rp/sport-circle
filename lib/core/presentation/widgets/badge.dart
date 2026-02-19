import 'package:flutter/material.dart';

/// Badge is used to show notification counts or status indicators.
class Badge extends StatelessWidget {
  final String? label;
  final Color? color;
  final double size;

  const Badge({this.label, this.color, this.size = 20, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? Colors.redAccent,
        borderRadius: BorderRadius.circular(size),
      ),
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      child: Center(
        child: Text(
          label ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
