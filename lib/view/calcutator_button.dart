import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String keyValue;
  const CalculatorButton({Key? key, required this.keyValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        shape: Border.all(
            color: Colors.white, width: 2.0, style: BorderStyle.solid),
        onPressed: () {},
        child: Text(
          keyValue,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
