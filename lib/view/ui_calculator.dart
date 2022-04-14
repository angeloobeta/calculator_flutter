import 'package:calculator_flutter/logic/state/state_managment.dart';
import 'package:calculator_flutter/view/calculator_button.dart';
import 'package:flutter/material.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  State<UserInterface> createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text("Simple Calculator"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(mainState?.inputValue ?? '0',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          const Icon(Icons.backspace_outlined)
                        ],
                      )),
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("7,8,9,/"),
                        buttons("4,5,6,x"),
                        buttons("1,2,3,+"),
                        buttons("0,.,-"),
                      ],
                    ))
              ],
            )));
  }

  Widget buttons(String str) {
    List<String> token = str.split(",");
    return CalculatorButton(token: token);
  }
}
