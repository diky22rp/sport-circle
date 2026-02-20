import 'package:flutter/material.dart';
import 'package:sport_circle/core/themes/app_theme.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    final isLoading = name == '-' || email == '-';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppTheme.background,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: AppTheme.primary.withAlpha(25),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.person, size: 40, color: AppTheme.primary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 22,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.only(bottom: 4),
                      ),
                      Container(width: 80, height: 13, color: Colors.grey[300]),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, $name',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
