import 'package:flutter/material.dart';

/// NotificationBanner displays a message at the top of the screen.
/// Use for success, error, or info notifications.
class NotificationBanner extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final IconData? icon;

  const NotificationBanner({
    required this.message,
    this.backgroundColor,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.redAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
