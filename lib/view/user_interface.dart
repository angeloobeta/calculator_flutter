import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calcutator_button.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  String inputString = " 20 + 25";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Calculator',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(inputString,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                          fontSize: 50)),
                  const Icon(
                    Icons.backspace,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeButton("AC,+/-,/,X"),
                makeButton("7,8,8,-"),
                makeButton("4,5,6,+"),
                makeButton("1,2,3,="),
                makeButton("0,.,%")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeButton(dynamic row) {
    List<String> token = row.split(",");
    return Expanded(
      flex: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: token.map((e) => CalculatorButton(keyValue: e)).toList(),
      ),
    );
  }
}
