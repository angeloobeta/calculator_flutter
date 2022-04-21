import 'package:calculator_flutter/logic/state/state_managment.dart';
import 'package:calculator_flutter/view/ui_calculator.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String inputValue = "";
  late String value = "";
  late String operator = "";
  late double preValue = 0.0;
  late String prevOperator = "";
  late bool activateOperator;

  bool isNumber(String str) {
    if ({'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}.contains(str)) {
      return true;
    }
    return false;
  }

  void onPressed(String? keyValue) {
    switch (keyValue) {
      case "AC":
        operator = "";
        preValue = 0.0;
        value = "";
        activateOperator = false;
        setState(() => inputValue = "");
        break;
      case ".":
      case "%":
      case "+/-":
        break;
      case "/":
      case "x":
      case "+":
      case "-":
        if (activateOperator != true) {
          preValue = double.parse(value);
          value = "";
          inputValue = "";
          prevOperator = keyValue!;
          setState(() {
            operator = keyValue!;
          });
          activateOperator = true;
          inputValue = "";
          break;
        } else {
          setState(() {
            switch (prevOperator) {
              case "/":
                preValue = double.parse(
                    (preValue / double.parse(value)).toStringAsFixed(2));
                inputValue = preValue.toStringAsFixed(2);
                break;
              case "x":
                preValue = double.parse(
                    (preValue * double.parse(value)).toStringAsFixed(0));
                inputValue = preValue.toStringAsFixed(0);
                break;
              case "+":
                preValue = double.parse(
                    (preValue + double.parse(value)).toStringAsFixed(0));
                inputValue = preValue.toStringAsFixed(0);
                break;
              case "-":
                preValue = double.parse(
                    (preValue - double.parse(value)).toStringAsFixed(0));
                inputValue = preValue.toStringAsFixed(0);
                break;
            }
          });
          prevOperator = operator;
        }
        break;

      case "=":
        // if (operator != null) {
        //   setState(() {
        //     switch (operator) {
        //       case "/":
        //         inputValue =
        //             (preValue / double.parse(value)).toStringAsFixed(2);
        //         break;
        //       case "x":
        //         inputValue =
        //             (preValue * double.parse(value)).toStringAsFixed(0);
        //         break;
        //       case "+":
        //         inputValue =
        //             (preValue + double.parse(value)).toStringAsFixed(0);
        //         break;
        //       case "-":
        //         inputValue =
        //             (preValue - double.parse(value)).toStringAsFixed(0);
        //         break;
        //     }
        //   });
        //   operator = "";
        //   preValue = double.parse(inputValue);
        //   value = "";
        //   break;
        // }
        break;
      default:
        if (isNumber(keyValue!)) {
          if ({'+', '-', '*', '/'}.contains(prevOperator)) {
            setState(() {
              inputValue = inputValue + keyValue;
            });
          } else {
            setState(() {
              inputValue = inputValue + keyValue;
            });
            preValue = double.parse(inputValue);
            value = value + inputValue;
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
