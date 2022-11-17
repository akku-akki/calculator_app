import 'package:calculator/calculator.dart';
import 'package:calculator_app/operations_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('paints 4.0 when adding 3 and 1',
          (WidgetTester tester) async {
        when(calculator.add(3, 1)).thenReturn(4);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: OperationsTab(
                calculator: calculator,
              ),
            ),
          ),
        );
        await tester.enterText(find.byKey(const Key('textField_top')), '3');
        await tester.enterText(find.byKey(const Key('textField_bottom')), '1');
        await tester.tap(find.byKey(const Key('ADDITION')));
        await tester.pumpAndSettle();
        expect(find.text('4.0'), findsOneWidget);
        verify(calculator.add(3, 1)).called(1);
      });
    });
  });
}
