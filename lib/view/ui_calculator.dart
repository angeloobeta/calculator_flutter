import 'package:calculator_flutter/logic/state/state_managment.dart';
import 'package:calculator_flutter/view/calculator_button.dart';
import 'package:flutter/material.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  State<UserInterface> createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  String? inputValue;
  String? value;
  String? operator;
  double? preValue;

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
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mainState?.inputValue ?? '0',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          GestureDetector(
                              child: const Icon(Icons.backspace_outlined),
                              onTap: () {
                                // setState(() {
                                //   mainState?.inputValue = mainState.inputValue
                                //       ?.substring(0,
                                //           (mainState.inputValue?.length)! - 1);
                                // });
                              })
                        ],
                      ),
                    )),
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttons("C,%,+/-, x"),
                      buttons("7,8,9,/"),
                      buttons("4,5,6,+"),
                      buttons("1,2,3,-"),
                      buttons("0,.,="),
                    ],
                  ))
            ],
          )),
    );
  }

  Widget buttons(String str) {
    List<String> token = str.split(",");
    return CalculatorButton(token: token);
  }
}
