import 'package:flutter/material.dart';

/// Avatar displays a user's profile picture or initials.
class Avatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double radius;

  const Avatar({this.imageUrl, this.initials, this.radius = 40, super.key});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: Colors.grey.shade200,
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Text(
        (initials ?? '?').toUpperCase(),
        style: const TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
