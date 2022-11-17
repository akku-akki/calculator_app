import 'package:calculator/calculator.dart';
import 'package:calculator_app/main.dart';
import 'package:calculator_app/operations_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorApp', () {
    testWidgets('matches golden file', (tester) async {
      await tester.pumpWidget(CalculatorApp(calculator: Calculator()));
      await expectLater(
          find.byType(CalculatorApp), matchesGoldenFile('goldens/calculator_app.png'));
    });

    testWidgets('renders four widgets of type TwoDigitOperations',
        (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp(calculator: Calculator()));
      expect(find.byType(OperationsTab), findsNWidgets(1));
      expect(find.byType(TextField), findsNWidgets(4));
    });
    testWidgets('there are zero buttons in the screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp(calculator: Calculator()));
      expect(find.byType(Chip), findsNothing);
    });
  });

  group('add', () {
    testWidgets('shows result when given two numbers',
        (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp(calculator: Calculator()));
      final topTextFieldFinder = find.byKey(Key('textField_top'));
      final bottomTextFieldFinder = find.byKey(Key('textField_bottom'));
      final optionSelector = find.byKey(Key('operation_selector'));
      await tester.ensureVisible(topTextFieldFinder);
      await tester.tap(topTextFieldFinder);
      await tester.enterText(topTextFieldFinder, '3');
      await tester.ensureVisible(bottomTextFieldFinder);
      await tester.tap(bottomTextFieldFinder);
      await tester.enterText(bottomTextFieldFinder, '6');
      await tester.ensureVisible(optionSelector);
      await tester.tap(find.byKey(Key('ADDITION')));
      await tester.pumpAndSettle();
      expect(find.text('9.0'), findsOneWidget);
    });
  });
}
