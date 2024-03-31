import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:unit_converter_flutter_app/main.dart';

void main() {
  testWidgets('Unit Converter Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(UnitConverterApp());

    // Verify that the title 'Unit Converter' is present.
    expect(find.text('Unit Converter'), findsOneWidget);

    // Verify that the initial unit selected is 'Meter' for both dropdowns.
    expect(find.text('Meter'), findsNWidgets(2));

    // Enter input value in TextField.
    await tester.enterText(find.byType(TextField), '10');

    // Verify that the input value appears in the TextField.
    expect(find.text('10'), findsOneWidget);

    // Tap the 'Convert' button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the result is displayed.
    expect(find.text('Result: '), findsOneWidget);

    // Tap the 'Switch Converter' button.
    await tester.tap(find.byType(ElevatedButton).last);
    await tester.pump();

    // Verify that the title changes to 'Unit Converter' again.
    expect(find.text('Unit Converter'), findsOneWidget);

    // Verify that the initial unit selected is 'Meter' for both dropdowns again.
    expect(find.text('Meter'), findsNWidgets(2));
  });
}
