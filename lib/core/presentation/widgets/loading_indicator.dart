import 'package:flutter/material.dart';

/// LoadingIndicator is a reusable spinner for loading states.
class LoadingIndicator extends StatelessWidget {
  final bool isOverlay;

  const LoadingIndicator({super.key, this.isOverlay = false});

  @override
  Widget build(BuildContext context) {
    if (isOverlay) {
      return const Center(child: CircularProgressIndicator());
    }
    return const SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
