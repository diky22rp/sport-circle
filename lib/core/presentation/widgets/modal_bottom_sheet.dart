import 'package:flutter/material.dart';

/// ModalBottomSheet is a reusable modal for actions, info, or confirmation.
class ModalBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    double? minHeight,
    double? maxHeight,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      constraints: BoxConstraints(
        minHeight: minHeight ?? 120,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (_) => child,
    );
  }
}
