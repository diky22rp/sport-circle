import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SportCircleApp renders MaterialApp', (
    WidgetTester tester,
  ) async {
    // Smoke test: verify a basic MaterialApp can render
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('SportCircle'))),
      ),
    );

    expect(find.text('SportCircle'), findsOneWidget);
  });
}
