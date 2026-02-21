import 'package:flutter/material.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

class OrganizerInfoRow extends StatelessWidget {
  final ActivityEntity activity;
  const OrganizerInfoRow({required this.activity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          child: Text(
            activity.organizer.name.isNotEmpty
                ? activity.organizer.name[0]
                : '?',
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hosted by ${activity.organizer.name}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              activity.organizer.email,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
