import 'package:flutter/material.dart';

class PaymentMethodDialog extends StatelessWidget {
  final List<Map<String, dynamic>> paymentMethods;
  const PaymentMethodDialog({required this.paymentMethods, super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Pilih Payment Method'),
      children: paymentMethods.map((pm) {
        return SimpleDialogOption(
          onPressed: () => Navigator.of(context).pop(pm["id"] as int),
          child: Row(
            children: [
              Image.network(
                pm["image_url"] as String,
                width: 32,
                height: 32,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.account_balance,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 12),
              Text(pm["name"] as String),
            ],
          ),
        );
      }).toList(),
    );
  }
}
