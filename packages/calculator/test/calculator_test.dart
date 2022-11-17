import 'dart:math';

import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('Calculator Tests', () {
    group('add', () {
      test('returns 45 adding 40 and 5 ', () {
        expect(calculator.add(40, 5), 45);
      });

      test('returns 5 adding 4 and 1 ', () {
        expect(calculator.add(4, 1), 5);
      });
    });

    group('subtract', () {
      test('returns 35 minus 40 and 5 ', () {
        expect(calculator.substract(40, 5), 35);
      });

      test('returns 3 minus 4 and 1 ', () {
        expect(calculator.substract(4, 1), 3);
      });
    });

    group('mul', () {
      test('returns 20 mul 4 and 5 ', () {
        expect(calculator.multiply(4, 5), 20);
      });

      test('returns 4 adding 4 and 1 ', () {
        expect(calculator.multiply(4, 1), 4);
      });
    });

    group('divide', () {
      test('Divide by Zero Error', () {
        expect(() => calculator.divide(27, 0), throwsArgumentError);
      });

      test('4/2 => 2', () {
        expect(calculator.divide(4, 2), 2);
      });
    });

    group('powerOfTwo', () {
      test('returns 81 when input is 9', () async {
        expect(await calculator.powerOfTwo(9), 81);
      });
    });

    group('PI', () {
      test('emits [3, 3.1, 3.14, 3.141] in Order', () {
        expect(calculator.pi(), emitsInOrder([3, 3.1, 3.14, 3.141]));
      });
    });
  });
}
