import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

class PiWidget extends StatefulWidget {
  final Calculator calculator;
  const PiWidget({Key key, this.calculator}) : super(key: key);

  @override
  State<PiWidget> createState() => _PiWidgetState();
}

class _PiWidgetState extends State<PiWidget> {
  String _result;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.calculator.pi(),
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          _result = snapshot.data.toString();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _result != null
                  ? 'The Latest known value of pi is $_result'
                  : 'Calculating pi...',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        );
      },
    );
  }
}
