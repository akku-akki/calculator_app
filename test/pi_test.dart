import 'package:calculator_app/pi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:calculator/calculator.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('Pi', () {
    testWidgets('render Pi', (WidgetTester tester) async {
      when(calculator.pi()).thenAnswer((realInvocation) =>
          Stream.periodic(Duration(milliseconds: 400), (eventIndex) {
            if (eventIndex == 0) return 3.1;
            if (eventIndex == 1) return 3.14;
            return null;
          }));
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: PiWidget(calculator: calculator))));
      expect(find.text('Calculating pi...'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 400));
      expect(find.text('The Latest known value of pi is 3.1'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 400));
      expect(find.text('The Latest known value of pi is 3.14'), findsOneWidget);
    });
  });
}
