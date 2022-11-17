import 'package:calculator/calculator.dart';
import 'package:calculator_app/power_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('PowerOfTwo', () {
    testWidgets('renders the result provided by calculator',
        (WidgetTester tester) async {
      when(calculator.powerOfTwo(2))
          .thenAnswer((realInvocation) => Future.value(4.0));
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PowerWidget(calculator: calculator),
        ),
      ));
      await tester.enterText(find.byKey(Key('textField_power_input')), '2');
      await tester.tap(find.byKey(Key('power_button')));
      expect(find.text(''), findsOneWidget);
    });
  });
}
