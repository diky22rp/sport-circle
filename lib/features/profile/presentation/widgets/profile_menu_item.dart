import 'package:flutter/material.dart';
import 'package:sport_circle/core/themes/app_theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppTheme.primary : AppTheme.text;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: AppTheme.primary.withAlpha(25),
        highlightColor: AppTheme.primary.withAlpha(25),
        child: ListTile(
          leading: Icon(icon, color: color, size: 22),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: color,
              fontWeight: isDestructive ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 20,
            color: Colors.black26,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
