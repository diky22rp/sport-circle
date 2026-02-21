import 'package:flutter/material.dart';

class ParticipantsList extends StatelessWidget {
  final List participants;
  const ParticipantsList({required this.participants, super.key});

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) {
      return const Text(
        'No participants yet.',
        style: TextStyle(color: Colors.grey),
      );
    }
    return Column(
      children: participants
          .map<Widget>(
            (p) => ListTile(
              leading: CircleAvatar(
                child: Text(p.user.name.isNotEmpty ? p.user.name[0] : '?'),
              ),
              title: Text(p.user.name),
              subtitle: Text(p.user.email),
            ),
          )
          .toList(),
    );
  }
}
