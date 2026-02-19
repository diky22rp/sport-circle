import 'package:flutter/material.dart';

/// Helper for responsive sizing based on device dimensions.
class ResponsiveHelper {
  final BuildContext context;
  final Size size;

  ResponsiveHelper(this.context) : size = MediaQuery.of(context).size;

  double logoSize({double percent = 0.32, double min = 120, double max = 220}) {
    return (size.width * percent).clamp(min, max);
  }

  double titleFontSize({
    double percent = 0.08,
    double min = 28,
    double max = 40,
  }) {
    return (size.width * percent).clamp(min, max);
  }

  double taglineFontSize({
    double percent = 0.045,
    double min = 14,
    double max = 22,
  }) {
    return (size.width * percent).clamp(min, max);
  }

  double verticalSpacing(double percent) => size.height * percent;
}
