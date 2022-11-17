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
      print('Testing 1');
      when(calculator.pi()).thenAnswer((realInvocation) =>
          Stream.periodic(Duration(milliseconds: 400), (eventIndex) {
            if (eventIndex == 0) return 3.1;
            if (eventIndex == 1) return 3.14;
            return null;
          }));
      print('Testing 2');

      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: PiWidget(calculator: calculator))));
      print('Testing 3');

      expect(find.text('Calculating pi...'), findsOneWidget);
      print('Testing 4');

      await tester.pumpAndSettle(Duration(milliseconds: 400));
      print('Testing 5');

      expect(find.text('The Latest known value of pi is 3.1'), findsOneWidget);
      print('Testing 6');

      await tester.pumpAndSettle(Duration(milliseconds: 400));
      print('Testing 7');

      expect(find.text('The Latest known value of pi is 3.14'), findsOneWidget);
    });
  });
}
