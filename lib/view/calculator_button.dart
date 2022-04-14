import 'package:calculator_flutter/logic/state/state_managment.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  List<String>? token;
  CalculatorButton({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return Row(
      children: token!
          .map(
            (_value) => Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                      style: const ButtonStyle(),
                      child: Text(_value,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      onPressed: () {
                        mainState?.onPressed!(_value);
                      })),
            ),
          )
          .toList(),
    );
  }
}
