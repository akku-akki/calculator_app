import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    driver?.close();
  });

  test('the values of pi are 3.0, 3.1, 3.14, 3.141', () async {
    await driver.waitFor(find.text('Calculating pi...'));
    await driver.waitFor(find.text('The Latest known value of pi is 3.0'));
    await driver.waitFor(find.text('The Latest known value of pi is 3.1'));
    await driver.waitFor(find.text('The Latest known value of pi is 3.14'));
    await driver.waitFor(find.text('The Latest known value of pi is 3.141'));
  });

  test('multiply 5 and 10 shows 50', () async {
    await driver.takeScreenshot('no_values');
    await driver.tap(find.byValueKey('textField_top'));

    await driver.enterText('5');
    await driver.takeScreenshot('enter5');

    await driver.tap(find.byValueKey('textField_bottom'));
    await driver.enterText('10');
    await driver.takeScreenshot('enter10');

    await driver.tap(find.byValueKey('Multiply'));
    await driver.waitFor(find.text('50.0'));
    await driver.takeScreenshot('result50');
  });
}

extension on FlutterDriver {
  Future<void> takeScreenshot(String name) async {
    final filePath = File('screenshots/$name.png');
    if (await filePath.exists()) {
      await filePath.delete(recursive: true);
    }
    final file = await filePath.create(recursive: true);
    final png = await screenshot();
    file.writeAsBytesSync(png);
    print('ScreenShot with name $name');
  }
}
