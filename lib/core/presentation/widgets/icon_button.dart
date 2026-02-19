import 'package:flutter/material.dart';

/// IconButtonWidget is a customizable icon button for navigation or actions.
class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double size;

  const IconButtonWidget({
    required this.icon,
    this.onPressed,
    this.color,
    this.size = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color ?? Theme.of(context).colorScheme.primary,
        size: size,
      ),
      onPressed: onPressed,
    );
  }
}
