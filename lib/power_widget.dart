import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

class PowerWidget extends StatefulWidget {
  final Calculator calculator;
  PowerWidget({Key key, this.calculator}) : super(key: key);

  @override
  State<PowerWidget> createState() => _PowerWidgetState();
}

class _PowerWidgetState extends State<PowerWidget> {
  final _input3Controller = TextEditingController();
  final _input4Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            key: Key('textField_power_input'),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input #2',
            ),
            controller: _input3Controller,
            keyboardType: TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
        ),
        ElevatedButton(
          key: Key('power_button'),
          onPressed: () async {
            final value = _input3Controller.text;
            final result =
                await widget.calculator.powerOfTwo(double.tryParse(value));
            _input4Controller.text = result.toString();
            setState(() {
              
            });
          },
          child: Text('GET POWER'),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            key: Key('textField_power_output'),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input #2',
            ),
            controller: _input4Controller,
            keyboardType: TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
        ),
      ],
    );
    ;
  }
}
