import 'package:flutter/material.dart';

/// FloatingActionButtonWidget is a reusable FAB for main actions (e.g., Add Activity).
class FloatingActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;

  const FloatingActionButtonWidget({
    required this.icon,
    this.onPressed,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Icon(icon, color: Colors.white),
    );
  }
}
