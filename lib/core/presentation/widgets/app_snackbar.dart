import 'package:flutter/material.dart';

enum AppSnackbarType { success, error, info, warning }

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    AppSnackbarType type = AppSnackbarType.info,
    Color? backgroundColor,
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    Color color;
    IconData iconData;

    switch (type) {
      case AppSnackbarType.success:
        color = backgroundColor ?? theme.colorScheme.primary;
        iconData = icon ?? Icons.check_circle;
        break;
      case AppSnackbarType.error:
        color = backgroundColor ?? theme.colorScheme.error;
        iconData = icon ?? Icons.error;
        break;
      case AppSnackbarType.warning:
        color = backgroundColor ?? Colors.orange;
        iconData = icon ?? Icons.warning;
        break;
      case AppSnackbarType.info:
        color = backgroundColor ?? theme.colorScheme.secondary;
        iconData = icon ?? Icons.info;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(iconData, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        duration: const Duration(seconds: 3),
        elevation: 6,
      ),
    );
  }
}
