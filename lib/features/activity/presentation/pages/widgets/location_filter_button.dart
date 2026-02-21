import 'package:flutter/material.dart';

class LocationFilterButton extends StatelessWidget {
  final String? cityLabel;
  final VoidCallback onPressed;
  final VoidCallback? onClear;

  const LocationFilterButton({
    super.key,
    required this.cityLabel,
    required this.onPressed,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: Icon(Icons.location_on),
            label: Text(
              cityLabel ?? 'Pilih Lokasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed,
          ),
        ),
        if (onClear != null)
          IconButton(
            icon: Icon(Icons.delete_forever_rounded, color: Colors.red),
            tooltip: 'Clear lokasi',
            onPressed: onClear,
          ),
      ],
    );
  }
}
