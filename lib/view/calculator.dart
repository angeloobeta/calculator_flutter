import 'package:calculator_flutter/logic/state/state_managment.dart';
import 'package:calculator_flutter/view/ui_calculator.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String? inputValue;
  double? preValue;
  late final String? value;
  String? operator;

  bool isNumber(String str) {
    if (str == 'null') {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void onPressed(String keyValue) {
    switch (keyValue) {
      case "C":
        operator = 'null';
        preValue = 0.0;
        value = "";
        setState(() => inputValue = "");
        break;
      case ".":
      case "%":
      case "<=":
      case "+/-":
        break;
      case "/":
      case "X":
      case "+":
      case "-":
        operator = keyValue;
        value = "";
        preValue = double.tryParse(inputValue!);
        setState(() {
          inputValue = inputValue! + keyValue;
        });
        break;
      case "=":
        if (operator == null) {
          setState(() {
            switch (operator) {
              case "/":
                inputValue =
                    (preValue! / double.parse(value!)).toStringAsFixed(2);
                break;
              case "X":
                inputValue =
                    (preValue! * double.parse(value!)).toStringAsFixed(0);
                break;
              case "+":
                inputValue =
                    (preValue! + double.parse(value!)).toStringAsFixed(0);
                break;
              case "-":
                inputValue =
                    (preValue! - double.parse(value!)).toStringAsFixed(0);
                break;
            }
          });
          operator = "null";
          preValue = double.parse(inputValue!);
          value = "";
          break;
        }
        break;
      default:
        if (isNumber(keyValue)) {
          if (operator != 'null') {
            setState(() {
              inputValue = inputValue! + keyValue;
              value = value! + keyValue;
            });
          } else {
            setState(() => inputValue = "" + keyValue);
            operator = "Z";
          }
        } else {
          onPressed(keyValue);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainState(
      inputValue: inputValue,
      preValue: preValue,
      value: value,
      operator: operator,
      onPressed: onPressed,
      child: const UserInterface(),
    );
  }
}
